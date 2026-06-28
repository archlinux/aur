# Maintainer: Pol Rivero < aur AT polrivero DOT com >
# Contributor: Padraic Fanning < fanninpm AT miamioh DOT edu >
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Ian MacKay <immackay0@gmail.com>

_pkgname='desktop-plus'
pkgname="github-desktop-plus-bin"
pkgver=3.6.1.0
pkgrel=1
pkgdesc="GitHub Desktop fork with extra features and improvements (binary release)."
arch=('x86_64' 'aarch64')
url="https://github.com/desktop-plus/desktop-plus"
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

_common_download_url="${url}/releases/download/v${pkgver}/DesktopPlus-v${pkgver}-linux"
source_x86_64=(${_common_download_url}-x86_64.deb)
source_aarch64=(${_common_download_url}-arm64.deb)

sha256sums=(
    'b9c24de9a78b4e4d444cb0ba38817b13acd87c514dd64dd30fce2593e34a11cf'
    'ccf8e189b15a46a00363c7a40299762ef313827aa4809140f7940c5801db2e27'
)
sha256sums_x86_64=('e7c0acd2ae468dee1d274aa2c8691873e9b6de7a0e4ab6ea5a011d568ffc1bd1')
sha256sums_aarch64=('94d462e35052ead84dcf8dd67fa6cff2f4bc54855494d03b73d486db008f8460')
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
