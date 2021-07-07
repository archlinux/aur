# Maintainer: <peter at typeblog dot net>

pkgname=firefox-pwa
_pkgname="FirefoxPWA"
pkgdesc='A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox. (native component)'
pkgver=0.3.1
pkgrel=1
arch=('x86_64')
url="https://github.com/filips123/FirefoxPWA"
license=('MPL2')
depends=('firefox')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/filips123/FirefoxPWA/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be58235831f287435a98f22095cbe37bd6dea671bc9c6a224b301270e4534f2a')

prepare() {
  cd $srcdir/$_pkgname-$pkgver/native
  sed -i "s/version = \"0.0.0\"/version = \"$pkgver\"/" Cargo.toml
}

build() {
  cd $srcdir/$_pkgname-$pkgver/native
  RUSTUP_TOOLCHAIN=stable cargo build --release --target-dir=target
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -Dm755 native/target/release/firefoxpwa $pkgdir/usr/bin/firefoxpwa
  install -Dm755 native/target/release/firefoxpwa-connector $pkgdir/usr/libexec/firefoxpwa-connector
  install -Dm644 native/manifests/linux.json $pkgdir/usr/lib/mozilla/native-messaging-hosts/firefoxpwa.json
  mkdir -p $pkgdir/usr/share/firefoxpwa
  cp -r native/userchrome $pkgdir/usr/share/firefoxpwa/
  chmod -R 755 $pkgdir/usr/share/firefoxpwa
  mkdir -p $pkgdir/usr/share/firefoxpwa/runtime
  chmod 777 $pkgdir/usr/share/firefoxpwa/runtime
}
