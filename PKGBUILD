# Maintainer: Sick Codes <info at sick dot codes>
# Contributor: Robin Broda <coderobe @ archlinux.org>
# Contributor: Peter Wu <peter@lekensteyn.nl>
# Contributor: Evaggelos Balaskas <eblaskas _AT_ ebalaskas _DOT_ gr>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Nikos Skalkotos <skalkoto (at) Gmail.com>

pkgname=libguestfs-bin
_pkgname=libguestfs
pkgver=1.46.0
_pkgver_short=${pkgver%.*}
pkgrel=1
pkgdesc="Access and modify virtual machine disk images"
arch=('x86_64')
url="http://libguestfs.org/"
license=('GPL2' 'LGPL2.1')
_appliancedeps=('iproute2' 'mdadm' 'lvm2' 'libldm' 'btrfs-progs' 'dosfstools' 'gdisk' 'procps' 'psmisc'
                'rsync' 'xfsprogs' 'dhcpcd' 'iputils' 'ntfs-3g' 'vim' 'systemd-sysvcompat' 'openssh'
                'f2fs-tools' 'jfsutils' 'lsscsi' 'lsof' 'lzop' 'pciutils' 'squashfs-tools'
                'strace' 'syslinux' 'debootstrap' 'exfat-utils' 'grub' 'lrzip' 'mtools'
                'multipath-tools' 'nilfs-utils' 'reiserfsprogs' 'yara')
#               'scrub' 'zerofree' 'hfsprogs')
depends=('augeas' 'libvirt' 'jansson' 'fuse' 'hivex' 'sleuthkit' 'supermin' 'qemu-headless' 'libconfig'
         'perl-libintl-perl' "${_appliancedeps[@]}")
makedepends=('ocaml' 'ocaml-findlib' 'gperf' 'cdrtools' 'perl-module-build' 'python'
             'gobject-introspection' 'vala' 'bash-completion' 'cpio' 'java-environment'
             'php' 'erlang-nox' 'lua' 'rust')
# 'go' 'ghc' 'ruby')
checkdepends=('linux')
optdepends=('ocaml: OCaml Bindings'
            'python: Python Bindings'
            'gobject-introspection: GObject-Introspection Bindings')
provides=('libguestfs' 'libguestfs.so' 'libguestfs-gobject-1.0.so')
conflicts=('libguestfs')
backup=('etc/libguestfs-tools.conf'
        'etc/xdg/virt-builder/repos.d/libguestfs.conf'
        'etc/xdg/virt-builder/repos.d/libguestfs.gpg'
        'etc/xdg/virt-builder/repos.d/opensuse.conf'
        'etc/xdg/virt-builder/repos.d/opensuse.gpg')
source=("https://download.libguestfs.org/${_pkgver_short}-stable/${_pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('11c5a39f241b514558f9a734b7dc1606a9b7cc5b1c8f3c5797a395547a3530ae'
            'SKIP')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0') # Richard W.M. Jones <rjones@redhat.com>

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/ Sys::Virt / /g' m4/guestfs-perl.m4
  autoreconf -vi
}

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-static \
    --disable-haskell \
    --disable-ruby \
    --with-extra-packages="libldm systemd-sysvcompat openssh qemu-headless" \
    --with-guestfs-path=/usr/lib/guestfs
  # ^ haskell & ruby bindings do not build
  make
}

check() {
  cd "$pkgname-$pkgver"
  #tests require /dev/kvm to be available
#  make quickcheck
#  make -k check ||: takes ages
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALLDIRS=vendor DESTDIR="$pkgdir" install
  find "$pkgdir/usr/lib/perl5" -name '*.so' -exec chmod 644 {} +
  find "$pkgdir/usr/lib/perl5" -name '*.bs' -exec rm -f {} +

  # Remove obsolete binaries (RHBZ#1213298).
  rm -f "$pkgdir"/usr/bin/virt-list-{filesystems,partitions}
  rm -f "$pkgdir"/usr/bin/virt-tar
  rm -f "$pkgdir"/usr/share/man/man1/virt-list-{filesystems,partitions}.1*
  rm -f "$pkgdir"/usr/share/man/man1/virt-tar.1*
}
