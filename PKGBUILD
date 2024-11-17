# Maintainer: MattMckenzy <mattmckenzy@ctfam.ca>

_pkgname=glass
pkgname="$_pkgname-git"
pkgver=1.3.7
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

    (
        cd node_modules || exit
        find . -type f -exec install -Dm 755 "{}" "$pkgdir/opt/glass/node_modules/{}" \;
    )

    (
        cd src || exit
        find . -type f -exec install -Dm 755 "{}" "$pkgdir/opt/glass/src/{}" \;
    )

    install -Dm 755 glass "$pkgdir/opt/glass/glass"
    install -Dm 644 package.json "$pkgdir/opt/glass/package.json"
    install -Dm 644 CHANGELOG.md "$pkgdir/opt/glass/CHANGELOG.md"
    install -Dm 644 README.md "$pkgdir/opt/glass/README.md"

    install -Dm 644 src/resources/.desktop "$pkgdir/usr/share/applications/glass.desktop"
    install -Dm 644 src/resources/logo.png "$pkgdir/usr/share/pixmaps/glass.png"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf /opt/glass/glass "$pkgdir/usr/bin/glass"
}
