# Maintainer: Your Name <youremail@domain.com>
pkgname=gotosocial
pkgver=0.3.3
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/superseriousbusiness/gotosocial"
license=('AGPL')
depends=('glibc')
makedepends=('go' 'sqlite')
optdepends=('gotosocial-admin')
provides=('gotosocial')
conflicts=('gotosocial-bin' 'gotosocial-git')
backup=(etc/gotosocial/config.yaml)
install=
source=($pkgname-$pkgver.tar.gz::https://github.com/superseriousbusiness/gotosocial/archive/refs/tags/v${pkgver}.tar.gz
		$pkgname.sysusers
		$pkgname.tmpfiles)
md5sums=('bc8d8f7eff186773032e68524b47669b'
         '925c1480260867df815c70d143ec0f61'
         '01d73463258c4f85aa50c2ed0577632c')
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
  install -dm 755 $pkgdir/usr/{bin,share/$pkgname/storage/certs}

  cd "$pkgname-$pkgver"
  cd cmd/gotosocial
#  install -Dm 644 $pkgname $pkgdir/usr/share/$pkgname/$pkgname
  install -Dm 644 $pkgname $pkgdir/usr/bin/$pkgname

  cd ../../example
  install -Dm 644 config.yaml $pkgdir/usr/share/$pkgname/config.yaml
  install -Dm 644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
  
  cd ..
  cp -r web $pkgdir/usr/share/$pkgname/
  
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -Dm 0644 "${srcdir}/$pkgname.sysusers" "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 0644 "${srcdir}/$pkgname.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"

  ln -s /usr/bin/$pkgname $pkgdir/usr/share/$pkgname/$pkgname
}
