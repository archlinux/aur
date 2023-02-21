# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-database
_pkgname=TangoDatabase
pkgver=5.20
pkgrel=1
groups=('tango-controls')
pkgdesc="TANGO distributed control system - database server"
arch=('x86_64' 'armv7h')
url="https://www.tango-controls.org/"
license=('GPL3')
depends=('tango-cpp' 'mariadb' 'mariadb-clients' 'mariadb-libs' 'cmake>=2.8.9' )
conflicts=('tango' 'tango-database-git')
install=tango-database.install
source=("https://gitlab.com/tango-controls/TangoDatabase/-/archive/Database-Release-${pkgver}/TangoDatabase-Database-Release-${pkgver}.tar.gz"
        "tango-database.service"
        "tango-database-init.sh"
        "tango-database-init.sql")
sha256sums=('beb0c79f9db361e5c49ae30f2601e27eb79b89500c088e29dc2328de88bd2c3d'
            '61a616f03e872b8fad260a0f5a02954e772afbcfd81c8cbd2b3f4ac57e1af049'
            'f4ab8368deb1f912de8ad142330cfae12cb267c4c598282c1739b6f1bf5c4c7c'
            '2ae4a19136373c6a97da8e920e9f61db341df4cf42f8a9388cfaf30a0142306e')
_dir="${_pkgname}-Database-Release-${pkgver}"

build() {
  cmake -B build -S ${_dir} -DCMAKE_INSTALL_PREFIX=/usr/
  make -C build
}

package() {
  mkdir -p ${pkgdir}/etc/systemd/system
  install -Dm 644 tango-database.service ${pkgdir}/etc/systemd/system
  mkdir -p ${pkgdir}/usr/bin
  install -Dm 755 tango-database-init.sh ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/tango/db
  install -Dm 644 tango-database-init.sql ${pkgdir}/usr/share/tango/db

  make -C build DESTDIR=${pkgdir} install
}
