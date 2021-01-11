pkgname=reveal-md
pkgver=4.3.0
pkgrel=2
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('nodejs')
makedepends=('yarn')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/webpro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0bbb5f27416bb63349914f05f37e68fa08957b917f5dca1625b677a77ad89942')

build() {
    cd $srcdir/$pkgname-$pkgver
    yarn install --prod --cache-dir=$srcdir/cache --link-dir=$srcdir/link --ignore-optional
    yarn autoclean --init
    yarn autoclean --force
    find . -type d -name "README*" -exec rm -rf {} +
    find . -type d -name "LICENSE" -exec rm -rf {} +
    rm -rf .yarnclean
    rm -rf *lock*
}

package() {
    local _npmdir="$pkgdir/usr/lib/$pkgname/"
    install -dm755 $_npmdir
    cd $_npmdir
    cp -r --no-preserve=ownership --preserve=mode $srcdir/$pkgname-$pkgver/* ./
    install -Dm755 /dev/stdin $pkgdir/usr/bin/$pkgname <<END
#!/bin/env bash
node /usr/lib/$pkgname/bin/$pkgname.js \"\$\@\"
END
}

# vim:set ts=2 sw=2 et:
