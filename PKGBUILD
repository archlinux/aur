# Maintainer: kobe-koto <k [at] koto [dot] cc>
pkgname=archavenger-git
_repo=Archavenger
pkgver=0.0.3.r0.g869fc9a
pkgrel=1
pkgdesc="Archavenger is a simple tool for cleaning up Arch Linux package repositories."
arch=('any')
url="https://github.com/kobe-koto/$_repo"
license=('MIT')
makedepends=('git')
depends=(
  'bun'
)
provides=('archavenger')
conflicts=('archavenger')
source=(
  "git+$url.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_repo"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cd "$srcdir/$_repo"

    TargetVersionCodeLine=$(awk "/version/{print NR}" ./package.json)
    OrigVersionCode=$(cat ./package.json | grep -o '"version": "[^"]*' | cut -d '"' -f4)
    sed -i "${TargetLine}s/${OrigVersionCode}/${pkgver}/g" ./package.json

    bun install
    bun run build
}

package() {
    install -Dm755 "$srcdir/$_repo/dist/index.js" "$pkgdir/usr/bin/archavenger"
}
