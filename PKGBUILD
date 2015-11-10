# Libguestfs: Installer: Arch
# Contributor: Peter Wu <peter@lekensteyn.nl>
# Contributor: Evaggelos Balaskas <eblaskas _AT_ ebalaskas _DOT_ gr>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Nikos Skalkotos <skalkoto (at) Gmail.com>
# Maintainer: Paweł Mosakowski <pawel_at_mosakowski.net>

_pkgname=libguestfs
pkgname=libguestfs-python3
pkgver=1.30.3
_pkgver_short=${pkgver%.*}
pkgrel=1
pkgdesc="Python 3 compatible bindings for libguestfs"
arch=("i686" "x86_64")
url="http://libguestfs.org"
license=("GPL2" "LGPL2.1")
depends=("libguestfs"
         "python"
         )
makedepends=("qemu"
             "pcre"
             "cdrkit"
             "libvirt"
             "libconfig"
             "libxml2"
             "gperf"
#             "python${_pythonver}"
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
source=("http://libguestfs.org/download/${_pkgver_short}-stable/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('f9b0fe75c958290991ad90ba4fbb385b64c39298d7536c8e874cdcce195a1d9c5bd5a3ed289b881524f225a4e328a7e090582b444ed64b60382f37dae8261a21')

check() {
    # test-lock fails, perhaps related to:
    # http://lists.gnu.org/archive/html/bug-gnulib/2013-10/msg00059.html
    # test-thread_create failed too.
    : make check
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

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

package() {
  _distdir="${srcdir}/${_pkgname}-${pkgver}-dist"
  mkdir -p "$_distdir"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="$_distdir" install

  mkdir -p "${pkgdir}/usr/lib/"
  find ${_distdir} -name 'python?.?' -exec cp -r {} "${pkgdir}/usr/lib/" \;
}
