# $Id$
# Maintainer: Jamin Collins <jamin.collins@gmail.com>
# Contributor: Ido Rosen <ido@kernel.org>
# Contributor: Evan Teitelman <teitelmanevan@gmail.com>
# Contributor: Eric Renfro <erenfro@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Sandman <the0sandman@hotmail.com>
# Contributor: raw <spam@rw23.de>
# Contributor: Dave Simons <miouhpi@gmail.com>
# Contributor: Dominik Hannen <cantares1+github@gmail.com>
# Contributor: David Anderson <dave@natulte.net>
# Contributor: Joe Julian <me@joejulian.name>
#

pkgname=ceph-git
pkgver=12.0.0.140.g2ed28407e7
pkgrel=1
epoch=1
pkgdesc='Distributed, fault-tolerant storage platform delivering object, block, and file system'
arch=('x86_64'
      'i686')
url='http://ceph.com/'
license=('GPL')
depends=('libedit'
         'libsigc++'
         'gtkmm'
         'btrfs-progs'
         'crypto++'
         'gperftools>=1.8.3-2'
         'python2'
         'fuse'
         'keyutils'
         'libatomic_ops'
         'curl'
         'libaio'
         'fcgi'
         'expat'
         'boost'
         'leveldb'
         'xfsprogs')
makedepends=('git'
             'boost'
             'boost-libs'
             'yasm'
             'cmake'
             'python-sphinx'
             'cython2'
             'nss')
install=ceph.install
options=('!emptydirs')
provides=('ceph')
conflicts=('ceph')
source=("git+https://github.com/ceph/ceph.git"
        "git+https://github.com/ceph/ceph-object-corpus.git"
        "git+https://github.com/ceph/civetweb"
        "git+https://github.com/ceph/jerasure.git"
        "git+https://github.com/ceph/gf-complete.git"
        "git+https://github.com/ceph/rocksdb"
        "git+https://github.com/ceph/ceph-erasure-code-corpus.git"
        "git+https://github.com/ceph/googletest"
        "git+https://github.com/ceph/spdk.git"
        "git+https://github.com/ceph/xxHash.git"
        "git+https://github.com/ceph/isa-l"
        "git+https://github.com/ceph/lua.git"
        "git+https://github.com/ceph/Beast.git"
        "git+https://github.com/boostorg/boost.git"
        "git+https://github.com/ceph/dpdk"
        "git+https://github.com/facebook/zstd"
        "ceph-osd@.service"
        "ceph-mon@.service"
        "ceph-mds@.service"
        "ceph.install")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '29483c0f6718e8830cf52c0d31e391fb52dc1b460bcb65cf9c72dfab83e5b5ce'
            'a50811ce62fd6cdcc17d8f1e4d9700c1889ab4bfc5e9a22155bd725a27715e3c'
            'b8239a04cc42e3e4ced2e141df6804e61e875131a5c95d6bcbfc3b44f388d44b'
            '9d713eca6096b28319cfd83eafee1486ece75e2f14fb505f86fe18027606a6bd')

pkgver() {
    cd "${srcdir}/${pkgname%%-git}"
    #printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
    git describe --long --tags | sed 's/^v//; s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname%%-git}"

    # put all submodules in the right places
    SRC_SUBMODULES=($(awk '/^\[submodule/ {print substr($2,2,length($2)-3)}' ${srcdir}/${pkgname%%-git}/.gitmodules | xargs -L1 basename))
    for SUBMODULE in ${SRC_SUBMODULES[@]}; do
        SUBMODULE_PATH=$(awk "/path\s*=.*${SUBMODULE}$/ {print \$3}" "${srcdir}/${pkgname%%-git}/.gitmodules")
        rm -fr "${srcdir}/${pkgname%%-git}/${SUBMODULE_PATH}"
        mv "${srcdir}/${SUBMODULE}" "${srcdir}/${pkgname%%-git}/${SUBMODULE_PATH}"
    done

    git submodule update --init
}

build() {
    cd "${srcdir}/${pkgname%%-git}"

    test -d build && rm -rf build
    mkdir build

    # fix python scripts to use python2
    #alias python=python2

    cd "${srcdir}/${pkgname%%-git}/build"
    # list of options defaults: grep ^option CMakeLists.txt
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DCMAKE_INSTALL_SBINDIR=/usr/bin \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
        -DSPHINX_BUILD=/usr/bin/sphinx-build2 \
        -DWITH_SYSTEM_BOOST=ON \
        -DWITH_SYSTEMD=ON \
        -DWITH_EMBEDDED=OFF \
        -DWITH_OPENLDAP=OFF \
        -DWITH_LTTNG=OFF \
        -DHAVE_BABELTRACE=OFF \
        -DWITH_TESTS=OFF \
        ..
    make
}

package() {
    cd "${srcdir}/${pkgname%%-git}/build"

    make DESTDIR="${pkgdir}" install

    cd "${pkgdir}"

    # install tmpfiles.d
    install -D -m 644 "${srcdir}"/${pkgname%%-git}/systemd/ceph.tmpfiles.d \
        usr/lib/tmpfiles.d/${pkgname%%-git}.conf
    #install -D -m 644 "${srcdir}"/ceph.sysusers \
    #    usr/lib/sysusers.d/${pkgname%%-git}.conf

    # fix sbin path
    msg2 'Fix sbin paths'
    mv -v usr/sbin/* usr/bin

    # fix bash completions path
    msg2 'Fix bash completion path'
    install -d -m 755 usr/share/bash-completion
    mv -v etc/bash_completion.d usr/share/bash-completion/completions

    # remove debian init
    rm -v etc/init.d/ceph

    # fix python2 shebang
    msg2 'Fix python2 shebang'
    find usr/bin -type f -executable -exec \
        sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
}

