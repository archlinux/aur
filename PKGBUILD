# Maintainer: dreamscached <dreamscache.d@gmail.com>
# shellcheck shell=bash disable=SC2164,SC2154

_pkgname=repomix
pkgname=$_pkgname-git
pkgdesc="Repomix (formerly Repopack) is a powerful tool that packs your entire repository into a single, AI-friendly file."
pkgver=r1375.496d90c
pkgrel=1
license=("MIT")
arch=(any)
makedepends=(npm)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("repomix::git+https://github.com/yamadashy/repomix.git")
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    npm install --cache "$srcdir/npm-cache"
}

test() {
    cd "$srcdir/$_pkgname"
    npm run lint && npm run test
}

build() {
    cd "$srcdir/$_pkgname"
    npm run build && npm pack --pack-destination "$srcdir"
}

package() {
    cd "$srcdir/$_pkgname"
    npm install -g --omit=dev --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$_pkgname-"*".tgz"
    install -Dm644 "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
