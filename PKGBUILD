pkgname=yubikey-touch-detector
pkgver=1.0.3
pkgrel=1
pkgdesc='A tool that can detect when your YubiKey is waiting for a touch'
arch=('i686' 'x86_64')
url='https://github.com/maximbaz/yubikey-touch-detector'
license=('MIT')
makedepends=('go')
optdepends=('gnupg: for GPG'
            'openssh: for SSH'
            'pam_u2f-git: for U2F (use patched version!)')
install=yubikey-touch-detector.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/maximbaz/yubikey-touch-detector/releases/download/$pkgver/$pkgname-src.tar.gz"
        "$pkgname-$pkgver.tar.gz::https://github.com/maximbaz/yubikey-touch-detector/releases/download/$pkgver/$pkgname-src.tar.gz.sig"
        'PKGBUILD.sig')
sha256sums=('29954e91d3b2fb97ed6528e3fa08acf62ec6b9b9caaea01d9bfe8cf6e7c34295'
            'SKIP'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

build() {
  export GOPATH="$(pwd)/.go"

  go_pkgname="github.com/maximbaz/yubikey-touch-detector"
  go_pkgpath="$GOPATH/src/$go_pkgname"
  mkdir -p "$(dirname $go_pkgpath)"
  ln -sf "$srcdir/$pkgname" "$go_pkgpath"

  cd "$go_pkgpath"
  go build
}

package() {
  cd "$srcdir/$pkgname"
  install -D yubikey-touch-detector "$pkgdir/usr/bin/yubikey-touch-detector"
  install -D yubikey-touch-detector.service "$pkgdir/usr/lib/systemd/user/yubikey-touch-detector.service"
}
