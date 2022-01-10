# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

pkgbase=qemu-pinning
_pkgname=qemu
pkgname=(
  qemu-pinning
  qemu-pinning-headless
  qemu-pinning-arch-extra
  qemu-pinning-headless-arch-extra
  qemu-pinning-block-{iscsi,rbd,gluster}
  qemu-pinning-guest-agent
)
pkgdesc="A generic and open source machine emulator and virtualizer, with the qemu-pinning patch from 64kramsystem (formerly saveriomiroddi) applied."
pkgver=6.2.0
pkgrel=1
arch=(x86_64)
license=(GPL2 LGPL2.1)
url="https://wiki.qemu.org/"
# TODO: consider providing rdma-core
# TODO: consider providing lzfse
makedepends=(
  alsa-lib
  brltty
  bzip2
  cairo
  ceph
  curl
  cdrtools
  dtc
  fuse3
  gcc-libs
  gdk-pixbuf2
  glib2
  glusterfs
  gnutls
  gtk3
  jack
  libaio
  libbpf
  libcacard
  libcap-ng
  libepoxy
  libiscsi
  libnfs
  libpng
  libpulse
  libsasl
  libseccomp
  libslirp
  libssh
  liburing
  libusb
  libx11
  libxkbcommon
  lzo
  mesa
  meson
  ncurses
  ndctl
  numactl
  pam
  python
  python-sphinx
  python-sphinx_rtd_theme
  sdl2
  sdl2_image
  seabios
  snappy
  spice-protocol
  spice
  systemd
  usbredir
  vde2
  virglrenderer
  vte3
  xfsprogs
  zlib
  zstd
)
source=(https://download.qemu.org/qemu-$pkgver.tar.xz{,.sig}
        qemu-pinning-$pkgver.patch
        qemu-guest-agent.service
        65-kvm.rules)
sha512sums=('e9f8231c9e1cfcc41cb47f10a55d63f6b8aee307af00cf6acf64acb7aa4f49fa7e9d6330703a2abea15d8b7bbaba7d3cb08c83edd98d82642367b527df730817'
            'SKIP'
            '5dd369f4d9b2e86fa8de811ee0fa239a69a95c6702aaba2b662efc4327d29c146c1c41a827fd0b99d1ca00e4b57a8bdb72f7f9d4bdeb9b3b8f4f3ff66cbd8cc7'
            '269c0f0bacbd06a3d817fde02dce26c99d9f55c9e3b74bb710bd7e5cdde7a66b904d2eb794c8a605bf9305e4e3dee261a6e7d4ec9d9134144754914039f176e4'
            'bdf05f99407491e27a03aaf845b7cc8acfa2e0e59968236f10ffc905e5e3d5e8569df496fd71c887da2b5b8d1902494520c7da2d3a8258f7fd93a881dd610c99')
validpgpkeys=('CEACC9E15534EBABB82D3FA03353C9CEF108B584') # Michael Roth <flukshun@gmail.com>

case $CARCH in
  i?86) _corearch=i386 ;;
  x86_64) _corearch=x86_64 ;;
esac

prepare() {
  mkdir build-{full,headless}
  mkdir -p extra-arch-{full,headless}/usr/{bin,share/qemu}

  cd ${_pkgname}-${pkgver}
  patch -p1 < ../qemu-pinning-$pkgver.patch
}

build() {
  _build full 

  _build headless \
    --audio-drv-list= \
    --disable-sdl \
    --disable-gtk \
    --disable-vte \
    --disable-brlapi \
    --disable-opengl \
    --disable-virglrenderer \
    --disable-alsa \
    --disable-jack \
    --disable-oss \
    --disable-pa \
    --disable-sdl
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

  ninja
)

package_qemu-pinning() {
  depends=(
    alsa-lib libasound.so
    bzip2 libbz2.so
    cairo
    curl libcurl.so
    dtc
    fuse3
    gcc-libs
    gdk-pixbuf2 libgdk_pixbuf-2.0.so
    glib2 libgio-2.0.so libglib-2.0.so libgmodule-2.0.so libgobject-2.0.so
    gnutls
    gtk3 libgdk-3.so libgtk-3.so
    jack libjack.so
    libaio
    libbpf libbpf.so
    libcacard
    libcap-ng libcap-ng.so
    libepoxy
    libjpeg libjpeg.so
    libnfs
    libpng
    libpulse libpulse.so
    libsasl
    libseccomp libseccomp.so
    libslirp libslirp.so
    libssh libssh.so
    libusb libusb-1.0.so
    liburing liburing.so
    libx11
    libxkbcommon libxkbcommon.so
    lzo
    mesa
    ncurses libncursesw.so
    ndctl
    numactl libnuma.so
    pam libpam.so
    pixman libpixman-1.so
    seabios
    sdl2
    sdl2_image
    snappy
    spice libspice-server.so
    systemd-libs libudev.so
    usbredir
    virglrenderer
    vde2
    vte3 libvte-2.91.so
    zlib
    zstd libzstd.so
  )
  optdepends=(
    'brltty: for braille device support'
    'qemu-pinning-arch-extra: extra architectures support'
  )
  provides=(qemu-headless)
  conflicts=(qemu-headless)
  replaces=(qemu-kvm)

  _package full
}

