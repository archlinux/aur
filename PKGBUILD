# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Mathias Stearn <mathias@10gen.com>
# Contributor: Alec Thomas

pkgname=mongodb
pkgver=4.0.6
pkgrel=1
pkgdesc="A high-performance, open source, schema-free document-oriented database"
arch=("x86_64")
url="https://www.${pkgname}.com/"
license=("custom:SSPL")
depends=("curl" "libstemmer" "lsb-release" "pcre" "wiredtiger>=3.1.0.20190207" "yaml-cpp")
optdepends=("${pkgname}-tools: mongoimport, mongodump, mongotop, etc")
makedepends=("libpcap" "ncurses" "python2-cheetah" "python2-regex" "python2-requests" "python2-setuptools" "python2-typing" "python2-yaml" "readline" "scons")
checkdepends=("python2-pymongo")
backup=("etc/${pkgname}.conf")
source=(
  "http://downloads.${pkgname}.org/src/${pkgname}-src-r${pkgver}.tar.gz"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha256sums=('34165ef42c7199c438e1706fef515cbde012d6a884406d102082d39eab72c235'
            '3757d548cfb0e697f59b9104f39a344bb3d15f802608085f838cb2495c065795'
            'b7d18726225cd447e353007f896ff7e4cbedb2f641077bce70ab9d292e8f8d39')

_scons_args=(
  --use-system-pcre
  --use-system-snappy
  --use-system-yaml
  --use-system-zlib
  --use-system-wiredtiger
  --use-system-stemmer
  --use-sasl-client
  --ssl
  --disable-warnings-as-errors
  # --use-system-asio     # https://jira.${pkgname}.org/browse/SERVER-21839
  # --use-system-icu
  --use-system-tcmalloc   # in gperftools
)

prepare() {
  cd "${srcdir}/${pkgname}-src-r${pkgver}"

  # Keep historical Arch dbPath
  sed -i 's|dbPath: /var/lib/mongo|dbPath: /var/lib/mongodb|' rpm/mongod.conf

  # Keep historical Arch conf file name
  sed -i 's|-f /etc/mongod.conf|-f /etc/mongodb.conf|' rpm/mongod.service

  # Keep historical Arch user name (no need for separate daemon group name)
  sed -i 's/User=mongod/User=mongodb/' rpm/mongod.service
  sed -i 's/Group=mongod/Group=mongodb/' rpm/mongod.service
  sed -i 's/chown mongod:mongod/chown mongodb:mongodb/' rpm/mongod.service

  # Remove sysconfig file, used by upstream's init.d script not used on Arch
  sed -i '/EnvironmentFile=-\/etc\/sysconfig\/mongod/d' rpm/mongod.service
}

build() {
  cd "${srcdir}/${pkgname}-src-r${pkgver}"

  export SCONSFLAGS="$MAKEFLAGS"
  scons core "${_scons_args[@]}"
}

check() {
  cd "${srcdir}/${pkgname}-src-r${pkgver}"

  export SCONSFLAGS="$MAKEFLAGS"

  # 3.6.0: mlock permission denied
  scons unittests "${_scons_args[@]}"
  python2 "${srcdir}/${pkgname}-src-r${pkgver}/buildscripts/resmoke.py" --suites=unittests || warning "Tests failed"

  scons dbtest "${_scons_args[@]}"
  python2 "${srcdir}/${pkgname}-src-r${pkgver}/buildscripts/resmoke.py" --suites=dbtest

  scons integration_tests "${_scons_args[@]}"
  python2 "${srcdir}/${pkgname}-src-r${pkgver}/buildscripts/resmoke.py" --suites=integration_tests_replset,integration_tests_standalone --dbpathPrefix="${srcdir}"
}

package() {
  cd "${srcdir}/${pkgname}-src-r${pkgver}"

  scons install --prefix="${pkgdir}/usr" "${_scons_args[@]}"

  # Keep historical Arch conf file name
  install -Dm644 "rpm/mongod.conf" "${pkgdir}/etc/${pkgname}.conf"

  # Keep historical Arch service name
  install -Dm644 "rpm/mongod.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  # Install manpages
  install -Dm644 "debian/mongo.1" "${pkgdir}/usr/share/man/man1/mongo.1"
  install -Dm644 "debian/mongod.1" "${pkgdir}/usr/share/man/man1/mongod.1"
  install -Dm644 "debian/mongos.1" "${pkgdir}/usr/share/man/man1/mongos.1"

  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 LICENSE-Community.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-Community.txt"

  # This script won't run on Arch. If needed, see AUR package mongodb-compass.
  rm "${pkgdir}/usr/bin/install_compass"
}
