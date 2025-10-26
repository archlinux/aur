# Maintainer: Kyle Thompson <kylejeromethompson@gmail.com>
#
# --- DISCLAIMER ---
# This PKGBUILD is an unofficial community contribution. It is not affiliated with,
# endorsed, or supported by Cloudflare
#
# The Cloudflare WARP agent is proprietary software. By building and installing
# this package, you acknowledge that you are downloading software directly from
# Cloudflare and agree to be bound by their End User License Agreement and
# Privacy Notice. You are solely responsible for ensuring you have a valid
# license to use the software.
#
# This installation script is provided "AS IS" without warranty of any kind,
# express or implied. The user assumes all risk and responsibility for its use.
#
# Terms of Use: https://www.cloudflare.com/website-terms/
# Privacy Notice: https://www.cloudflare.com/application/privacypolicy/

# --- Package Information ---
pkgname='warp-cli'
pkgdesc="Cloudflare WARP Client for Arch Linux"
arch=('x86_64')
url="https://www.cloudflare.com/"
license=('custom')

# --- Versioning ---
_pkgver='2025.8.779.0'
pkgver=${_pkgver}
pkgrel=1

# --- Dependencies and Conflicts ---
# FINAL CHANGE: Added 'nss' and 'dbus' to ensure all runtime dependencies are met.
depends=('glibc' 'openssl' 'gtk3' 'nftables' 'nss' 'dbus')
provides=("${pkgname}")

# --- Source File ---
# CRITICAL CHANGE: 'certificate.crt' is NOT listed here.
# This prevents makepkg from aborting if the file is missing from the PWD.
source=("cloudflare-warp_${_pkgver}_amd64.deb::https://downloads.cloudflareclient.com/v1/download/jammy-intel/version/${_pkgver}")
sha256sums=('SKIP')

# --- Packaging Function ---
package() {
    # Extract the data archive.
    tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"

    # Move binaries from /bin to /usr/bin
    mv "${pkgdir}/bin" "${pkgdir}/usr/bin"

    # The service file is located at ./lib/systemd/system/warp-svc.service inside the archive.
    # We need to move it to /usr/lib/systemd/system/ in the package.
    install -Dm644 "${pkgdir}/lib/systemd/system/warp-svc.service" "${pkgdir}/usr/lib/systemd/system/warp-svc.service"

    # Remove the old directory structure
    rm -r "${pkgdir}/lib"

    # Fix permissions for other files
    if [ -d "${pkgdir}/usr/share/applications" ]; then
        find "${pkgdir}/usr/share/applications" -type f -exec chmod 644 {} +
    fi
    if [ -d "${pkgdir}/usr/share/icons" ]; then
        find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
    fi

    # ----------------------------------------------------
    # NEW RESILIENT STEP: Install Corporate Certificate (OPTIONAL)
    # ----------------------------------------------------
    # Check if 'certificate.crt' exists in the build directory ($srcdir).
    if [ -f "${srcdir}/certificate.crt" ]; then
        echo "Found certificate.crt! Installing to trust anchors for Enterprise use."
        # SOURCE: Looks for the 'certificate.crt' file provided by the user.
        # DESTINATION: Renames it to 'tenant-ca.crt' in the system trust anchors.
        install -Dm644 "${srcdir}/certificate.crt" "${pkgdir}/etc/ca-certificates/trust-source/anchors/tenant-ca.crt"
    else
        echo "Note: certificate.crt not found. Skipping optional enterprise certificate installation."
    fi
}

# --- Installation Script (for running update-ca-trust) ---
# This step is performed immediately after the package files are copied to the system.
post_install() {
    # We run update-ca-trust regardless, as the binary install requires clean trust stores.
    echo "Updating system certificate trust store..."
    update-ca-trust
    echo "Certificate trust store updated successfully."
}

# --- Removal Script ---
post_remove() {
    echo "Updating system certificate trust store after removal..."
    update-ca-trust
    echo "Certificate trust store updated successfully."
}
