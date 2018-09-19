# $Id$
# Maintainer: Andy Brennan <andy@beiwy.com>
# Maintainer: Geoffroy Planquart <geoffroy@planquart.fr>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Mathias Stearn <mathias@10gen.com>
# Contributor: Alec Thomas

# Check https://www.mongodb.org/dl/src for source location, including
# checksums

pkgname=mongodb-3.4
pkgver=3.4.17
pkgrel=1
pkgdesc='A high-performance, open source, schema-free document-oriented database'
arch=('x86_64')
url='https://www.mongodb.com/'
license=('AGPL3')
provides=('mongodb')
conflicts=('mongodb')
depends=('pcre' 'snappy' 'openssl' 'libsasl' 'yaml-cpp' 'lsb-release' 'wiredtiger'
         'libstemmer')
makedepends=('scons' 'readline' 'ncurses' 'libpcap' 'boost')
checkdepends=('python2-pymongo' 'python2-yaml')
optdepends=('libpcap: needed for mongosniff'
            'mongodb-tools: mongoimport, mongodump, mongotop, etc')
backup=('etc/mongodb.conf')
source=("http://downloads.mongodb.org/src/mongodb-src-r${pkgver}.tar.gz"
        'mongodb.sysusers' 'mongodb.tmpfiles' 'mongodb.conf' 'mongodb.service'
        'asio-openssl-1.1.0.patch'
        'using-std-string.patch')
sha512sums=('ad2eb6109bb8d145fff684bab2d03dc40f18073cb747c7c6a17a75780bf1566d38190323931bc492267b3d579a6b7144cd1c50507806def7eedd758c25cc2203'
            '889425b864c58a767aa5865c0ce9817361ad99fec78050fa600f14eaef5a56ce0bc41a03878233e99f4862596a94dafcfebebecd4d57443b742117b873ab813d'
            'a931c401792f4e7928e4778d91626c1ecc3e97e5728549b170c050de487b2e5234747b0ee2d5acc3d63b798716758c17e30914dcaa9a92ac386db39f8a45a05c'
            '05dead727d3ea5fe8af1a3c3888693f6b3e2b8cb7f197a5d793352e10d2c524e96c9a5c55ad2e88c1114643a9612ec0b26a2574b48a5260a9b51ec8941461f1c'
            '177251404b2e818ae2b546fe8b13cb76e348c99e85c7bef22a04b0f07b600fd515a309ede50214f4198594388a6d2b31f46e945b9dae84aabb4dfa13b1123bb9'
            'aea8fecb17be07e4517822798810751114f61164dc3ab3e335a7b837876acb918d287caa8b9fe32d7b1d9e7cad2e677d9818a1532ae08b8b013840d2a68b25f5'
            '94935574212365c2bfca8b035313c47925dfcd1411070deccd2159cc985f9a6151e70c1d1529352d69098460982b1e8080f42b6ce2e5a057da62f90a91ae8210')

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
  # --use-system-asio     # https://jira.mongodb.org/browse/SERVER-21839
  # --use-system-v8       # Doesn't compile
  # --use-system-icu
  # --use-system-tcmalloc # Disabled as upstream suggests in https://jira.mongodb.org/browse/SERVER-17447?focusedCommentId=841890&page=com.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comment-841890
)

build() {
  cd mongodb-src-r${pkgver}
  export SCONSFLAGS="$MAKEFLAGS"

  scons core tools "${_scons_args[@]}"
}

check() {
  cd mongodb-src-r${pkgver}
  export SCONSFLAGS="$MAKEFLAGS"

  # Setting LANG to workaround the following test error:
  # std::exception: locale::facet::_S_create_c_locale name not valid

  # 3.4.9: Tests hang
  # scons unittests "${_scons_args[@]}"
  # sed -i -e '/oplog_buffer_collection_test/d' build/unittests.txt
  # LANG=en_US.UTF-8 python2 buildscripts/resmoke.py --suites=unittests

  scons dbtest "${_scons_args[@]}"
  python2 buildscripts/resmoke.py --suites=dbtest


  #scons integration_tests "${_scons_args[@]}"
  #python2 buildscripts/resmoke.py --suites=integration_tests_replset,integration_tests_standalone --dbpathPrefix="$srcdir"
}

prepare() {
  cd mongodb-src-r${pkgver}
  patch -Np1 -i ../using-std-string.patch
  #patch -Np1 -i ../mongodb-3.2.10-boost-1.62.0.patch

  sed -e 's|-std=c++11|-std=gnu++11|g' -i SConstruct  # tests use hex floats, not supported in plain C++

  sed -i '/#include "mongo.platform.strnlen.h"/a using namespace std;' src/mongo/bson/bsonelement.h

  cd src/third_party/asio-asio-1-11-0
  patch -Np1 -i "${srcdir}/asio-openssl-1.1.0.patch"
}

package() {
  cd mongodb-src-r${pkgver}

  scons install --prefix="$pkgdir/usr" --nostrip "${_scons_args[@]}"

  install -Dm644 "$srcdir/mongodb.conf" "$pkgdir/etc/mongodb.conf"
  install -Dm644 "$srcdir/mongodb.service" "$pkgdir/usr/lib/systemd/system/mongodb.service"
  install -Dm644 "$srcdir/mongodb.sysusers" "$pkgdir/usr/lib/sysusers.d/mongodb.conf"
  install -Dm644 "$srcdir/mongodb.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mongodb.conf"
}

