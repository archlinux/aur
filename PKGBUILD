# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-database
_pkgname=TangoDatabase
pkgver=5.25
pkgrel=1
_pkgver=Database-Release-${pkgver}
groups=("tango-controls")
pkgdesc="TANGO distributed control system - database server"
arch=("x86_64" "armv7h")
url="https://gitlab.com/tango-controls/TangoDatabase"
license=("GPL-3.0-or-later")
depends=(
  "glibc" "gcc-libs" "omniorb" "tango-cpp" "mariadb-libs"
  "sh" "mariadb-clients" "mariadb"
)
makedepends=("cmake")
conflicts=("tango" "tango-database-git")
install=$pkgname.install
source=(
  "https://gitlab.com/tango-controls/${_pkgname}/-/releases/${_pkgver}/downloads/${_pkgname}-with-submodules-${_pkgver}.tar.gz"
  "tango-database.service" "collate.patch" "fortify.patch" "tango-db.conf" "create_db_user.sql" "check_and_create_db.sh"
)
sha256sums=(
  "92c7f0dc40755200185d4bd34d467f916c22acf08045872e6e3dd6044b4dc7c6"
  "a0e7dc022acc43d4eb96828ba0362bc1397607d5850e1b69ce5aa5ae90a74386"
  "a48e929dfffc7831cf2cb783aa51d38ddbfb3ee04bfa57d07947de8134f61ac3"
  "7701f7a2540b748e32e17a319f236af385901940bb37f1d7fd658ad4f75f5229"
  "0edcbdda3f3789973d30ab65589b5a0920a3b70b185e25544f60cc4669492475"
  "ab966cba68b02c7163cb3a210c59ef7e645d5a43fc1ad18869a2533e1b297fc8"
  "a77e1b23dd90f36345a43fc45afa738e458ea3b88d395f83c396516ba2efdfbd"
)

prepare() {
  cd "${_pkgname}-with-submodules-${_pkgver}"
  patch -N -p1 --input="${srcdir}/fortify.patch"
  patch -N -p1 --input="${srcdir}/collate.patch"
}

build() {
  cmake -B build -S "${_pkgname}-with-submodules-${_pkgver}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  mkdir -p ${pkgdir}/usr/lib/systemd/system
  install -Dm 644 tango-database.service ${pkgdir}/usr/lib/systemd/system/tango-database.service

  mkdir -p ${pkgdir}/usr/lib/sysusers.d
  install -Dm 644 tango-db.conf "${pkgdir}"/usr/lib/sysusers.d/tango-db.conf
  install -Dm 644 create_db_user.sql "${pkgdir}"/usr/share/tango/db/create_db_user.sql
  install -Dm 644 build/create_db_tables.sql "${pkgdir}"/usr/share/tango/db/create_db_tables.sql
  install -Dm 644 check_and_create_db.sh "${pkgdir}"/usr/share/tango/db/check_and_create_db.sh
}
