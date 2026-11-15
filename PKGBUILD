# Maintainer: Pol Rivero < aur AT polrivero DOT com >
# Contributor: Padraic Fanning < fanninpm AT miamioh DOT edu >
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Ian MacKay <immackay0@gmail.com>

_pkgname='desktop-plus'
pkgname="${_pkgname}-bin"
pkgver=3.6.12.0
pkgrel=1
pkgdesc="GitHub Desktop fork with extra features and improvements (binary release)."
arch=('x86_64' 'aarch64')
url="https://github.com/desktop-plus/desktop-plus"
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=(
    'curl'
    'git'
    'gtk3'
    'libnotify'
    'libsecret'
    'nspr'
    'nss'
    'org.freedesktop.secrets'
)
optdepends=('github-cli: CLI interface for GitHub')
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
sha256sums_x86_64=('91ac51e9f338ea4a6d8aa41ddbf547d7437eabc8bb8750955a9a10b8f8a23d87')
sha256sums_aarch64=('eb5295f85984b8e3db4a6f93bba59e15175228f973cdea437237ae5ea0b11b74')
package() {
    INSTALL_DIR="$pkgdir/opt/${_pkgname}"

    tar --zstd -xf data.tar.zst -C "$pkgdir"

    install -d "$pkgdir/opt"
    mv "$pkgdir/usr/lib/desktop-plus" "$INSTALL_DIR"
    rmdir "$pkgdir/usr/lib"

    install -Dm644 "${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

    install -Dm755 "$srcdir/launch-app.sh" "$pkgdir/usr/bin/${_pkgname}"

    chmod +x "$INSTALL_DIR/resources/app/static/desktop-plus-cli"
    ln -s "/opt/${_pkgname}/resources/app/static/desktop-plus-cli" "$pkgdir/usr/bin/desktop-plus-cli"
}
