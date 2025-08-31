# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Daniel Milde <daniel@milde.cz>
# Based on https://github.com/aerospike/aerospike-client-c

pkgname=aerospike-client-c-libuv
pkgver=7.1.0
pkgrel=1
pkgdesc="Aerospike C Client."
arch=('x86_64')
url="https://github.com/aerospike/aerospike-client-c"
license=('apache')
depends=('libuv' 'python')
makedepends=('git')
provides=('aerospike-client-c')
conflicts=('aerospike-client-c-libev' 'aerospike-client-c-libevent')
_gitroot="https://github.com/aerospike/aerospike-client-c.git"
_gitname="aerospike-client-c"
source=("git+$_gitroot#tag=$pkgver"
        "git+https://github.com/aerospike/aerospike-common"
        "git+https://github.com/aerospike/aerospike-mod-lua"
        "git+https://github.com/aerospike/lua.git")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd ${srcdir}/${_gitname}/
  git submodule init
  git config submodule.modules/common.url "${srcdir}/aerospike-common"
  git config submodule.modules/mod-lua.url "${srcdir}/aerospike-mod-lua"
  git config submodule.modules/lua.url "${srcdir}/lua"
  git submodule--helper update
}

build() {
  cd ${srcdir}/${_gitname}/

  make EVENT_LIB=libuv
}

package() {

  mkdir -p -m 755 "${pkgdir}/usr/include"
  mkdir -p -m 755 "${pkgdir}/usr/lib/"
  mkdir -p -m 755 "${pkgdir}/opt/aerospike/client/sys/udf/lua/"
  mkdir -p -m 755 "${pkgdir}/opt/aerospike/client/usr/udf/lua/"

  cd ${srcdir}/${_gitname}/

  cp -r target/Linux-x86_64/include/aerospike/ "${pkgdir}/usr/include/"
  cp -r target/Linux-x86_64/include/citrusleaf/ "${pkgdir}/usr/include/"

  install -Dm644 target/Linux-x86_64/lib/libaerospike.a "${pkgdir}/usr/lib/"
}
