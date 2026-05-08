# Maintainer: dougefresh <dchimento@gmail.com>
pkgname='pi-coding-agent-git'
pkgver=0.74.0.r5.gdacb7eaa9
pkgrel=1
pkgdesc="Coding agent CLI with read, bash, edit, write tools and session management"
url="https://github.com/earendil-works/pi"
_pkgname=pi-coding-agent
arch=('x86_64')
license=('MIT')
conflicts=('pi-coding-agent')
provides=('pi-coding-agent')
install=pi-coding-agent-git.install
makedepends=('git' 'npm')
depends=('nodejs')
pkgbase=pi-coding-agent-git
source=(
    "${_pkgname}::git+https://github.com/earendil-works/pi"
    'pi-wrapper'
    'APPEND_SYSTEM.md.example'
)
sha256sums=('SKIP' '7883f9bdeeec04f9e06584ac4b4d55c813377f924623b8dd3b58b1465ab82fa6' 'SKIP')
options=('!strip' '!debug')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$srcdir/$_pkgname"
    npm ci --no-audit --no-fund
    npm run build
    npm prune --omit=dev --no-audit --no-fund
}

package() {
    # wrapper script
    install -Dm755 "$srcdir/pi-wrapper" "$pkgdir/usr/bin/pi"
    # install monorepo to /usr/lib/node_modules/pi-coding-agent
    cd "$srcdir/$_pkgname"
    local _destdir="$pkgdir/usr/lib/node_modules/$_pkgname"
    mkdir -p "$_destdir"
    cp -a package.json node_modules packages "$_destdir/"

    # docs
    install -Dm644 packages/coding-agent/README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 "$srcdir/APPEND_SYSTEM.md.example" "$pkgdir/usr/share/doc/$_pkgname/APPEND_SYSTEM.md.example"
}
