# Maintainer: Pol Rivero < aur AT polrivero DOT com >
# Contributor: Padraic Fanning < fanninpm AT miamioh DOT edu >
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Ian MacKay <immackay0@gmail.com>

_pkgname='github-desktop-plus'
pkgname="${_pkgname}-bin"
pkgver=3.5.1
pkgrel=1
pkgdesc="Work-in-progress fork of GitHub Desktop with extra features and improvements."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/pol-rivero/github-desktop-plus"
license=('MIT')
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
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}.desktop)

_common_download_url="${url}/releases/download/v${pkgver}/GitHubDesktopPlus-v${pkgver}-linux"
source_x86_64=(${_common_download_url}-x86_64.deb)
source_aarch64=(${_common_download_url}-arm64.deb)
source_armv7h=(${_common_download_url}-armhf.deb)

sha256sums=('ef93d32f46b31818ffea85959f5ac67353df2c4da351b273108765b80c7f080d')
sha256sums_x86_64=('b586bc0881d981b42a0e9244a17fdaa1a9174d9f82b65248e4f7220c2540e4bf')
sha256sums_aarch64=('1c4198e2b7f93fc335877b73a46e85e007ad113b85d3ed3560f8cd49e0a6519e')
sha256sums_armv7h=('39072a9c7794d5cb9e254ff2cf45fe57d591df719f729fb631fefcaa0e0f158e')
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
