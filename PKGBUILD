# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=little-brother
pkgver=0.3.1
pkgrel=1
pkgdesc="Parental Control Application implemented in Python 3 to monitor and limit kids' play time on Linux hosts"
arch=('any')
url='https://github.com/marcus67/little_brother'
license=('GPL3')
depends=('python-alembic'
         'python-requests'
         'python-psutil'
         'python-dateutil'
         'python-sqlalchemy'
         'python-pymysql'
         'python-markupsafe'
         'python-flask-babel'
         'python-flask-login'
         'python-flask-migrate'
         'python-flask-wtf'
         'python-flask_helpers'
         'python-selenium'
         'python-urllib3'
         'python-prometheus_client'
         'python-psycopg2'
         'postgresql'
         'zenity')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marcus67/little_brother/archive/${pkgver}.tar.gz")
sha256sums=('3aa495ef20e611f319f59c6a792c56f63e4da4b02f5b30db64b35093e650f260')

prepare() {
  cd "little_brother-${pkgver}"
  sed -i "s/==/>=/" requirements.txt
  sed -i 's|/local||' etc/little-brother.service
}

build() {
  cd "little_brother-${pkgver}"
  python setup.py build
}

package() {
  cd "little_brother-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 etc/little-brother.service -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 etc/little-brother.sudo "${pkgdir}/etc/sudoers.d/little-brother"
  install -Dm644 etc/*.config -t "${pkgdir}/etc/little-brother"
  install -d "${pkgdir}/usr/share/doc/little-brother"
  cp -aR doc/* "${pkgdir}/usr/share/doc/little-brother"
}