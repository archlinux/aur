# Maintainer: wpd
# Co-Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>
# Contributor: MazeChaZer

_npmscope=angular
_npmname=cli
_npmid="@$_npmscope/$_npmname"

pkgname="$_npmscope-$_npmname"
pkgver=15.2.6
pkgrel=1
pkgdesc="CLI tool for Angular"
arch=('any')
url="https://github.com/$_npmscope/$pkgname"
license=('MIT')
depends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$_npmid/-/$_npmname-$pkgver.tgz")
noextract=("${source[@]%%::*}")
# we can easly find the sha1sum (instead of md5sum) as "shasum"
# curl -s "https://registry.npmjs.org/@angular/cli" | jq '.versions."9.0.3".dist.shasum'
sha1sums=('d5994fbd4d02e71017d4dd28ba06dc1c3cb7a976')
options=('!strip')

package() {
    # Setting temporary cache
    npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]%%::*}"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -execdir chmod 755 {} \+

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root $pkgdir

    # Package contains reference to $srcdir/$pkgdir
    #find "${pkgdir}" -type f -name package.json -execdir sed -i '/_where/d' {} \+
    # print first line (the '{' symbol) and lines from the first non-underscored key to the end
    # (npm internal keys are underscored but we don't need these keys)
    #sed -i -n '1p;/  "[^_].*": {$/,$p' "$pkgdir"/usr/lib/node_modules/"$_npmid"/package.json
    #sed -i "s|$pkgdir||" "$pkgdir"/usr/lib/node_modules/"$_npmid"/node_modules/sshpk/package.json

    install -Dm644 "$pkgdir/usr/lib/node_modules/$_npmid/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
