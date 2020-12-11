# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge-git
_pkgname=yabridge
pkgver=2.2.0.r0.gd0b9f1a
pkgrel=1
pkgdesc="Yet Another VST bridge, run Windows VST2 plugins under Linux"
arch=('x86_64')
url="https://github.com/robbert-vdh/yabridge"
license=('GPL3')
depends=('wine' 'boost'  'libxcb' 'lib32-boost-libs>=1.72.0' 'lib32-libxcb')
makedepends=('wine<6.0' 'meson' 'ninja')
optdepends=('yabridgectl: utility for setting up and managing yabridge')
provides=('yabridge')
conflicts=('yabridge')
options=('!strip')
install=yabridge.install
source=('git+https://github.com/robbert-vdh/yabridge')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  # Meson won't apply any new options or update wraps if they already exist, so
  # if we're building from a dirty src/ directory we'll just nuke any cached
  # files
  if [[ -d build ]]; then
    rm -rf build

    # Can't use `git clean` here since the entire src/ directory will be
    # gitignored
    find ./subprojects -mindepth 1 -maxdepth 1 -type d -exec rm -rf '{}' ';'
  fi

  # If you don't want to build lib32-boost-libs and you don't need the 32-bit
  # bitbridge, then you can leave out the dependency for it and set the
  # `use-bitbridge` option to false.
  meson setup --cross-file cross-wine.conf --buildtype=release -Dwith-bitbridge=true build

  ninja -C build
}

package() {
  cd "$_pkgname/build"

  install -dm755 "${pkgdir}"/usr/bin
  install yabridge-{host,group}.exe{,.so} "${pkgdir}"/usr/bin
  install yabridge-{host,group}-32.exe{,.so} "${pkgdir}"/usr/bin

  install -dm755 "${pkgdir}"/usr/lib
  install libyabridge.so "${pkgdir}"/usr/lib
}

# vim:set ts=2 sw=2 et:
