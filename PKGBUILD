# Maintainer: sunnysab <i@sunnysab.cn>
pkgname=intel-xpumanager-bin
pkgver=1.3.5
pkgrel=1
# The build version part from the filename (e.g., 20251216...)
_buildver=20251216.170635.605ff78d.u24.04
pkgdesc="Intel XPU Manager - System management tool for Intel Discrete GPUs (Binary, Daemon-based)"
arch=('x86_64')
url="https://github.com/intel/xpumanager"
license=('MIT')

# Core dependencies
depends=(
    'intel-compute-runtime'
    'level-zero-loader'
    'dbus'
    'systemd'
    'igsc'               # Required for firmware updates (AUR)
    'intel-media-driver' # Required for media features
    'onevpl-intel-gpu'   # Required for VPL runtime
)

# Optional dependencies for full telemetry features
optdepends=(
    'intel-metrics-library: For detailed GPU metrics telemetry'
    'intel-metrics-discovery: For hardware discovery metrics'
)

# XPU Manager and XPU-SMI are mutually exclusive per Intel documentation
conflicts=('intel-xpumanager' 'intel-xpu-smi' 'intel-xpu-smi-bin')
provides=('intel-xpumanager' 'libxpum.so')

# Use the official GitHub release URL for AUR publication
source=("https://github.com/intel/xpumanager/releases/download/v${pkgver}/xpumanager_${pkgver}_${_buildver}_amd64.deb")

# IMPORTANT: Run 'updpkgsums' to generate the real checksum before pushing to AUR
sha256sums=('4a0e710e96bd33fef4912109ff1b3f8d0550838d92e7d5eb88b3e280ed903b66')

package() {
    msg2 "Extracting data.tar.gz..."
    # Extract the data.tar.gz from the deb package
    bsdtar -O -xf "${srcdir}/xpumanager_${pkgver}_${_buildver}_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xvf -

    # --- Fix 1: Library Paths ---
    # Move libraries from Ubuntu-specific path to Arch standard path
    if [ -d "${pkgdir}/usr/lib/x86_64-linux-gnu" ]; then
        msg2 "Moving libraries to /usr/lib..."
        mv "${pkgdir}/usr/lib/x86_64-linux-gnu/"* "${pkgdir}/usr/lib/"
        rmdir "${pkgdir}/usr/lib/x86_64-linux-gnu"
    fi

    # --- Fix 2: Systemd Service Configuration ---
    # Intel provides .template files which need to be renamed and moved
    msg2 "Configuring systemd services..."
    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    
    if [ -f "${pkgdir}/usr/lib/xpum/xpum.service.template" ]; then
        mv "${pkgdir}/usr/lib/xpum/xpum.service.template" "${pkgdir}/usr/lib/systemd/system/xpum.service"
    fi
    
    if [ -f "${pkgdir}/usr/lib/xpum/xpum_rest.service.template" ]; then
        mv "${pkgdir}/usr/lib/xpum/xpum_rest.service.template" "${pkgdir}/usr/lib/systemd/system/xpum_rest.service"
    fi

    # --- Fix 3: Permissions ---
    # Grant execution permissions to helper scripts (simulating postinst 'chmod g+x')
    chmod +x "${pkgdir}/usr/lib/xpum/keytool.sh"
    chmod +x "${pkgdir}/usr/lib/xpum/enable_restful.sh"
    # Ensure service files have correct permissions
    chmod 644 "${pkgdir}/usr/lib/systemd/system/"*.service

    # --- Fix 4: User Creation (sysusers.d) ---
    # Replaces 'CreateUser' from postinst. 
    # Arch creates users at install time via systemd-sysusers.
    msg2 "Creating sysusers configuration..."
    mkdir -p "${pkgdir}/usr/lib/sysusers.d"
    
    # Create user 'xpum', shell /bin/bash (as per deb), add to video/render groups
    cat > "${pkgdir}/usr/lib/sysusers.d/intel-xpumanager.conf" <<EOF
u xpum - "Intel XPU Manager" /var/lib/xpum /bin/bash
m xpum video
m xpum render
EOF

    # --- Fix 5: Directory Ownership (tmpfiles.d) ---
    # Replaces 'chown -R xpum' from postinst.
    # Ensures /usr/lib/xpum is writable by the service user.
    msg2 "Creating tmpfiles configuration..."
    mkdir -p "${pkgdir}/usr/lib/tmpfiles.d"
    
    # Type Z: Recursively restore SELinux context and ownership
    cat > "${pkgdir}/usr/lib/tmpfiles.d/intel-xpumanager.conf" <<EOF
Z /usr/lib/xpum - xpum xpum -
d /var/lib/xpum 0755 xpum xpum -
EOF

    # Create configuration directory
    mkdir -p "${pkgdir}/etc/xpum"
}
