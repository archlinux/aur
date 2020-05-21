# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=little-brother
pkgver=0.2.1
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
sha256sums=('277e3d33fac94a6319f7b11d9647dddfb5914146c7a567326234c5c427bb40e2')

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