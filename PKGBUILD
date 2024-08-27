# Maintainer: hellopoisonx <x1665341912@gmail.com>
pkgname='clash-flutter-git'
pkgver=0.2.1
pkgrel=2
pkgdesc='A Flutter based GUI for Clash.Meta kernel'
arch=('x86_64' 'i386' 'aarch64' 'armv7h' 'riscv64' 'loong64')
url='https://github.com/hellopoisonx/clash-flutter'
license=('MIT')
conflicts=("$pkgname-bin" "$pkgname-alpha" "$pkgname-alpha-bin" "$pkgname-alpha-git" "clash-flutter")
depends=(
  'clash-meta' # AUR
  'polkit'
  'zenity'
)
makedepends=('fvm' 'git')
provides=('clash-flutter')

source=("clash-flutter::git+https://github.com/hellopoisonx/clash-flutter" "Country.mmdb::https://github.com/Dreamacro/maxmind-geoip/releases/download/20240812/Country.mmdb")

function build() {
  cd "${srcdir}/clash-flutter" || exit
  fvm install
  fvm flutter pub get
  fvm dart run build_runner build
  fvm flutter build linux --release
}

function package() {
  install -Dm644 "${srcdir}/Country.mmdb" "${pkgdir}/etc/clash-flutter/Country.mmdb"
  cd "${srcdir}/clash-flutter/build/linux/x64/release/bundle" || exit
  install -Dm755 "./clash_flutter" "${pkgdir}/usr/share/clash-flutter/clash-flutter"
  cp --reflink=auto -r lib/ "${pkgdir}/usr/share/clash-flutter/"
  cp --reflink=auto -r data/ "${pkgdir}/usr/share/clash-flutter/"
  install -Dm755 "${srcdir}/clash-flutter/clash-flutter-launcher" "${pkgdir}/usr/bin/clash-flutter-launcher"
  install -Dm644 "${srcdir}/clash-flutter/clash-flutter.desktop" "${pkgdir}/usr/share/applications/clash-flutter.desktop"
  install -Dm644 "${srcdir}/clash-flutter/LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  chmod 664 "${pkgdir}/etc/clash-flutter"
}
sha256sums=('SKIP'
  'c17e6a0592307461733a5938d920ecf13e10843a2f109eadc328215ff2518236')
