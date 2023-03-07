# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: plenae
# Contributor: Spencer Muise <smuise@spencermuise.ca>

pkgname=calibre-web
pkgver=0.6.19
pkgrel=3
pkgdesc="Web app for browsing, reading and downloading eBooks stored in a Calibre database"
arch=('any')
url="https://github.com/janeczku/calibre-web"
license=('GPL3')
makedepends=('patchutils')
depends=(
  'python'
  'python-advocate'
  'python-babel'
  'python-flask-babel'
  'python-flask-login'
  'python-flask-principal'
  'python-flask'
  'python-pypdf2'
  'python-pytz'
  'python-requests'
  'python-sqlalchemy'
  'python-tornado'
  'python-wand'
  'python-unidecode'
  'python-blinker'
  'python-iso639'
  'python-lxml'
  'python-flask-wtf'
  'python-pycountry'
)
optdepends=(
  'python-jsonschema: kobo sync support'
)
provides=('calibre-web')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/janeczku/calibre-web/archive/${pkgver}.tar.gz"
  'calibre-web.service'
  'calibre-web.sysusers'
  'calibre-web.tmpfiles'
  'flask-babel.patch::https://github.com/janeczku/calibre-web/commit/94a6931d48d347ae6c07e2b5f0301e8cf97cf53d.diff'
)
sha256sums=('917710392f8b73cfb102b5c63c592117bb005d16ce2c8142033a7983588e987b'
            '216c5443424aa9b38b71c53186d0369d2eacd2cb03d742e01c881ab7bac9ea2d'
            'b5d6c225761244b6c698af0279c9501bb9514e3e2a5151ca6e3212a4f5d0d76a'
            '82fae88cbed6d69e5a04586293de81bdc55994a4fe003178c39b5a35f2c87c1a'
            '441ae605b23e2216aacf535403bb1fb31a37066cbe51e815cb88a786a01170cc')

package() {
  cd $pkgname-$pkgver
  filterdiff -p1 --exclude "requirements.txt" "$srcdir/flask-babel.patch" | patch -p1
  install -d -m 755 "${pkgdir}/usr/lib/calibre-web"
  cp -a "${srcdir}/$pkgname-$pkgver"/* "${pkgdir}/usr/lib/calibre-web/"
  rm -rf "${pkgdir}/usr/lib/calibre-web/.git"

  install -D -m 644 "${srcdir}/calibre-web.service" "${pkgdir}/usr/lib/systemd/system/calibre-web.service"
  install -D -m 644 "${srcdir}/calibre-web.sysusers" "${pkgdir}/usr/lib/sysusers.d/calibre-web.conf"
  install -D -m 644 "${srcdir}/calibre-web.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/calibre-web.conf"
}
