# Maintainer: Pol Rivero < aur AT polrivero DOT com >
# Contributor: Padraic Fanning < fanninpm AT miamioh DOT edu >
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Ian MacKay <immackay0@gmail.com>

_pkgname='github-desktop-plus'
pkgname="${_pkgname}-bin"
pkgver=3.5.6.6
pkgrel=1
pkgdesc="Fork of GitHub Desktop with extra features and improvements (binary release)."
arch=('x86_64' 'aarch64')
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

sha256sums=(
    '480742d5e68d1e64e3732b521ebfdd40944573a8f43c187eb24c6109c21a37fe'
    '2fb026db6ac25ade0535ec1fffec415fd1d023fbfd28b452f29523e51921083a'
)
sha256sums_x86_64=('74c93473e02688f371ce67008c9dbea9f146df6580f295fca008f2b78b46c211')
sha256sums_aarch64=('479d5dc1a8df5b330981d00bfc5ae77e267fd658de316a79dc2eeec9e906c7f6')
package() {
    INSTALL_DIR="$pkgdir/opt/${_pkgname}"

    tar --zstd -xf data.tar.zst -C "$pkgdir"
    install -d "$INSTALL_DIR"

    mv "$pkgdir/usr/lib/github-desktop-plus/"* "$INSTALL_DIR/"
    rmdir "$pkgdir/usr/lib/github-desktop-plus"
    rmdir "$pkgdir/usr/lib"

    rm "$pkgdir/usr/share/applications/github-desktop-plus.desktop"
    install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

    install -Dm755 "$srcdir/launch-app.sh" "$pkgdir/usr/bin/${_pkgname}"

    chmod +x "$INSTALL_DIR/resources/app/static/github"
    ln -s "/opt/${_pkgname}/resources/app/static/github" "$pkgdir/usr/bin/github-desktop-plus-cli"
}
