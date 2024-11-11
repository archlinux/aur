# Maintainer: MattMckenzy <mattmckenzy@ctfam.ca>

_pkgname=glass
pkgname="$_pkgname-git"
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple Frameless Browser! Perfect for consuming media from any location."
arch=('x86_64')
license=('MIT')
url="https://github.com/mattmckenzy/$_pkgname"
depends=('electron')
makedepends=('git' 'npm')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    npm pkg get version --workspaces=false | tr -d \"
}

prepare() {
    cd "$_pkgname"
    npm i
}

build() {
    cd "$_pkgname"
    npm run package
}

check() {
    cd "$_pkgname"
    test -e out/glass-linux-x64/glass
}

package() {
    cd "$_pkgname"
    (
        cd out/glass-linux-x64
        sudo find . -type f -exec install -Dm 755 "{}" "/opt/glass/{}" \;
    )
    sudo install -m 644 src/resources/.desktop /usr/share/applications/glass.desktop
    sudo install -m 644 src/resources/logo.png /usr/share/pixmaps/glass.png
    sudo ln -sf /opt/glass/glass /usr/bin/glass
}
