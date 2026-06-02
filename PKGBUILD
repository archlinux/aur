# Maintainer: Ilyas Turki <ilyasturki at gmail dot com>
pkgname=dircmp
pkgver=1.5.2
pkgrel=1
pkgdesc="Terminal TUI for comparing two directories side by side"
arch=('x86_64' 'aarch64')
url="https://github.com/ilyasturki/dircmp"
license=('MIT')
depends=('nodejs' 'dbus')
makedepends=('npm')
optdepends=('rclone: remote directory support')
conflicts=('dircmp-bin')
source=("https://registry.npmjs.org/@ilyasturki/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('009ce03ee9a79506ef59e60104876849f7552cda1c63253bba5a07622b9578bf')

package() {
    npm install -g \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr" \
        --omit=dev \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Remove references to pkgdir
    find "${pkgdir}" -name package.json -exec sed -i "s|${pkgdir}||g" {} +

    # Fix permissions
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # License
    local _moddir="${pkgdir}/usr/lib/node_modules/@ilyasturki/${pkgname}"
    install -Dm644 "${_moddir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Shell completions
    local _bindir="${_moddir}/bin"
    node "${_bindir}/dircmp.js" completions bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/dircmp"
    node "${_bindir}/dircmp.js" completions zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_dircmp"
    node "${_bindir}/dircmp.js" completions fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/dircmp.fish"
}
