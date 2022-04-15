# Contributor: Heine Pedersen <heinep at gmail dot com>
# Contributor: Thaodan AUR+me@thaodan.de

pkgname=php-systemd
pkgver=0.1.2
pkgrel=6

pkgdesc="PHP extension allowing native interaction with systemd and its journal"
arch=("any")
url="https://github.com/systemd/php-systemd"
license=("MIT")
makedepends=("php"
            "systemd")
depends=("libsystemd")
backup=("etc/php/conf.d/systemd.ini")
source=("https://github.com/systemd/php-systemd/archive/release-${pkgver}.zip"
        '0001-Fixes-outdated-build-config.patch'
        '0002-Updates-build-instructions-and-example.patch'
        '0003-Updates-example.patch'
        '0004-Adds-fixes-for-PHP-7.0.patch'
        '0005-Define-SD_JOURNAL_SUPPRESS_LOCATION.-Fixes-2.patch'
        '0006-Provide-arginfo.patch'
        "systemd.ini")
md5sums=('986a24e147ae2a816ee315edb0b2e856'
         'db88453f4d1c254be84c941961b2e5bc'
         '04f8dec9d734456468acf258e36edb29'
         '7f91d23f7c029668ee2929acc4558524'
         'ba5e6ce2dc5cf74736b1d811b7e57ead'
         'ed934935ee94b7544f6ffdf8232c9695'
         'd9ce19b36ddd0edda815be3022356473'
         '2ad951af42f6957ac3bc1ff4f151e363')




prepare() {
  cd ${srcdir}/${pkgname}-release-${pkgver}

  patch -p1 -i "${srcdir}/0001-Fixes-outdated-build-config.patch"
  patch -p1 -i "${srcdir}/0002-Updates-build-instructions-and-example.patch"
  patch -p1 -i "${srcdir}/0003-Updates-example.patch"
  patch -p1 -i "${srcdir}/0004-Adds-fixes-for-PHP-7.0.patch"
  patch -p1 -i "${srcdir}/0005-Define-SD_JOURNAL_SUPPRESS_LOCATION.-Fixes-2.patch"patch -p1 -i "${srcdir}/0006-Provide-arginfo.patch"

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
