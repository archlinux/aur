# Maintainer: Pol Rivero < aur AT polrivero DOT com >
# Contributor: Padraic Fanning < fanninpm AT miamioh DOT edu >
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Ian MacKay <immackay0@gmail.com>

_pkgname='github-desktop-plus'
pkgname="${_pkgname}-bin"
pkgver=3.5.2.1
pkgrel=1
pkgdesc="Fork of GitHub Desktop with extra features and improvements (binary release)."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/pol-rivero/github-desktop-plus"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=(
    'curl'
    'libcurl-gnutls'
    'git'
    'libsecret'
    'libxss'
    'nspr'
    'nss'
    'org.freedesktop.secrets'
    'unzip'
)
optdepends=('hub: CLI interface for GitHub.')
source=(
    "${_pkgname}.desktop"
    'launch-app.sh'
)

_common_download_url="${url}/releases/download/v${pkgver}/GitHubDesktopPlus-v${pkgver}-linux"
source_x86_64=(${_common_download_url}-x86_64.deb)
source_aarch64=(${_common_download_url}-arm64.deb)
source_armv7h=(${_common_download_url}-armhf.deb)

sha256sums=(
    'ef93d32f46b31818ffea85959f5ac67353df2c4da351b273108765b80c7f080d'
    '2fb026db6ac25ade0535ec1fffec415fd1d023fbfd28b452f29523e51921083a'
)
sha256sums_x86_64=('f960b946f744f739b67c9bfbbfd357ff5861da8653dff18a9302d28c75a631e7')
sha256sums_aarch64=('5e0c7a2548d392adc151bad8e8a30cb45ef9cf93a6b6509b9bdc3ee21419bcd5')
sha256sums_armv7h=('f395ad8d74cfdd9b35753abc515199a1e4e919ad0ddb0aa62876c87668fa5d5e')
package() {
    tar xf data.tar.xz -C "${pkgdir}"
    install -d "${pkgdir}/opt/${_pkgname}"

    mv "${pkgdir}/usr/lib/github-desktop-plus/"* "${pkgdir}/opt/${_pkgname}/"
    rmdir "${pkgdir}/usr/lib/github-desktop-plus"
    rmdir "${pkgdir}/usr/lib"
    mv "${pkgdir}/usr/share/doc/github-desktop-plus" "${pkgdir}/usr/share/doc/${_pkgname}"
    mv "${pkgdir}/usr/share/lintian/overrides/github-desktop-plus" "${pkgdir}/usr/share/lintian/overrides/${_pkgname}"
    find "${pkgdir}/usr/share/icons" -name 'github-desktop-plus.png' -execdir mv {} "${_pkgname}.png" \;

    rm "${pkgdir}/usr/share/applications/github-desktop-plus.desktop"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -Dm755 "$srcdir/launch-app.sh" "$pkgdir/usr/bin/${_pkgname}"
}
