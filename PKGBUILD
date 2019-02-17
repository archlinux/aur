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
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha256sums=(
  "34165ef42c7199c438e1706fef515cbde012d6a884406d102082d39eab72c235"
  "19f55ab28652b3817e98fc3f15cc2f6f3255a5e1dfd7b0d5a27c9ba22fd2703e"
  "47b884569102f7c79017ee78ef2e98204a25aa834c0ee7d5d62c270ab05d4e2b"
  "51ee1e1f71598aad919db79a195778e6cb6cfce48267565e88a401ebc64497ac"
)

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
}

build() {
  cd "${srcdir}/${pkgname}-src-r${pkgver}"

  export SCONSFLAGS="$MAKEFLAGS"
  scons core tools "${_scons_args[@]}"
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

  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 LICENSE-Community.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-Community.txt"

  # This script won't run on Arch. If needed, see AUR package mongodb-compass.
  rm "${pkgdir}/usr/bin/install_compass"
}
