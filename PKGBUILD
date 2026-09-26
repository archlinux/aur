# Maintainer: sunnysab <i@sunnysab.cn>
pkgname=intel-xpu-smi-bin
pkgver=2.2.0
pkgrel=2
# The build version part from the filename
_buildver=1.24.04
pkgdesc="Intel XPU SMI - CLI tool for Intel XPU Manager (Binary, Daemon-less)"
arch=('x86_64')
url="https://github.com/intel/xpumanager"
license=('MIT')

# Core dependencies required for hardware access and firmware updates
depends=(
    'intel-compute-runtime'
    'level-zero-loader'
    'igsc>=1.3.1'
    'intel-metee'        # xpu-smi links libmetee directly (see package())
    'hwloc'
    'libpciaccess'
)
makedepends=('patchelf')

# Conflicts with the daemon-based manager as per Intel documentation
conflicts=('intel-xpumanager' 'intel-xpumanager-bin' 'intel-xpu-smi')
provides=('intel-xpu-smi')

# Use the official GitHub release URL
source=("https://github.com/intel/xpumanager/releases/download/v${pkgver}/xpu-smi_${pkgver}-${_buildver}_amd64.deb")

# IMPORTANT: Run 'updpkgsums' to generate real checksums before AUR submission
sha256sums=('fa8700e97b51c0e19298f53237a02e435b5e1e1377ddcd064813faae29a1d11a')

package() {
    msg2 "Extracting data.tar.zst..."
    # Extract data.tar.zst from the deb package
    bsdtar -O -xf "${srcdir}/xpu-smi_${pkgver}-${_buildver}_amd64.deb" data.tar.zst | bsdtar -C "${pkgdir}" -xvf -

    # --- Fix 1: Library Paths ---
    # The deb package likely puts libs in /usr/lib/x86_64-linux-gnu (Ubuntu style).
    # We must move them to /usr/lib for Arch Linux.
    if [ -d "${pkgdir}/usr/lib/x86_64-linux-gnu" ]; then
        msg2 "Moving libraries to /usr/lib..."
        mv "${pkgdir}/usr/lib/x86_64-linux-gnu/"* "${pkgdir}/usr/lib/"
        rmdir "${pkgdir}/usr/lib/x86_64-linux-gnu"
    fi

    # --- Fix 2: libmetee SONAME ---
    # Upstream builds against Ubuntu's libmetee, whose SONAME carries the full
    # version (currently libmetee.so.6.2.5.0). Arch ships the same scheme at a
    # different version, so rewrite the entry to whatever this system has.
    # Rebuild this package whenever intel-metee bumps its version.
    local _wanted _present
    _wanted=$(patchelf --print-needed "${pkgdir}/usr/bin/xpu-smi" | grep '^libmetee\.so\.')
    _present=$(basename "$(readlink -f /usr/lib/libmetee.so)")
    if [[ -n $_wanted && $_wanted != "$_present" ]]; then
        msg2 "Relinking libmetee: ${_wanted} -> ${_present}"
        patchelf --replace-needed "$_wanted" "$_present" "${pkgdir}/usr/bin/xpu-smi"
    fi

    # Note: Unlike the Manager package, SMI is daemon-less.
    # It does NOT need systemd services, sysusers, or tmpfiles configuration.
    # It runs directly as the invoking user (usually root via sudo).
}
