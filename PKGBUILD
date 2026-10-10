# Maintainer: Sandwich <sandwich@archworks.co>
#
# QEMU 11.1.2 with the platform-identity patches from vfio-native, installed
# under /opt/qemu-native so the system qemu package is never touched. Clears
# FIRMWARE, VIRTUAL_DISK, DISK_SERIAL, PCI_VENDOR, DEVICES, QEMU_FW_CFG and
# QEMU_USB. Only the x86_64 system emulator is built.

pkgname=vfio-native-qemu
_qver=11.1.2
_tag=1.4.0
pkgver=${_qver}
pkgrel=2
pkgdesc="QEMU ${_qver} with the vfio-native platform-identity patches, in /opt/qemu-native"
arch=('x86_64')
url="https://git.archworks.co/sandwich/vfio-native"
license=('GPL-2.0-only')
depends=('glib2' 'pixman' 'zlib' 'zstd' 'libaio' 'liburing' 'libcap-ng' 'libseccomp'
         'gnutls' 'nettle' 'libslirp' 'spice' 'spice-protocol' 'libepoxy' 'virglrenderer'
         'mesa' 'libjpeg-turbo' 'libpng' 'libusb' 'usbredir' 'numactl' 'libxkbcommon'
         'libgcrypt' 'libtasn1' 'lzo' 'snappy' 'pipewire')
makedepends=('git' 'meson' 'ninja' 'python')
optdepends=('vfio-native: the setup tooling that points a domain at this build')
options=('!strip')
source=("git+${url}.git#tag=v${_tag}"
        "https://download.qemu.org/qemu-${_qver}.tar.xz")
sha256sums=('SKIP'
            '731b5681e4bb18be313231579b8efd0296c5b015fa36dc533874b639ba838016')

prepare() {
    cd "qemu-${_qver}"
    for p in "${srcdir}"/vfio-native/patches/qemu/[0-9][0-9]-*.patch; do
        msg2 "applying ${p##*/}"
        patch -Np1 --no-backup-if-mismatch -i "$p"
    done
}

build() {
    cd "qemu-${_qver}"
    mkdir -p build && cd build
    ../configure --prefix=/opt/qemu-native --target-list=x86_64-softmmu \
        --enable-kvm --enable-spice --enable-opengl --enable-virglrenderer \
        --enable-tpm --enable-slirp --disable-docs --disable-werror --disable-user \
        --disable-gtk --disable-sdl
    ninja
}

package() {
    cd "qemu-${_qver}/build"
    DESTDIR="${pkgdir}" ninja install
}
