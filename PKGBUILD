# Libguestfs: Installer: Arch
# Contributor: Peter Wu <peter@lekensteyn.nl>
# Contributor: Evaggelos Balaskas <eblaskas _AT_ ebalaskas _DOT_ gr>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Nikos Skalkotos <skalkoto (at) Gmail.com>

pkgname=libguestfs
pkgver=1.40.2
pkgver_short=${pkgver%.*}
pkgrel=1
pkgdesc="Access and modify virtual machine disk image"
arch=("i686" "x86_64")
url="http://libguestfs.org"
license=("GPL2" "LGPL2.1")
backup=("etc/libguestfs-tools.conf"
        "etc/xdg/virt-builder/repos.d/libguestfs.conf"
	"etc/xdg/virt-builder/repos.d/libguestfs.gpg")
# backup=("etc/libguestfs-tools.conf" "etc/php.d/guestfs_php.ini")
install="appliance.install"
_pythonver=2
depends=("qemu-headless"
         "augeas"
         "hivex>=1.3.2"
         "libconfig"
         "libvirt"
         "fuse"
         "file"
         "cpio"
         "wget"
	 "jansson")
makedepends=("qemu-headless"
             "pcre"
             "cdrkit"
             "libvirt"
             "libconfig"
             "libxml2"
             "gperf"
             "python${_pythonver}"
             "perl"
             "perl-string-shellquote"
             "perl-libintl-perl"
             "perl-sys-virt"
	     "perl-module-build"
	     "jansson"
#             "lua"
#             "ghc"
#             "ruby"
#             "erlang"
#             "gjs"
#             "php"
#             "gobject-introspection"
             "ocaml-findlib"
             "ocaml")
optdepends=("python${_pythonver}: Python bindings"
#            "ruby: Ruby Bindings"
#            "gjs: Javascript Bindings for GNOME"
#            "php: PHP bindings"
#            "erlang: Erlang Bindings"
#            "ghc: Haskell Bindings"
#            "lua: Lua Bindings"
            "perl: Perl Bindings"
            "perl-sys-virt: Sys-Virt tools"
            "ocaml: Ocaml libs")
provides=("guestfish=${pkgver}")
options=()
source=("http://libguestfs.org/download/${pkgver_short}-stable/${pkgname}-${pkgver}.tar.gz"
        "update-libguestfs-appliance")
sha512sums=('d288f15d5a70b4b87a4271ea2eb7dc0ec4f48fdb136b8f62003352a069f75573de873e1063763889f410fb1b99951252e9a48dd73bf0233047f21aae43ac6de2'
            '6f695baf27927a7643b2b3f6a2497ca37e306b2e8640bd6025c49f1fc3b243a379b38ad6183acb099e9d762e5ab55b28bbdfab0c6dbd1d3fe748caa0846b1c5a')

check() {
    # test-lock fails, perhaps related to:
    # http://lists.gnu.org/archive/html/bug-gnulib/2013-10/msg00059.html
    # test-thread_create failed too.
    : make check
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

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
    --disable-golang

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/usr/lib/guestfs" "$pkgdir/var/cache/guestfs"
  install -Dm755 "${srcdir}/update-libguestfs-appliance" "${pkgdir}/usr/bin/update-libguestfs-appliance"
}

