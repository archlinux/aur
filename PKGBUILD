# Maintainer: Dragoon Aethis <dragoon@dragonic.eu>
# Note that this is a temporary package - don't expect updates.
# See package comments for more info.

# Original Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

pkgbase=qemu-patched-vfiomsitest
pkgname=(qemu-patched-vfiomsitest qemu-patched-vfiomsitest-headless
         qemu-patched-vfiomsitest-block-{iscsi,rbd,gluster} qemu-patched-vfiomsitest-guest-agent)
_pkgname=qemu
pkgdesc="QEMU with extra VFIO MSI interrupt patches from https://redd.it/7vsfv7"
pkgver=2.11.0
pkgrel=3
arch=(x86_64)
license=(GPL2 LGPL2.1)
url="http://wiki.qemu.org/"
_headlessdeps=(seabios gnutls libpng libaio numactl jemalloc xfsprogs libnfs
               lzo snappy curl vde2 libcap-ng spice libcacard usbredir)
depends=(virglrenderer sdl2 vte3 libpulse "${_headlessdeps[@]}")
makedepends=(spice-protocol python2 ceph libiscsi glusterfs)
source=("$url/download/${_pkgname}-${pkgver}.tar.xz"{,.sig}
        qemu-ga.service
        65-kvm.rules
        allow_elf64.patch
        cpu-pinning.patch
        audio-improvements.patch
        v2_qemu_zen_smt_cache.patch
        v4_ivshmem.patch
        vfio-msi-1.patch
        vfio-msi-2.patch
        vfio-msi-3.patch
        vfio-msi-4.patch
        vfio-msi-5.patch)
sha256sums=('c9d34a79024eae080ce3853aa9afe503824520eefb440190383003081ce7f437'
            'SKIP'
            'c39bcde4a09165e64419fd2033b3532378bba84d509d39e2d51694d44c1f8d88'
            'a66f0e791b16b03b91049aac61a25950d93e962e1b2ba64a38c6ad7f609b532c'
            '13a6d9e678bdc9e1f051006cfd0555f5a80582368f54c8a1bb5a78ece3832ac4'
            '8d4a7e35ab1a0a465f737cf60fc0392afc430e22354a40a89505f8766a3a3ee8'
            '23338655345d0ee535f34acc124f1ddd75e5ad4483e2bd87294b7ac4fe3fa859'
            'adf3f389849e92c5ea4c4cee0abf1ac5df61a176d296e9263ac773194ba86e57'
            '4acbbd8834dc5782feb86795748f37e1b1aa4f61b54303234ea4f13bd4c0e068'
            '9e7b0c7e54ae0f5a9288b1e65421ecec3f369e5ac34a8660c516897419090c07'
            'f6c12889551a22a2a6d78d106022b47a652987b9b0ab3fbd7494a86400491e26'
            'bbeacc088f39d5baf42281bac1efa930a8eb3277a455e858a8edafdd021b3446'
            'e8935e9e318f4d497ecade9a4b667ed494feba6304b1b4f08f9fd18c9a53c3fa'
            '8f105c549f565f61b1e4f6e2f91109620721cc0d5fd88407aebfdba55440ddf8')
validpgpkeys=('CEACC9E15534EBABB82D3FA03353C9CEF108B584')

case $CARCH in
  i?86) _corearch=i386 ;;
  x86_64) _corearch=x86_64 ;;
esac

prepare() {
  mkdir build-{full,headless}

  cd ${_pkgname}-${pkgver}
  sed -i 's/vte-2\.90/vte-2.91/g' configure

  patch -p1 < ../allow_elf64.patch
  patch -p1 < ../cpu-pinning.patch
  patch -p0 < ../audio-improvements.patch
  patch -p1 < ../v2_qemu_zen_smt_cache.patch
  patch -p1 < ../v4_ivshmem.patch

  # Experimental VFIO MSI interrupt patches, please read before using:
  # https://redd.it/7vsfv7 and on the QEMU mailing list:
  # https://lists.gnu.org/archive/html/qemu-devel/2018-02/msg01543.html
  patch -p1 < ../vfio-msi-1.patch
  patch -p1 < ../vfio-msi-2.patch
  patch -p1 < ../vfio-msi-3.patch
  patch -p1 < ../vfio-msi-4.patch
  patch -p1 < ../vfio-msi-5.patch
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
    --target-list=x86_64-softmmu,x86_64-linux-user \
    --with-gtkabi=3.0 \
    --with-sdlabi=2.0 \
    --enable-modules \
    --enable-jemalloc \
    "${@:2}"

  make
)

package_qemu-patched-vfiomsitest() {
  provides=(qemu-headless qemu)
  conflicts=(qemu-headless qemu)
  replaces=(qemu-kvm)

  _package full
}

package_qemu-patched-vfiomsitest-headless() {
  pkgdesc="QEMU without GUI"
  depends=("${_headlessdeps[@]}")
  conflicts=(qemu-headless)
  _package headless
}

_package() {
  optdepends+=('ovmf: Tianocore UEFI firmware for qemu'
               'samba: SMB/CIFS server support'
               'qemu-patched-vfiomsitest-block-iscsi: iSCSI block support'
               'qemu-patched-vfiomsitest-block-rbd: RBD block support'
               'qemu-patched-vfiomsitest-block-gluster: glusterfs block support')
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
  done
}

package_qemu-patched-vfiomsitest-block-iscsi() {
  pkgdesc="QEMU iSCSI block module"
  depends=(glib2 libiscsi jemalloc)
  conflicts=(qemu-block-iscsi)
  provides=(qemu-block-iscsi)

  install -D build-full/block-iscsi.so "$pkgdir/usr/lib/qemu/block-iscsi.so"
}

package_qemu-patched-vfiomsitest-block-rbd() {
  pkgdesc="QEMU RBD block module"
  depends=(glib2 ceph)
  conflicts=(qemu-block-rbd)
  provides=(qemu-block-rbd)

  install -D build-full/block-rbd.so "$pkgdir/usr/lib/qemu/block-rbd.so"
}

package_qemu-patched-vfiomsitest-block-gluster() {
  pkgdesc="QEMU GlusterFS block module"
  depends=(glib2 glusterfs)
  conflicts=(qemu-block-gluster)
  provides=(qemu-block-gluster)

  install -D build-full/block-gluster.so "$pkgdir/usr/lib/qemu/block-gluster.so"
}

package_qemu-patched-vfiomsitest-guest-agent() {
  pkgdesc="QEMU Guest Agent"
  depends=(gcc-libs glib2)
  conflicts=(qemu-guest-agent)
  provides=(qemu-guest-agent)

  install -D build-full/qemu-ga "$pkgdir/usr/bin/qemu-ga"
  install -Dm644 qemu-ga.service "$pkgdir/usr/lib/systemd/system/qemu-ga.service"
  install -Dm755 "$srcdir/${_pkgname}-${pkgver}/scripts/qemu-guest-agent/fsfreeze-hook" "$pkgdir/etc/qemu/fsfreeze-hook"
}

# vim:set ts=2 sw=2 et:
