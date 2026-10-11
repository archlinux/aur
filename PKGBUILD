# Maintainer: acceleration3 <acceleration23 at gmail dot com>
#
# A prebuilt release: scripts/package-release.sh builds the tarball in a
# clean Arch userland and it is attached to the GitHub release v$pkgver
# (README.md in this directory has the whole procedure). Building from
# source takes a WDK subset Microsoft does not allow redistributing, a
# patched QEMU, DXVK, vkd3d-proton and two mingw toolchains, which is
# why this package does not.

pkgname=lsw-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Linux Subsystem for Windows: Windows applications as native windows, from a KVM guest with a paravirtual GPU"
arch=('x86_64')
url="https://github.com/acceleration3/linux-subsystem-windows"
# LSW itself; QEMU and its firmware; vkd3d-proton; DXVK. The texts are
# in /usr/share/licenses/lsw-bin.
license=('Apache-2.0' 'GPL-2.0-only' 'LGPL-2.1-or-later' 'Zlib')
provides=('lsw')
conflicts=('lsw')
# The libraries the shipped ELF files link (the release's .depends file,
# from readelf and pacman -Qo in the build container), then what the
# manager runs or reads without linking it.
depends=(
    # lsw-manager, remotewin. remotewin speaks Wayland below Qt and uses
    # Qt's private Gui and WaylandClient API (both in qt6-base since Qt
    # 6.10), so a Qt update calls for a rebuild of this package; see
    # README.md.
    'qt6-base' 'libvirt' 'libisofs' 'libvncserver' 'wimlib' 'hivex'
    'spdlog' 'fmt' 'zlib' 'wayland' 'libxkbcommon'
    # accel-virt: the executor, QEMU and its modules
    'vulkan-icd-loader' 'ocl-icd' 'libglvnd' 'libpipewire'
    'glib2' 'pixman' 'gnutls' 'libpng' 'libjpeg-turbo' 'libsasl' 'snappy' 'lzo'
    'zstd' 'numactl' 'keyutils' 'libslirp' 'libbpf'
    'libelf' 'libcbor' 'systemd-libs' 'libseccomp' 'dtc' 'pam' 'fuse3'
    'libaio' 'liburing' 'capstone'
    'glibc' 'libgcc' 'libstdc++'
    # At run time: the host GPU's Vulkan driver, the UEFI firmware the
    # guest boots, the disk tool, the install-media reader, downloads
    'vulkan-driver' 'edk2-ovmf' 'qemu-img' '7zip' 'curl'
    # The launcher icon's theme directories
    'hicolor-icon-theme'
    # Loaded, not linked, so no NEEDED entry finds it: DXVK's native
    # build opens its window-system backend even with no window, and
    # without it the host serves no Direct3D and the guest desktop
    # crash-loops.
    'sdl3'
)
optdepends=(
    'virtiofsd: shared folders between the host and the guest'
    'opencl-driver: OpenCL in the guest, run on the host GPU'
    'mesa: OpenGL in the guest on an AMD or Intel GPU (the host EGL driver)'
)
install=lsw-bin.install
# Stripped when the release was built (cmake --install --strip), and
# QEMU and accel-virt build without debug info: there is nothing for
# makepkg to strip, and a debug package would be empty.
options=('!strip' '!debug')
source=("https://github.com/acceleration3/linux-subsystem-windows/releases/download/v${pkgver}/lsw-${pkgver}-${CARCH}.tar.zst")
sha256sums=('f94e6520d7caaaf52595cce63349b5575fe7e498ef077c0c5d4d3bbca03334b6')

package() {
    cp -a --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
    # The tarball names its license directory after the project; a
    # package's is named after the package.
    mv "${pkgdir}/usr/share/licenses/lsw" "${pkgdir}/usr/share/licenses/${pkgname}"
}
