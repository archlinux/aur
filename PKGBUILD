# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

pkgbase=qemu-pinning
_pkgname=qemu
pkgname=(qemu-pinning qemu-pinning-headless qemu-pinning-arch-extra qemu-pinning-headless-arch-extra qemu-pinning-block-{iscsi,rbd,gluster} qemu-pinning-guest-agent)
pkgdesc="A generic and open source machine emulator and virtualizer. Patch from saveriomiroddi/qemu-pinning applied."
pkgver=6.1.0
pkgrel=1
arch=(x86_64)
license=(GPL2 LGPL2.1)
url="https://wiki.qemu.org/"
_headlessdeps=(seabios gnutls libpng libaio numactl libnfs
               lzo snappy curl vde2 libcap-ng spice libcacard usbredir libslirp
               libssh zstd liburing)
depends=(virglrenderer sdl2 vte3 libpulse brltty "${_headlessdeps[@]}")
makedepends=(spice-protocol python ceph libiscsi glusterfs python-sphinx xfsprogs)
source=(https://download.qemu.org/qemu-$pkgver.tar.xz{,.sig}
        qemu-guest-agent.service
        65-kvm.rules
        qemu-pinning-$pkgver.patch::https://github.com/64kramsystem/qemu-pinning/commit/a9120ed261d2417ce61d0b78da5aa04c65f03e1e.patch
) 
provides=(qemu)
sha512sums=('3378ae21c75b77ee6a759827f1fcf7b2a50a0fef07e3b0e89117108022a8d8655fa977e4d65596f4f24f7c735c6594d44b0c6f69732ea4465e88a7406b1d5d3c'
            'SKIP'
            '269c0f0bacbd06a3d817fde02dce26c99d9f55c9e3b74bb710bd7e5cdde7a66b904d2eb794c8a605bf9305e4e3dee261a6e7d4ec9d9134144754914039f176e4'
            'bdf05f99407491e27a03aaf845b7cc8acfa2e0e59968236f10ffc905e5e3d5e8569df496fd71c887da2b5b8d1902494520c7da2d3a8258f7fd93a881dd610c99'
            '1e1bafbbb9cbaa39dd99da920d0fe896c84c3f9e97bf3128f06b9050fbefc96461f0a0fe7815ed0741850464af90c8556740d0242efbce781b35946c755d6a4c')
validpgpkeys=('CEACC9E15534EBABB82D3FA03353C9CEF108B584')

case $CARCH in
  i?86) _corearch=i386 ;;
  x86_64) _corearch=x86_64 ;;
esac

prepare() {
  mkdir -p build-{full,headless}
  mkdir -p extra-arch-{full,headless}/usr/{bin,share/qemu}

  cd ${_pkgname}-${pkgver}
  patch -p1 < ../qemu-pinning-$pkgver.patch
}

build() {
  _build full \
    --audio-drv-list="pa alsa sdl"

  _build headless \
    --audio-drv-list= \
    --disable-sdl \
    --disable-gtk \
    --disable-vte \
    --disable-brlapi \
    --disable-opengl \
    --disable-virglrenderer
}

_build() (
  cd build-$1

  ../${_pkgname}-${pkgver}/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/qemu \
    --extra-ldflags="$LDFLAGS" \
    --smbd=/usr/bin/smbd \
    --enable-modules \
    --enable-sdl \
    --enable-slirp=system \
    --enable-xfsctl \
    "${@:2}"

  make
)

package_qemu-pinning() {
  optdepends=('qemu-arch-extra: extra architectures support')
  provides=(qemu-headless)
  conflicts=(qemu-headless)
  replaces=(qemu-kvm)

  _package full
}

package_qemu-pinning-headless() {
  pkgdesc="QEMU without GUI"
  depends=("${_headlessdeps[@]}")
  optdepends=('qemu-headless-arch-extra: extra architectures support')

  _package headless
}

