# Contributor: Heine Pedersen <heinep at gmail dot com>
# Contributor: Thaodan AUR+me@thaodan.de

pkgname=php-systemd
pkgver=0.1.2
pkgrel=5

pkgdesc="PHP extension allowing native interaction with systemd and its journal"
arch=("any")
url="https://github.com/systemd/php-systemd"
license=("MIT")
makedepends=("php"
            "systemd")
depends=("libsystemd")
backup=("etc/php/conf.d/systemd.ini")

source=("https://github.com/systemd/php-systemd/archive/release-${pkgver}.zip" 
        "php7-support.patch" 
        "fix-systemd-include-path.patch"
        "fix-file-macro.patch"
        "systemd.ini")
sha512sums=('c2d8ec02b49630ebf51106f6113674b4bed130ae92a1e87b9349f90f28fa3b5f435efd5e4f86e76265aa27b5ef864ef0100f20b8a2e9b7f65c5612a35948b9c7'
            '550f8068e5d0ea0f7af40164f8fc19ccf0453ec2ac07aa32d9ea09786888cb86c0b42c10258b3c7ebed80cdb3cac447e1a1e80a0407f59d68932cd454ed6cf10'
            '9c83e357e5ff160120d004c2abe8c9f4c34043a3f2962d55a4801f79fc14e06b023f3af793d89b43a201164fbe96c74c8dcfd427f40201fe44acb232b2d77271'
            '67c275c76a478792ea1c68a908ef81a6ef72da9d7b1dd7f9c382d9f5cc672b47f5d48ab288a064f73831e90fc4d91adfb23d86b70ded61073cfa3fa2338a9dca'
            '86155fd1ea7eec8e6d1dfb292633c7731df1180bbb9988bb409a9bc0316fb597f5398e6956788bb3fb9bad15612fceef7742b877af0996e4c255d2952628b3e4')



prepare() {
  cd ${srcdir}/${pkgname}-release-${pkgver}
  patch -p0 < ../fix-systemd-include-path.patch
  patch -p0 < ../php7-support.patch
  patch -p0 < ../fix-file-macro.patch
  sed -ie 's/ZEND_NUM_ARGS() TSRMLS_CC/ZEND_NUM_ARGS()/' systemd.c
  phpize
}

build() {
  cd ${srcdir}/${pkgname}-release-${pkgver}
  phpize
  ./configure --prefix=/usr --with-systemd
  make
}

package() {
  cd ${srcdir}/${pkgname}-release-${pkgver}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm644 ${srcdir}/systemd.ini ${pkgdir}/etc/php/conf.d/systemd.ini
  install -Dm644 modules/systemd.so ${pkgdir}/usr/lib/php/modules/systemd.so
}

# vim:set ts=2 sw=2 et:
