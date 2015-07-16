# Maintainer: Yen Chi Hsuan <yan12125 at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: James Miller <james@pocketrent.com>

_pkgname=hhvm
_github_addr=facebook/hhvm
pkgname=${_pkgname}-git
pkgver=20150716
pkgrel=1
pkgdesc="Virtual Machine, Runtime, and JIT for PHP"
arch=('x86_64')
url="http://hhvm.com"
license=('PHP')
depends=('boost-libs'
         'fribidi'
         'google-glog'
         'imagemagick'
         'intel-tbb'
         'jemalloc'
         'libdwarf'
         'libedit'
         'libmcrypt'
         'libmemcached'
         'libvpx'
         'libxslt'
         'libyaml'
         'mysql'
         'oniguruma'
         'php'
         'sqlite'
         'unixodbc')
# curl included in php
# gd is bundled in hphp/runtime/ext/gd/libgd
# libxml2 included in libxslt
# pcre included in lots of packages
makedepends=('git' 'cmake' 'clang' 'boost' 'python2' 'pfff-git' 'ocaml-findlib' 'gperf')
source=("git+https://github.com/$_github_addr" #1
        "git+https://github.com/hhvm/hhvm-third-party"
        "git+https://github.com/facebook/folly"
        "git+https://github.com/facebook/fbthrift"
        "git+https://github.com/facebook/squangle"
        "git+https://github.com/facebook/proxygen" #6
        "git+https://github.com/facebook/mcrouter"
        "git+https://github.com/google/re2"
        "git+https://github.com/webscalesql/webscalesql-5.6" #9
        'hhvm.tmpfile'
        'hhvm@.service'
        'server.ini'
        'systemd-server.conf'
        'fix_latomic_check.patch'::'https://github.com/facebook/hhvm/pull/5397.patch'
        'clang-force-libstdc++.patch')
backup=('etc/hhvm/server.ini' 'etc/hhvm/systemd-server.conf')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            'SKIP' 'SKIP' 'SKIP' 'SKIP'
            'c049b53f5ca7f8384d3b0a9d257018770b3a171f3b7ae8865cbb2c402a26b5e9'
            'dddf4325926a41b3f1b5a41a1a42364ee463ab627f9d9b05ccf7c4660af3a51c'
            'bca85e0445f3e26df65876c52e507aec8146cd31cce12c82846b55705529caed'
            '66ae41fb6ef07dd02a9c959ab6b6e07bcb1d17b0c164a091fc5ecd9dc7967cd0'
            'cca20abfc2742062d77ae448942bc2feea4073c41198a4fe8db93620cc6fea76'
            'a8173502536c6f8e3af5d2cfaf73214b1869e1e780a842f915e8e657083a515a')

install=hhvm.install

_EXTRA_COMPONENTS=('hackificator' 'remove_soft_types')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -p1 -i ../fix_latomic_check.patch
    patch -p1 -i ../clang-force-libstdc++.patch

    git submodule init
    git config submodule.third-party.url "${srcdir}/hhvm-third-party"
    git submodule update

    cd third-party
    git submodule init
    git config submodule.folly.url "${srcdir}/folly"
    git config submodule.mcrouter/src.url "${srcdir}/mcrouter"
    git config submodule.proxygen/src.url "${srcdir}/proxygen"
    git config submodule.re2/src.url "${srcdir}/re2"
    git config submodule.squangle/squangle.url "${srcdir}/squangle"
    git config submodule.thrift/src.url "${srcdir}/fbthrift"
    git config submodule.webscalesqlclient/webscalesql-5.6.url "${srcdir}/webscalesql-5.6"
    git submodule update
}

build() {
    cd "${srcdir}/${_pkgname}"
    msg2 "Building hhvm"

    # Force hardcoded MySQL unix domain socket path here
    # becuase the server may not be running when building
    # The path listed here is copied from PKGBUILD of extra/mariadb
    # If you use a custom path setting in my.cnf, please change it

    CC=clang CXX=clang++ \
    cmake \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_PREFIX_PATH="$srcdir" \
        -DMYSQL_UNIX_SOCK_ADDR=/run/mysqld/mysqld.sock \
        -DCLANG_FORCE_LIBSTDCXX=ON \
        .

    make

    cd "${srcdir}/${_pkgname}/hphp/hack/tools"
    msg2 "Building extra components"

    msg2 "hardening-wrapper leads to build failures. See FS#42748"

    for tool in "${_EXTRA_COMPONENTS[@]}"
    do
        pushd "$tool"
        make clean
        make depend
        make
        popd
    done

    pushd augmented_types
    make clean
    make
    popd
}

check() {
   msg2 "Make sure to enable posix.so and sysvmsg.so in php.ini for correct testing"

   cd "${srcdir}/${_pkgname}/hphp/test"
    ./run --threads 2 quick
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir/" install

    msg2 "Install extra components"
    cd "${srcdir}/${_pkgname}/hphp/hack/bin/tools"
    for tool in *
    do
        install -Dm755 "${tool}" "${pkgdir}/usr/bin/${tool}"
    done

    cd "${srcdir}/${_pkgname}/hphp/hack/tools/augmented_types/_build"
    install -Dm755 augmented_types.native "${pkgdir}/usr/bin/augmented_types"

    cd "${srcdir}"
    install -Dm644 hhvm.tmpfile "${pkgdir}/usr/lib/tmpfiles.d/hhvm.conf"
    install -Dm644 hhvm@.service "${pkgdir}/usr/lib/systemd/system/hhvm@.service"
    install -Dm644 server.ini "${pkgdir}/etc/hhvm/server.ini"
    install -Dm644 systemd-server.conf "${pkgdir}/etc/hhvm/systemd-server.conf"

    install -Ddm755 -o http "${pkgdir}/var/log/hhvm"
    install -Ddm755 -o http "${pkgdir}/var/lib/hhvm"
}