_package() {
  optdepends+=('samba: SMB/CIFS server support'
               'qemu-block-iscsi: iSCSI block support'
               'qemu-block-rbd: RBD block support'
               'qemu-block-gluster: glusterfs block support')
  install=qemu.install
  options=(!strip !emptydirs)

  make -C build-$1 DESTDIR="$pkgdir" install "${@:2}"

  # systemd stuff
  install -Dm644 65-kvm.rules "$pkgdir/usr/lib/udev/rules.d/65-kvm.rules"

  # remove conflicting /var/run directory
  cd "$pkgdir"
  rm -r var

  cd usr/lib

  # bridge_helper needs suid
  # https://bugs.archlinux.org/task/32565
  chmod u+s qemu/qemu-bridge-helper

  # remove split block modules
  rm qemu/block-{iscsi,rbd,gluster}.so

  cd ../bin

  # remove extra arch
  for _bin in qemu-*; do
    [[ -f $_bin ]] || continue

    case ${_bin#qemu-} in
      # guest agent
      ga) rm "$_bin"; continue ;;

      # tools
      edid|img|io|keymap|nbd|pr-helper|storage-daemon) continue ;;

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
      bios.bin|bios-256k.bin|vgabios-cirrus.bin|vgabios-qxl.bin|\
      vgabios-stdvga.bin|vgabios-vmware.bin|vgabios-virtio.bin|vgabios-bochs-display.bin|\
      vgabios-ramfb.bin) rm "$_blob"; continue ;;

      # provided by edk2-ovmf package
      edk2-*) rm "$_blob"; continue ;;

      # iPXE ROMs
      efi-*|pxe-*) continue ;;

      # core blobs
      bios-microvm.bin|kvmvapic.bin|linuxboot*|multiboot.bin|sgabios.bin|vgabios*) continue ;;

      # Trace events definitions
      trace-events*) continue ;;
    esac

    mv "$_blob" "$srcdir/extra-arch-$1/usr/share/qemu"
  done

  # provided by edk2-ovmf package
  rm -r firmware

  cd ..
  if [ "$1" = headless ]; then rm -r {applications,icons}; fi
}

package_qemu-pinning-arch-extra() {
  pkgdesc="QEMU for foreign architectures"
  depends=(qemu)
  provides=(qemu-headless-arch-extra)
  conflicts=(qemu-headless-arch-extra)
  options=(!strip)

  mv extra-arch-full/usr "$pkgdir"
}

package_qemu-pinning-headless-arch-extra() {
  pkgdesc="QEMU without GUI, for foreign architectures"
  depends=(qemu-headless)
  options=(!strip)

  mv extra-arch-headless/usr "$pkgdir"
}

package_qemu-pinning-block-iscsi() {
  pkgdesc="QEMU iSCSI block module"
  depends=(glib2 libiscsi)

  install -D build-full/block-iscsi.so "$pkgdir/usr/lib/qemu/block-iscsi.so"
}

package_qemu-pinning-block-rbd() {
  pkgdesc="QEMU RBD block module"
  depends=(glib2 ceph-libs)

  install -D build-full/block-rbd.so "$pkgdir/usr/lib/qemu/block-rbd.so"
}

package_qemu-pinning-block-gluster() {
  pkgdesc="QEMU GlusterFS block module"
  depends=(glib2 glusterfs)

  install -D build-full/block-gluster.so "$pkgdir/usr/lib/qemu/block-gluster.so"
}

package_qemu-pinning-guest-agent() {
  pkgdesc="QEMU Guest Agent"
  depends=(gcc-libs glib2 libudev.so liburing)

  install -D build-full/qga/qemu-ga "$pkgdir/usr/bin/qemu-ga"
  install -Dm644 qemu-guest-agent.service "$pkgdir/usr/lib/systemd/system/qemu-guest-agent.service"
  install -Dm755 "$srcdir/qemu-$pkgver/scripts/qemu-guest-agent/fsfreeze-hook" "$pkgdir/etc/qemu/fsfreeze-hook"
}

# vim:set ts=2 sw=2 et:
