pkgname=yubikey-touch-detector
pkgver=1.0.0
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
        "$pkgname-$pkgver.tar.gz::https://github.com/maximbaz/yubikey-touch-detector/releases/download/$pkgver/$pkgname-src.tar.gz.sig")
sha256sums=('42432b5c54ff771a5fc55b0b388fe6598a7849a837bc96f53dcc960719ae1bc0'
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
