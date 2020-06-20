# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge-git
_pkgname=yabridge
pkgver=1.2.1.r0.g6a01856
pkgrel=1
pkgdesc="Yet Another VST bridge, run Windows VST2 plugins under Linux"
arch=('x86_64')
url="https://github.com/robbert-vdh/yabridge"
license=('GPL3')
depends=('wine' 'boost'  'libxcb' 'lib32-boost-libs>=1.72.0' 'lib32-libxcb')
makedepends=('meson' 'ninja')
provides=('yabridge')
conflicts=('yabridge')
install=yabridge.install
source=('git+https://github.com/robbert-vdh/yabridge')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  # If you don't want to build lib32-boost-libs and you don't need the 32-bit
  # bitbridge, then you can leave out the dependency for it and set the
  # `use-bitbridge` option to false.
  options=(--buildtype=release -Dwith-bitbridge=true)

  # Meson won't apply any new options when this is not a clean build
  if [[ -d build ]]; then
    meson setup --reconfigure "${options[@]}" build
  else
    meson setup --cross-file cross-wine.conf "${options[@]}" build
  fi

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
