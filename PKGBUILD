# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

pkgbase=qemu-patched
pkgname=(qemu-patched qemu-patched-headless qemu-patched-arch-extra qemu-patched-headless-arch-extra
         qemu-patched-block-{iscsi,rbd,gluster} qemu-patched-guest-agent)
_pkgname=qemu
pkgdesc="A generic and open source machine emulator and virtualizer - Patched for extra functionality"
pkgver=2.11.0
pkgrel=2
arch=(x86_64)
license=(GPL2 LGPL2.1)
url="http://wiki.qemu.org/"
_headlessdeps=(seabios gnutls libpng libaio numactl jemalloc xfsprogs libnfs
               lzo snappy curl vde2 libcap-ng spice libcacard usbredir)
depends=(virglrenderer sdl2 vte3 libpulse "${_headlessdeps[@]}")
makedepends=(spice-protocol python2 ceph libiscsi glusterfs)
source=("$url/download/${_pkgname}-${pkgver}.tar.bz2"{,.sig}
        qemu-ga.service
        65-kvm.rules
        allow_elf64.patch
        cpu-pinning.patch
        audio-improvements.patch
        v2_qemu_zen_smt_cache.patch
        v4_ivshmem.patch)
sha256sums=('c4f034c7665a84a1c3be72c8da37f3c31ec063475699df062ab646d8b2e17fcb'
            'SKIP'
            'c39bcde4a09165e64419fd2033b3532378bba84d509d39e2d51694d44c1f8d88'
            'a66f0e791b16b03b91049aac61a25950d93e962e1b2ba64a38c6ad7f609b532c'
            '13a6d9e678bdc9e1f051006cfd0555f5a80582368f54c8a1bb5a78ece3832ac4'
            '8d4a7e35ab1a0a465f737cf60fc0392afc430e22354a40a89505f8766a3a3ee8'
            '23338655345d0ee535f34acc124f1ddd75e5ad4483e2bd87294b7ac4fe3fa859'
            'adf3f389849e92c5ea4c4cee0abf1ac5df61a176d296e9263ac773194ba86e57'
            '4acbbd8834dc5782feb86795748f37e1b1aa4f61b54303234ea4f13bd4c0e068')
validpgpkeys=('CEACC9E15534EBABB82D3FA03353C9CEF108B584')

case $CARCH in
  i?86) _corearch=i386 ;;
  x86_64) _corearch=x86_64 ;;
esac

prepare() {
  mkdir build-{full,headless}
  mkdir -p extra-arch-{full,headless}/usr/{bin,share/qemu}

  cd ${_pkgname}-${pkgver}
  sed -i 's/vte-2\.90/vte-2.91/g' configure

  patch -p1 < ../allow_elf64.patch
  patch -p1 < ../cpu-pinning.patch
  patch -p0 < ../audio-improvements.patch
  patch -p1 < ../v2_qemu_zen_smt_cache.patch
  patch -p1 < ../v4_ivshmem.patch
}

build() {
  _build full \
    --audio-drv-list="pa alsa sdl"

  _build headless \
    --audio-drv-list= \
    --disable-bluez \
    --disable-sdl \
    --disable-gtk \
    --disable-vte \
    --disable-opengl \
    --disable-virglrenderer
}

_build() (
  cd build-$1

  # qemu vs. make 4 == bad
  export ARFLAGS=rv

  # http://permalink.gmane.org/gmane.comp.emulators.qemu/238740
  export CFLAGS+=" -fPIC"

  ../${_pkgname}-${pkgver}/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/qemu \
    --python=/usr/bin/python2 \
    --smbd=/usr/bin/smbd \
    --with-gtkabi=3.0 \
    --with-sdlabi=2.0 \
    --enable-modules \
    --enable-jemalloc \
    "${@:2}"

  make
)

package_qemu-patched() {
  optdepends=('qemu-patched-arch-extra: extra architectures support')
  provides=(qemu-headless qemu)
  conflicts=(qemu-headless qemu)
  replaces=(qemu-kvm)

  _package full
}

package_qemu-patched-headless() {
  pkgdesc="QEMU without GUI"
  depends=("${_headlessdeps[@]}")
  optdepends=('qemu-patched-headless-arch-extra: extra architectures support')
  conflicts=(qemu-headless)
  _package headless
}