package_qemu-pinning-headless() {
  pkgdesc="QEMU without GUI"
  depends=(
    bzip2 libbz2.so
    curl libcurl.so
    dtc
    fuse3
    gcc-libs
    glib2 libgio-2.0.so libglib-2.0.so libgmodule-2.0.so libgobject-2.0.so
    gnutls
    libaio
    libbpf libbpf.so
    libcacard
    libcap-ng libcap-ng.so
    libjpeg libjpeg.so
    libnfs
    libpng
    libsasl
    libseccomp libseccomp.so
    libslirp libslirp.so
    libssh libssh.so
    libusb libusb-1.0.so
    liburing liburing.so
    libxkbcommon libxkbcommon.so
    lzo
    ndctl
    numactl libnuma.so
    ncurses libncursesw.so
    pam libpam.so
    pixman libpixman-1.so
    seabios
    snappy
    spice libspice-server.so
    systemd-libs libudev.so
    usbredir
    vde2
    zlib
    zstd libzstd.so
  )
  optdepends=('qemu-pinning-headless-arch-extra: extra architectures support')

  _package headless
}

_package() {
  optdepends+=('samba: SMB/CIFS server support'
               'qemu-pinning-block-iscsi: iSCSI block support'
               'qemu-pinning-block-rbd: RBD block support'
               'qemu-pinning-block-gluster: glusterfs block support')
  install=qemu.install
  options=(!strip !emptydirs)

  DESTDIR="$pkgdir" ninja -C build-$1 install "${@:2}"

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
  depends=(
    dtc
    fuse3
    gcc-libs
    gnutls
    libaio
    libbpf libbpf.so
    glib2 libgio-2.0.so libglib-2.0.so libgobject-2.0.so libgmodule-2.0.so
    libjpeg libjpeg.so
    libpng
    libsasl
    libseccomp libseccomp.so
    libslirp libslirp.so
    liburing liburing.so
    lzo
    ndctl
    numactl libnuma.so
    pam libpam.so
    pixman libpixman-1.so
    snappy
    systemd-libs
    libudev.so
    qemu-pinning
    vde2
    zlib
    zstd
    libzstd.so
  )
  optdepends=(
    'edk2-armvirt: for aarch64 UEFI support'
    'edk2-ovmf: for ia32 and x64 UEFI support'
  )
  provides=(qemu-headless-arch-extra)
  conflicts=(qemu-headless-arch-extra)
  options=(!strip)

  mv -v extra-arch-full/usr "$pkgdir"
}

package_qemu-pinning-headless-arch-extra() {
  pkgdesc="QEMU without GUI, for foreign architectures"
  depends=(
    dtc
    fuse3
    gcc-libs
    gnutls
    libaio
    libbpf libbpf.so
    glib2 libgio-2.0.so libglib-2.0.so libgobject-2.0.so libgmodule-2.0.so
    libjpeg libjpeg.so
    libpng
    libsasl
    libseccomp libseccomp.so
    libslirp libslirp.so
    liburing liburing.so
    lzo
    ndctl
    numactl libnuma.so
    pam libpam.so
    pixman libpixman-1.so
    snappy
    qemu-pinning-headless
    systemd-libs libudev.so
    vde2
    zlib
    zstd libzstd.so
  )
  optdepends=(
    'edk2-armvirt: for aarch64 UEFI support'
    'edk2-ovmf: for ia32 and x64 UEFI support'
  )
  options=(!strip)

  mv -v extra-arch-headless/usr "$pkgdir"
}

package_qemu-pinning-block-iscsi() {
  pkgdesc="QEMU iSCSI block module"
  depends=(glibc libiscsi)

  install -vDm 755 build-full/block-iscsi.so -t "$pkgdir/usr/lib/qemu/"
}

package_qemu-pinning-block-rbd() {
  pkgdesc="QEMU RBD block module"
  depends=(glibc ceph-libs)

  install -vDm 755 build-full/block-rbd.so -t "$pkgdir/usr/lib/qemu/"
}

package_qemu-pinning-block-gluster() {
  pkgdesc="QEMU GlusterFS block module"
  depends=(glibc glusterfs)

  install -vDm 755 build-full/block-gluster.so -t "$pkgdir/usr/lib/qemu/"
}

package_qemu-pinning-guest-agent() {
  pkgdesc="QEMU Guest Agent"
  depends=(gcc-libs glib2 libudev.so liburing)
  install=qemu-guest-agent.install

  install -vDm 755 build-full/qga/qemu-ga -t "$pkgdir/usr/bin/"
  install -vDm 644 qemu-guest-agent.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 755 "$srcdir/qemu-$pkgver/scripts/qemu-guest-agent/fsfreeze-hook" -t "$pkgdir/etc/qemu/"
}

# vim:set ts=2 sw=2 et:
