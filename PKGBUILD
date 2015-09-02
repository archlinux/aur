# Libguestfs: Installer: Arch
# Contributor: Peter Wu <peter@lekensteyn.nl>
# Contributor: Evaggelos Balaskas <eblaskas _AT_ ebalaskas _DOT_ gr>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Nikos Skalkotos <skalkoto (at) Gmail.com>
# Maintainer: Paweł Mosakowski <pawel_at_mosakowski.net>

pkgbase=libguestfs
pkgname=${pkgbase}-python3
pkgver=1.30.0
_pkgver_short=${pkgver%.*}
pkgrel=1
pkgdesc="Python 3 compatible bindings for libguestfs"
arch=("i686" "x86_64")
url="http://libguestfs.org"
license=("GPL2" "LGPL2.1")
_pythonver=3
depends=("libguestfs=${pkgver}" 
         "python${_pythonver}"
         )
makedepends=("qemu"
             "pcre"
             "cdrkit"
             "libvirt"
             "libconfig"
             "libxml2"
             "gperf"
             "python${_pythonver}"
#             "perl"
#             "perl-string-shellquote"
#             "perl-libintl-perl"
#             "perl-sys-virt"
#             "lua"
#             "ghc"
#             "ruby"
#             "erlang"
#             "gjs"
#             "php"
#             "gobject-introspection"
#             "ocaml-findlib"
#             "ocaml"
            )
optdepends=(
#            "ruby: Ruby Bindings"
#            "gjs: Javascript Bindings for GNOME"
#            "php: PHP bindings"
#            "erlang: Erlang Bindings"
#            "ghc: Haskell Bindings"
#            "lua: Lua Bindings"
#            "perl: Perl Bindings"
#            "perl-sys-virt: Sys-Virt tools"
#            "ocaml: Ocaml libs"
            )
source=("http://libguestfs.org/download/${_pkgver_short}-stable/${pkgbase}-${pkgver}.tar.gz")
sha512sums=('b3a68cb5de208f359d2b9aa5d26fe0248575ee03975a6cf60e1a3509cf34c3c55116ba24db7d4dbeee2ed79bc9e2bdd5056a9de82d9263c41cb657eb702ae45e')

check() {
    # test-lock fails, perhaps related to:
    # http://lists.gnu.org/archive/html/bug-gnulib/2013-10/msg00059.html
    # test-thread_create failed too.
    : make check
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

# Currently OCaml lua, erlang, php, haskel, ruby, ghc, GObject and java bindings
# are disabled. If you want to create any of the aforementioned language
# bindings uncomment the appropriate line in makedepends and remove the
# --disable-* option in ./configure

  ./configure \
    PYTHON=python$_pythonver \
    --prefix=/usr \
    --libdir=/usr/lib \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --disable-static \
    --disable-probes \
    --disable-appliance \
    --disable-daemon \
    --without-java \
    --enable-introspection=no \
    --disable-lua \
    --disable-erlang \
    --disable-php \
    --disable-haskell \
    --disable-ruby \
    --disable-gobject \
    --disable-golang \
    --disable-ocaml \
    --disable-perl

  make
}

package_libguestfs-python3() {
  _distdir="${srcdir}/${pkgbase}-${pkgver}-dist"
  mkdir -p "$_distdir"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make DESTDIR="$_distdir" install

  mkdir -p "${pkgdir}/usr/lib/"
  find ${_distdir} -name 'python?.?' -exec cp -r {} "${pkgdir}/usr/lib/" \;
}