_package() {
  optdepends+=('ovmf: Tianocore UEFI firmware for qemu'
               'samba: SMB/CIFS server support'
               'qemu-patched-block-iscsi: iSCSI block support'
               'qemu-patched-block-rbd: RBD block support'
               'qemu-patched-block-gluster: glusterfs block support')
  install=qemu.install
  options=(!strip)

  make -C build-$1 DESTDIR="$pkgdir" install "${@:2}"

  # systemd stuff
  install -Dm644 65-kvm.rules "$pkgdir/usr/lib/udev/rules.d/65-kvm.rules"

  # remove conflicting /var/run directory
  cd "$pkgdir"
  rm -r var

  cd usr/lib
  tidy_strip

  # bridge_helper needs suid
  # https://bugs.archlinux.org/task/32565
  chmod u+s qemu/qemu-bridge-helper

  # remove split block modules
  rm qemu/block-{iscsi,rbd,gluster}.so

  cd ../bin
  tidy_strip

  # remove extra arch
  for _bin in qemu-*; do
    [[ -f $_bin ]] || continue

    case ${_bin#qemu-} in
      # guest agent
      ga) rm "$_bin"; continue ;;

      # tools
      img|io|nbd) continue ;;

      # core emu
      system-${_corearch}) continue ;;
    esac

    mv "$_bin" "$srcdir/extra-arch-$1/usr/bin"
  done

  cd ../share/qemu
  for _blob in *; do
    [[ -f $_blob ]] || continue

    case $_blob in
      # provided by seabios package
      bios.bin|acpi-dsdt.aml|bios-256k.bin|vgabios-cirrus.bin|vgabios-qxl.bin|\
      vgabios-stdvga.bin|vgabios-vmware.bin) rm "$_blob"; continue ;;

      # iPXE ROMs
      efi-*|pxe-*) continue ;;

      # core blobs
      kvmvapic.bin|linuxboot*|multiboot.bin|sgabios.bin|vgabios*) continue ;;

      # Trace events definitions
      trace-events*) continue ;;

      # Logos
      *.bmp|*.svg) continue ;;
    esac

    mv "$_blob" "$srcdir/extra-arch-$1/usr/share/qemu"
  done
}

package_qemu-patched-arch-extra() {
  pkgdesc="QEMU for foreign architectures"
  depends=(qemu)
  provides=(qemu-headless-arch-extra qemu-arch-extra)
  conflicts=(qemu-headless-arch-extra qemu-arch-extra)
  options=(!strip)

  mv extra-arch-full/usr "$pkgdir"
}

package_qemu-patched-headless-arch-extra() {
  pkgdesc="QEMU without GUI, for foreign architectures"
  depends=(qemu-headless)
  options=(!strip)
  conflicts=(qemu-headless-arch-extra)
  provides=(qemu-headless-arch-extra)
  
  mv extra-arch-headless/usr "$pkgdir"
}

package_qemu-patched-block-iscsi() {
  pkgdesc="QEMU iSCSI block module"
  depends=(glib2 libiscsi jemalloc)
  conflicts=(qemu-block-iscsi)
  provides=(qemu-block-iscsi)
  
  install -D build-full/block-iscsi.so "$pkgdir/usr/lib/qemu/block-iscsi.so"
}

package_qemu-patched-block-rbd() {
  pkgdesc="QEMU RBD block module"
  depends=(glib2 ceph)
  conflicts=(qemu-block-rbd)
  provides=(qemu-block-rbd)
  
  install -D build-full/block-rbd.so "$pkgdir/usr/lib/qemu/block-rbd.so"
}

package_qemu-patched-block-gluster() {
  pkgdesc="QEMU GlusterFS block module"
  depends=(glib2 glusterfs)
  conflicts=(qemu-block-gluster)
  provides=(qemu-block-gluster)
  
  install -D build-full/block-gluster.so "$pkgdir/usr/lib/qemu/block-gluster.so"
}

package_qemu-patched-guest-agent() {
  pkgdesc="QEMU Guest Agent"
  depends=(gcc-libs glib2)
  conflicts=(qemu-guest-agent)
  provides=(qemu-guest-agent)
  
  install -D build-full/qemu-ga "$pkgdir/usr/bin/qemu-ga"
  install -Dm644 qemu-ga.service "$pkgdir/usr/lib/systemd/system/qemu-ga.service"
  install -Dm755 "$srcdir/${_pkgname}-${pkgver}/scripts/qemu-guest-agent/fsfreeze-hook" "$pkgdir/etc/qemu/fsfreeze-hook"
}

# vim:set ts=2 sw=2 et:
