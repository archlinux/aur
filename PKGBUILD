# Maintainer: wpd
# Co-Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>
# Contributor: MazeChaZer

_npmscope=angular
_npmname=cli
_npmid="@$_npmscope/$_npmname"

pkgname="$_npmscope-$_npmname"
pkgver=9.0.2
pkgrel=1
pkgdesc="CLI tool for Angular"
arch=('any')
url="https://github.com/$_npmscope/$pkgname"
license=('MIT')
depends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$_npmid/-/$_npmname-$pkgver.tgz")
noextract=("${source[@]%%::*}")
md5sums=('914c426c5f1084a281343e2c13e04f70')

package() {
    # Setting temporary cache
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]%%::*}"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root $pkgdir

    # Package contains reference to $srcdir/$pkgdir
    find "${pkgdir}" -type f -name package.json -exec sed -i -e "/${pkgdir//\//\\/}/d" -e "/${srcdir//\//\\/}/d" {} \;
    sed -i "s|$pkgdir||" "$pkgdir"/usr/lib/node_modules/@angular/cli/node_modules/sshpk/package.json

    install -Dm644 "$pkgdir/usr/lib/node_modules/$_npmid/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
