pkgname=dlnacast-git
pkgver=r14.4b9f8a3
pkgrel=1
pkgdesc="A commandline UPnP/DLNA caster"
arch=('any')
makedepends=('git')
url="https://github.com/xat/dlnacast"
license=('MIT')
depends=('nodejs' 'npm')
source=($pkgname::git://github.com/xat/dlnacast.git)
md5sums=(SKIP)

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd $pkgname
    mkdir -p $pkgdir/usr
    npm install --user root -g --prefix="$pkgdir/usr"
    cd $pkgdir
    cd usr/lib/node_modules/
    rm dlnacast
    mv ../../../../../src/dlnacast-git dlnacast
    cd dlnacast
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
