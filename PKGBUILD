# Maintainer: Pol Rivero < aur AT polrivero DOT com >
# Contributor: Padraic Fanning < fanninpm AT miamioh DOT edu >
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Ian MacKay <immackay0@gmail.com>

_pkgname='github-desktop-plus'
pkgname="${_pkgname}-bin"
pkgver=0.2.0
pkgrel=1
pkgdesc="Work-in-progress fork of GitHub Desktop with extra features and improvements."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/pol-rivero/github-desktop-plus"
license=('MIT')
depends=(
    'curl'
    'git'
    'libsecret'
    'libxss'
    'nspr'
    'nss'
    'org.freedesktop.secrets'
    'unzip'
)
optdepends=('hub: CLI interface for GitHub.')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}.desktop)

_common_download_url="${url}/releases/download/v${pkgver}/GitHubDesktopPlus-v${pkgver}-linux"
source_x86_64=(${_common_download_url}-x86_64.deb)
source_aarch64=(${_common_download_url}-arm64.deb)
source_armv7h=(${_common_download_url}-armhf.deb)

sha256sums=('ef93d32f46b31818ffea85959f5ac67353df2c4da351b273108765b80c7f080d')
sha256sums_x86_64=('ae942f76c1d3bb64907f7d1c6c4923f44a51cf6bce2523b549964e27fb53ffe7')
sha256sums_aarch64=('5128980c96927511eb50989b51f200a2d9e71fa293ef2dd1b73b5d6cbd065f4f')
sha256sums_armv7h=('937bd7242a80a3436061a4d28d29b049750b0ec8baa6fb1dfd5f7ec9df452457')
package() {
    tar xf data.tar.xz -C "${pkgdir}"
    install -d "${pkgdir}/opt/${_pkgname}"

    mv "${pkgdir}/usr/lib/github-desktop/"* "${pkgdir}/opt/${_pkgname}/"
    rmdir "${pkgdir}/usr/lib/github-desktop"
    rmdir "${pkgdir}/usr/lib"
    mv "${pkgdir}/usr/share/doc/github-desktop" "${pkgdir}/usr/share/doc/${_pkgname}"
    mv "${pkgdir}/usr/share/lintian/overrides/github-desktop" "${pkgdir}/usr/share/lintian/overrides/${_pkgname}"
    find "${pkgdir}/usr/share/icons" -name 'github-desktop.png' -execdir mv {} "${_pkgname}.png" \;

    rm "${pkgdir}/usr/share/applications/github-desktop.desktop"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    ln -sf "/opt/$_pkgname/github-desktop" "${pkgdir}/usr/bin/$_pkgname"
    rm "${pkgdir}/usr/bin/github-desktop"
}
