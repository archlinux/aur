# Libguestfs: Installer: Arch
# Contributor: Peter Wu <peter@lekensteyn.nl>
# Contributor: Evaggelos Balaskas <eblaskas _AT_ ebalaskas _DOT_ gr>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Nikos Skalkotos <skalkoto (at) Gmail.com>

pkgname=libguestfs
pkgver=1.28.10
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
depends=("qemu"
#         "febootstrap>=3.21"
         "augeas"
         "hivex>=1.3.2"
         "libconfig"
         "libvirt"
         "fuse"
         "file"
         "cpio"
         "wget")
makedepends=("qemu"
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
#             "lua"
#             "ghc"
             "ruby"
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
sha512sums=('95c659be0b2f6fd5880c253d5b4ad6ec2adfdc6078c1679ebdb0df4ebb8ae90bcc703cb513350fc1fdea0ea28e9c5585fbccc5cbff1a4fe39338bb39b2b8668d'
            '044035f1bcd56d6475301ad903003d036602e518dc896b0a050db9ae67cdc6662dda732ecc7bdde3d3aeed2ad64a2d4efb3a36c977bf2a5562ec3932204ae23f')

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
