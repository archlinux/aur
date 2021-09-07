# Maintainer: Sick.Codes <aur@sick.codes>
# Contributor: Peter Wu <peter@lekensteyn.nl>
# Contributor: Evaggelos Balaskas <eblaskas _AT_ ebalaskas _DOT_ gr>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Nikos Skalkotos <skalkoto (at) Gmail.com>
# Contributor: Csaba Henk <csaba+arch@lowlife.hu>

pkgname=libguestfs-dev
_pkgname=libguestfs
pkgver=1.45.7
pkgrel=1
pkgdesc="Library and tools for accessing and modifying virtual machine disk images, development version"
arch=(i686 x86_64)
url="https://libguestfs.org/"
license=(GPL2 LGPL2.1)
backup=("etc/libguestfs-tools.conf"
        "etc/xdg/virt-builder/repos.d/libguestfs.conf"
        "etc/xdg/virt-builder/repos.d/libguestfs.gpg")
# backup=("etc/libguestfs-tools.conf" "etc/php.d/guestfs_php.ini")
install="appliance.install"
depends=(qemu-headless augeas hivex libconfig libvirt fuse
         file cpio jansson supermin)
makedepends=(pcre cdrtools git libxml2 gperf rpcsvc-proto python perl
             perl-string-shellquote perl-libintl-perl perl-sys-virt
             perl-module-build po4a ruby-rdoc ruby-rake rust
             gobject-introspection ocaml-findlib ocaml go wget)
# jansson lua ghc erlang gjs php
optdepends=("python: Python bindings"
            "ruby: Ruby Bindings"
            # "gjs: Javascript Bindings for GNOME"
            # "php: PHP bindings"
            # "erlang: Erlang Bindings"
            # "ghc: Haskell Bindings"
            # "lua: Lua Bindings"
            "perl: Perl Bindings"
            "perl-sys-virt: Sys-Virt tools"
            "ocaml: Ocaml libs")
provides=(libguestfs)
conflicts=(libguestfs)
options=()
source=("git+https://github.com/libguestfs/libguestfs.git#tag=v${pkgver}"
        "git+https://git.savannah.gnu.org/git/gnulib.git"
        "git+https://github.com/libguestfs/libguestfs-common.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "${srcdir}/${_pkgname}"
    sed -i 's/ Sys::Virt / /g' m4/guestfs-perl.m4

    git submodule init
    git config submodule.gnulib.url "${srcdir}/gnulib"
    git config submodule.common.url "${srcdir}/libguestfs-common"
    git submodule update

    # Currently Lua, Erlang, Php, Haskell and Java bindings
    # are disabled. If you want to create any of the aforementioned language
    # bindings uncomment the appropriate line in makedepends and remove the
    # --disable-* option in ./configure

    sed -i -e 's/linguas_translated\ \=\ ja\ uk//' po-docs/Makefile.am
    # sed -i -e 's/po\-docs//g' Makefile
    sed -i -e 's/po\-docs//g' Makefile.am

    rm -f po-docs/Makefile.am
    rm -f po-docs/ja/Makefile.am
    rm -f po-docs/uk/Makefile.am
    rm -f po-docs/language.mk

    sed -i -e 's/SUBDIRS\ \+\=\ po\-docs//' Makefile.am
    sed -i -e 's/SUBDIRS\ \+\=\ po\-docs/SUBDIRS\ \+\=\ \"\"/' Makefile.am

    sed -i -e 's/po\-docs\/ja\/Makefile//g'  configure.ac
    sed -i -e 's/po\-docs\/uk\/Makefile//g'  configure.ac
    sed -i -e 's/po\-docs\/Makefile//g'      configure.ac

    autoreconf -fi
}

_fix_pod_files() {
    # work around podfile generation isssue
    rm -f po-docs/podfiles
    make -C po-docs update-po
}

build() {
    cd "${srcdir}/${_pkgname}"

    ./configure \
        CFLAGS=-fPIC \
        --prefix=/usr \
        --libdir=/usr/lib \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --enable-introspection=no \
        --with-extra-packages="libldm systemd-sysvcompat openssh qemu-headless" \
        --with-guestfs-path=/usr/lib/guestfs \
        --without-java \
        --disable-static \
        --disable-probes \
        --disable-lua \
        --disable-erlang \
        --disable-ruby \
        --disable-php \
        --disable-gobject \
        --disable-golang \
        --disable-haskell
        
        # --mandir=/usr/share/man \
        # --disable-appliance \
        # --disable-daemon \

    make

    # for some reason ruby is not properly made (albeit enabled)
    # make -C ruby
}

#check() {
    #cd "${srcdir}/${_pkgname}"
    # test-lock fails, perhaps related to:
    # http://lists.gnu.org/archive/html/bug-gnulib/2013-10/msg00059.html
    # test-thread_create failed too.
    #make check
#}

package() {
    cd "${srcdir}/${_pkgname}"

    # if ! make DESTDIR="${pkgdir}" install; then
    #     _fix_pod_files
    #     make DESTDIR="${pkgdir}" install
    # fi

    make DESTDIR="${pkgdir}" install

    mkdir -p "${pkgdir}/usr/lib/guestfs" "${pkgdir}/var/cache/guestfs"
    install -Dm755 "../../update-libguestfs-appliance" "${pkgdir}/usr/bin/update-libguestfs-appliance"
}

