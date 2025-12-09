# Maintainer: Manuj Dixit <manujdixit@gmail.com>
pkgname=orchids-bin
_pkgname=orchids
pkgver=0.0.27
pkgrel=1
pkgdesc="The AI Developer"
arch=('x86_64')
url="https://orchids.app"
license=('MIT')
depends=(
    'c-ares'
    'ffmpeg'
    'gtk3'
    'libevent'
    'libvpx'
    'libxslt'
    'libxss'
    'minizip'
    'nss'
    're2'
    'snappy'
    'libnotify'
)
optdepends=(
    'libappindicator-gtk3: System tray indicator support (AUR)'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!emptydirs')
source=("${_pkgname}-${pkgver}.pacman::https://slelguoygbfzlpylpxfs.supabase.co/storage/v1/object/public/desktop-artifact/public/v${pkgver}/linux/orchids.pacman")
sha256sums=('e7efcf79a46661475f3dac4773dc3b68fcba794efb2998bfc6e4af84ec423f81')

package() {
    # Extract the pacman package contents
    tar -xf "${srcdir}/${_pkgname}-${pkgver}.pacman" -C "${pkgdir}/" --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.INSTALL'

    # Ensure proper permissions for the main binary
    chmod 755 "${pkgdir}/opt/Orchids/orchids"

    # Handle chrome-sandbox permissions (setuid for systems without user namespaces)
    chmod 4755 "${pkgdir}/opt/Orchids/chrome-sandbox"

    # Create symlink in /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -sf '/opt/Orchids/orchids' "${pkgdir}/usr/bin/orchids"

    # Install license file (if exists in package)
    install -Dm644 "${pkgdir}/opt/Orchids/LICENSE"* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
