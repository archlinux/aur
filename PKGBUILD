# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gotosocial
pkgver=0.3.8
pkgrel=1
pkgdesc="ActivityPub social network server written in Golang"
arch=('x86_64')
url="https://github.com/superseriousbusiness/gotosocial"
license=('AGPL')
depends=('glibc')
makedepends=('go' 'sqlite')
optdepends=('gotosocial-admin')
backup=(etc/gotosocial/config.yaml)
install=
source=($pkgname-$pkgver.tar.gz::https://github.com/superseriousbusiness/gotosocial/archive/refs/tags/v${pkgver}.tar.gz
		$pkgname.sysusers
		$pkgname.tmpfiles)
sha256sums=('c93249215abb0c0fc63deef985f127a659ccbc271be925466628ce21db234fea'
            '645be6b03db100ed03fd2a8951b94ff9808c3e56d6cf5d3fc3b1a47dd7ef1c01'
            '2570408818f9966c3e9a86672c4cb90c0e1e22678a36b2354e66c866a25a4202')
prepare(){
  cd "$pkgname-$pkgver"
  cd example
  sed -i 's@ExecStart=/gotosocial/gotosocial@ExecStart=gotosocial@g' gotosocial.service
  sed -i 's@config.yaml@/usr/share/gotosocial/config.yaml@g' gotosocial.service
  sed -i 's@WorkingDirectory=/gotosocial@WorkingDirectory=/usr/share/gotosocial@g' gotosocial.service
}

build() {
  cd "$pkgname-$pkgver"
  cd cmd/gotosocial
  go build
}

package() {
  install -dm 755 "$pkgdir"/usr/{bin,share/$pkgname/storage/certs}

  cd "$pkgname-$pkgver"
  cd cmd/gotosocial
#  install -Dm 644 $pkgname "$pkgdir"/usr/share/$pkgname/$pkgname
  install -Dm 644 $pkgname "$pkgdir"/usr/bin/$pkgname

  cd ../../example
  install -Dm 644 config.yaml "$pkgdir"/usr/share/$pkgname/config.yaml
  install -Dm 644 $pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  
  cd ..
  cp -r web "$pkgdir"/usr/share/$pkgname/
  
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -Dm 0644 "$srcdir"/$pkgname.sysusers "$pkgdir"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm 0644 "$srcdir"/$pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf

  ln -s /usr/bin/$pkgname "$pkgdir"/usr/share/$pkgname/$pkgname
}
