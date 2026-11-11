# Maintainer: Kotsasmin

pkgname=kotsasmin-toolkit-git
pkgver=r26.6532eb0
pkgrel=1
pkgdesc="A collection of system optimization, security, and media scripts by Kotsasmin"
arch=('any')
url="https://github.com/Kotsasmin/toolkit"
license=('MIT')
depends=('bash')
optdepends=(
    'yt-dlp: for media downloader'
    'ffmpeg: for media downloader'
    'docker: for security container audits'
    'npm: for node vulnerability audits'
    'screen: for running SCX P2DQ in background'
    'xdg-utils: for opening kotsasmin.net from the menu'
)
makedepends=('git')
provides=('kotsasmin-toolkit' 'toolkit')
conflicts=('kotsasmin-toolkit' 'toolkit')
# Everything comes from the GitHub repository, this package only installs it.
source=("git+https://github.com/Kotsasmin/toolkit.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/toolkit"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${srcdir}/toolkit"

    install -dm755 "${pkgdir}/usr/lib/toolkit"
    cp -r lib media optimization ptero security "${pkgdir}/usr/lib/toolkit/"
    install -Dm755 toolkit.sh "${pkgdir}/usr/lib/toolkit/toolkit.sh"
    # No .git in the package, so the launcher reads its version from this file.
    echo "${pkgver}" > "${pkgdir}/usr/lib/toolkit/VERSION"
    find "${pkgdir}/usr/lib/toolkit" -name '*.sh' -exec chmod 755 {} +
    chmod 644 "${pkgdir}/usr/lib/toolkit/lib/ui.sh"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /usr/lib/toolkit/toolkit.sh "${pkgdir}/usr/bin/toolkit"
    ln -s /usr/lib/toolkit/toolkit.sh "${pkgdir}/usr/bin/kotsasmin-toolkit"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
