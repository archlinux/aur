# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge
pkgver=1.4.0
pkgrel=1
pkgdesc="Yet Another VST bridge, run Windows VST2 plugins under Linux"
epoch=
arch=('x86_64')
url="https://github.com/robbert-vdh/yabridge"
license=('GPL3')
depends=('wine' 'boost'  'libxcb' 'lib32-boost-libs>=1.72.0' 'lib32-libxcb')
optdepends=('yabridgectl: utility for setting up and managing yabridge')
makedepends=('meson' 'ninja')
install=yabridge.install
source=("https://github.com/robbert-vdh/yabridge/archive/$pkgver.tar.gz")
sha256sums=('f28310e41f50dea0e4d4ba63a8ec68e075989e6be1120e1c80f52fa5485a8fb6')

build() {
  cd "$pkgname-$pkgver"

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
  cd "$pkgname-$pkgver/build"

  install -dm755 "${pkgdir}"/usr/bin
  install yabridge-{host,group}.exe{,.so} "${pkgdir}"/usr/bin
  install yabridge-{host,group}-32.exe{,.so} "${pkgdir}"/usr/bin

  install -dm755 "${pkgdir}"/usr/lib
  install libyabridge.so "${pkgdir}"/usr/lib
}

# vim:set ts=2 sw=2 et:
