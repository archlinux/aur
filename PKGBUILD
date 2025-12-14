# Maintainer: Pol Rivero < aur AT polrivero DOT com >
# Contributor: Padraic Fanning < fanninpm AT miamioh DOT edu >
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Ian MacKay <immackay0@gmail.com>

_pkgname='github-desktop-plus'
pkgname="${_pkgname}-bin"
pkgver=3.5.5.1
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
    '480742d5e68d1e64e3732b521ebfdd40944573a8f43c187eb24c6109c21a37fe'
    '2fb026db6ac25ade0535ec1fffec415fd1d023fbfd28b452f29523e51921083a'
)
sha256sums_x86_64=('cea60db7611f5d375fe8baa097eb5a54905da08be85cc6962710e831364297f9')
sha256sums_aarch64=('c7c64b5ca0b60aa75639242263ecf43ec948e78f113f070762fac7cc602f2063')
sha256sums_armv7h=('89a485ab036452cd06371dd90814e1e19a37274aa7bcd0769df685db775f0ba3')
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
