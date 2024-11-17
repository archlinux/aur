# Maintainer: MattMckenzy <mattmckenzy@ctfam.ca>

_pkgname=glass
pkgname="$_pkgname-git"
pkgver=1.3.1
pkgrel=1
pkgdesc="Simple Frameless Browser! Perfect for consuming media from any location."
arch=('x86_64')
license=('MIT')
url="https://github.com/mattmckenzy/$_pkgname"
depends=('gtk3' 'alsa-lib' 'nspr' 'nss')
makedepends=('git' 'npm')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname" || exit
    npm pkg get version --workspaces=false | tr -d \"
}

prepare() {
    cd "$_pkgname" || exit
    npm i
}

check() {
    cd "$_pkgname" || exit
    test -e glass
}

package() {
    cd "$_pkgname" || exit
    
    find . -mindepth 1 -maxdepth 1 \
        \( -name 'src' -or -name 'glass' -or -name 'node_modules' -or -name 'package.json' \
        -or -name 'README.md' -or -name 'CHANGELOG.md' -or -name 'LICENSE' \) \
        -exec install -Dm 755 "{}" "$pkgdir/opt/glass/{}" \;
    
    install -Dm 644 src/resources/.desktop "$pkgdir/usr/share/applications/glass.desktop"
    install -Dm 644 src/resources/logo.png "$pkgdir/usr/share/pixmaps/glass.png"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf /opt/glass/glass "$pkgdir/usr/bin/glass"
}
