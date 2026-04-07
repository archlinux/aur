# Maintainer: Ilyas Turki <ilyasturki at gmail dot com>
pkgname=dircmp
pkgver=1.0.3
pkgrel=1
pkgdesc="Terminal TUI for comparing two directories side by side"
arch=('any')
url="https://github.com/ilyasturki/dircmp"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=('rclone: remote directory support')
conflicts=('dircmp-bin')
source=("https://registry.npmjs.org/@ilyasturki/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('3425a5c247455bec366df67c9c131f54edb12222cd6eecd1631fc3f9d2033e31')

package() {
    npm install -g \
        --cache "${srcdir}/npm-cache" \
        --prefix "${pkgdir}/usr" \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Remove references to pkgdir
    find "${pkgdir}" -name package.json -exec sed -i "s|${pkgdir}||g" {} +

    # Fix permissions
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Shell completions
    local _bindir="${pkgdir}/usr/lib/node_modules/@ilyasturki/${pkgname}/bin"
    node "${_bindir}/dircmp.js" completions bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/dircmp"
    node "${_bindir}/dircmp.js" completions zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_dircmp"
    node "${_bindir}/dircmp.js" completions fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/dircmp.fish"
}
