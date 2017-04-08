# Original maintainer Alex Talker < Alextalker at openmailbox dot com >
# Support Maintainer Filip Brcic < brcha at gna dot org >
# Contributor bitwave < aur [at] oomlu [d0t] de >
# Alex say thanks to Filip about support this package while he was away from Arch.
pkgname=scst
pkgver=3.2.0.7058
kversion=4.10.8
pkgrel=1
pkgdesc="Generic SCSI Target Subsystem For Linux"
arch=('i686' 'x86_64')
url="http://scst.sourceforge.net"
license=('GPL')
conflicts=("${pkgname}")
provides=("${pkgname}")
install=${pkgname}.install
depends=('linux' 'linux-headers')
source=(
    "https://sourceforge.net/projects/scst/files/scst-${version}.tar.bz2/download"
    "https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-${kversion}.tar.xz"
    'queue.patch'
)
md5sums=(
    'SKIP'
    'SKIP'
    '0e0c06a0f050f8aca3824e7d371b9a50'
)

prepare() {
    cd "$srcdir"/scst*

    patch -Np0 -i "$srcdir/queue.patch"
}

build() {
	msg "Build package..."
	cd "$srcdir"/scst*

  # Fix problem with scstadmin
  unset PERL_MM_OPT

  export KVER=$(uname -r)
  export KVERSION=$(uname -r)
  export PREFIX="/usr"
  export MANDIR=/usr/man

  # Fix problems with linux-headers package
  # (rdma headers is missing)
  _kern_inc=("$srcdir"/linux-*/include/)
  export C_INCLUDE_PATH="$_kern_inc:$C_INCLUDE_PATH"

  for d in scst scst_local iscsi-scst; do
      make -C "$d" 2release
      make -C "$d"
  done

  export MANDIR="$pkgdir"/usr/man
  make -C scstadmin
	msg "Done building!"
}

package() {
  msg "Package scst..."
	cd "$srcdir"/scst*

  unset PERL_MM_OPT
  export KVER=$(uname -r)
  export KVERSION=$(uname -r)
  export PREFIX="/usr"
  export DESTDIR="$pkgdir"
  export MANDIR=/usr/man

  for d in scst scst_local iscsi-scst; do
      make -C "$d" INSTALL_MOD_PATH="$pkgdir" install
  done
  # Clean up conflic files
  for f in "$pkgdir"/lib/modules/"$KVER"/modules.*; do
      rm "$f"
  done
  # Resolve symlink
  mv "$pkgdir"/lib "$pkgdir"/usr/

  # scstadmin magic
  export MANDIR="$pkgdir"/usr/man
  make -C scstadmin install_vendor
  mkdir -p "$pkgdir"/usr/bin
  mv "$pkgdir"/usr/sbin/* "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/sbin

  msg "Done with packaging scst"
}
