# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

pkgname=tango-database
_pkgname=TangoDatabase
pkgver=5.31
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
  "442cd3f78f2b00ae841ddf8c4b77a2845d2d61e540548416f02261c97b443b0e"
  "a0e7dc022acc43d4eb96828ba0362bc1397607d5850e1b69ce5aa5ae90a74386"
  "a48e929dfffc7831cf2cb783aa51d38ddbfb3ee04bfa57d07947de8134f61ac3"
  "efbd160e7ad24e893887b95413499cc1c2b28506c58f05df6070aa1d8cfe7a17"
  "0edcbdda3f3789973d30ab65589b5a0920a3b70b185e25544f60cc4669492475"
  "ab966cba68b02c7163cb3a210c59ef7e645d5a43fc1ad18869a2533e1b297fc8"
  "e644ce6e0ead5df685f67d336167bfc32bb7941dfa7896607700bcf06baec7c6"
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
