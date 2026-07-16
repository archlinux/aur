# Maintainer: Pol Rivero < aur AT polrivero DOT com >
# Contributor: Padraic Fanning < fanninpm AT miamioh DOT edu >
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Ian MacKay <immackay0@gmail.com>

_pkgname='desktop-plus'
_old_pkgname='github-desktop-plus'
pkgname="${_pkgname}-bin"
pkgver=3.6.3.1
pkgrel=1
pkgdesc="GitHub Desktop fork with extra features and improvements (binary release)."
arch=('x86_64' 'aarch64')
url="https://github.com/desktop-plus/desktop-plus"
license=('MIT')
provides=(${_pkgname} ${_old_pkgname})
conflicts=(${_pkgname} ${_old_pkgname})
replaces=("${_old_pkgname}-bin")
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

_common_download_url="${url}/releases/download/v${pkgver}/DesktopPlus-v${pkgver}-linux"
source_x86_64=(${_common_download_url}-x86_64.deb)
source_aarch64=(${_common_download_url}-arm64.deb)

sha256sums=(
    'a49191aebdf7c21d7605778e94d1490fcde9af0cb695aaf0d7f30e1214fe0c6c'
    'ccf8e189b15a46a00363c7a40299762ef313827aa4809140f7940c5801db2e27'
)
sha256sums_x86_64=('c4dfa0282c6dd7394c344cd65381a4f6c62de33c52a7ebdb7fd762797b3f1417')
sha256sums_aarch64=('55ba792ca512b7c608f7073d53ef92ed2eda656988797913e247d034b31f29b2')
package() {
    INSTALL_DIR="$pkgdir/opt/${_pkgname}"

    tar --zstd -xf data.tar.zst -C "$pkgdir"
    install -d "$INSTALL_DIR"

    mv "$pkgdir/usr/lib/desktop-plus/"* "$INSTALL_DIR/"
    rmdir "$pkgdir/usr/lib/desktop-plus"
    rmdir "$pkgdir/usr/lib"

    rm "$pkgdir/usr/share/applications/desktop-plus.desktop"
    install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

    install -Dm755 "$srcdir/launch-app.sh" "$pkgdir/usr/bin/${_pkgname}"

    chmod +x "$INSTALL_DIR/resources/app/static/desktop-plus-cli"
    ln -s "/opt/${_pkgname}/resources/app/static/desktop-plus-cli" "$pkgdir/usr/bin/desktop-plus-cli"
}
