# Libguestfs: Installer: Arch
# Contributor: Peter Wu <peter@lekensteyn.nl>
# Contributor: Evaggelos Balaskas <eblaskas _AT_ ebalaskas _DOT_ gr>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Nikos Skalkotos <skalkoto (at) Gmail.com>
# Maintainer: Csaba Henk <csaba+arch@lowlife.hu>

pkgname=libguestfs-git
_pkgname=libguestfs
pkgver=1.42.0.r21.g4837698d8
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
depends=("qemu-headless"
         "augeas"
         "hivex>=1.3.2"
         "libconfig"
         "libvirt"
         "fuse"
         "file"
         "cpio"
         "wget"
	 "jansson"
	 "supermin>=5.1")
makedepends=("qemu-headless"
             "pcre"
             "cdrkit"
             "libvirt"
             "libconfig"
             "libxml2"
             "gperf"
             "rpcsvc-proto"
             "python"
             "perl"
             "perl-string-shellquote"
             "perl-libintl-perl"
             "perl-sys-virt"
	     "perl-module-build"
	     "jansson"
	     "po4a"
#             "lua"
#             "ghc"
             "ruby-rdoc"
             "ruby-rake"
#             "erlang"
#             "gjs"
#             "php"
             "gobject-introspection"
             "ocaml-findlib"
             "ocaml"
             "go"
             "rust")
optdepends=("python: Python bindings"
            "ruby: Ruby Bindings"
#            "gjs: Javascript Bindings for GNOME"
#            "php: PHP bindings"
#            "erlang: Erlang Bindings"
#            "ghc: Haskell Bindings"
#            "lua: Lua Bindings"
            "perl: Perl Bindings"
            "perl-sys-virt: Sys-Virt tools"
            "ocaml: Ocaml libs")
provides=("guestfish=${pkgver}" "${_pkgname}")
conflicts=("${_pkgname}")
options=()
source=("git+https://github.com/libguestfs/libguestfs"
        "git+https://git.savannah.gnu.org/git/gnulib.git"
        "git+https://github.com/libguestfs/libguestfs-common"
        "update-libguestfs-appliance")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '6f695baf27927a7643b2b3f6a2497ca37e306b2e8640bd6025c49f1fc3b243a379b38ad6183acb099e9d762e5ab55b28bbdfab0c6dbd1d3fe748caa0846b1c5a')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.gnulib.url $srcdir/gnulib
  git config submodule.oommon.url $srcdir/libguestfs-common
  git submodule update
}

check() {
    # test-lock fails, perhaps related to:
    # http://lists.gnu.org/archive/html/bug-gnulib/2013-10/msg00059.html
    # test-thread_create failed too.
    : make check
}

_fix_pod_files() {
  # work around podfile generation isssue
  rm -f po-docs/podfiles
  make -C po-docs update-po
}

build() {
  cd "${srcdir}/${_pkgname}"

# Currently Lua, Erlang, Php, Haskell and Java bindings
# are disabled. If you want to create any of the aforementioned language
# bindings uncomment the appropriate line in makedepends and remove the
# --disable-* option in ./configure

  ./autogen.sh
  ./configure \
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
    --disable-haskell # \
#    --disable-ruby \
#    --disable-gobject \
#    --disable-golang

  if ! make; then
    _fix_pod_files
    make
  fi
  # for some reason ruby is not properly made (albeit enabled)
  make -C ruby
}

package() {
  cd "${srcdir}/${_pkgname}"
  if ! make DESTDIR="${pkgdir}" install; then
    _fix_pod_files
    make DESTDIR="${pkgdir}" install
  fi

  mkdir -p "$pkgdir/usr/lib/guestfs" "$pkgdir/var/cache/guestfs"
  install -Dm755 "${srcdir}/update-libguestfs-appliance" "${pkgdir}/usr/bin/update-libguestfs-appliance"
}

