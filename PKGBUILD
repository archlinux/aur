# Maintainer: dougefresh <dchimento@gmail.com>
pkgname='pi-coding-agent-git'
pkgver=0.87.1.r9.gfde38ed7c
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
sha256sums=('SKIP' '3667009db46761988244e62c6d9f8d4e75ff7c846d2f5f979e503eecb85bf97d' 'SKIP')
options=('!strip' '!debug')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$srcdir/$_pkgname"
    npm ci --ignore-scripts --no-audit --no-fund
    npm run build

    local _stage="$srcdir/$_pkgname-package"
    mkdir -p "$_stage"
    local _tarball
    _tarball=$(cd packages/coding-agent && npm pack --ignore-scripts --pack-destination "$srcdir")
    bsdtar -xf "$srcdir/$_tarball" -C "$_stage" --strip-components=1
    (
        cd "$_stage"
        npm install --omit=dev --ignore-scripts --no-audit --no-fund --package-lock=false
    )
}

package() {
    # wrapper script
    install -Dm755 "$srcdir/pi-wrapper" "$pkgdir/usr/bin/pi"
    # Install the upstream npm package layout, including its production dependencies.
    local _destdir="$pkgdir/usr/lib/node_modules/$_pkgname"
    mkdir -p "$_destdir"
    cp -a "$srcdir/$_pkgname-package/." "$_destdir/"

    # docs
    install -Dm644 "$_destdir/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 "$srcdir/APPEND_SYSTEM.md.example" "$pkgdir/usr/share/doc/$_pkgname/APPEND_SYSTEM.md.example"
}
