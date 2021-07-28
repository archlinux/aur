pkgname=reveal-md
pkgver=5.1.2
pkgrel=1
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='http://webpro.github.io/reveal-md/'
license=('MIT')
depends=('nodejs')
makedepends=('yarn')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/webpro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e46afc31246b722012d7a7ca4b974463098e85faa1b09c850a80882fbb22effd')

build() {
    cd $srcdir/$pkgname-$pkgver
    yarn install --prod --cache-dir=$srcdir/cache --link-dir=$srcdir/link --ignore-optional
    yarn autoclean --init
    yarn autoclean --force --non-interactive
    find . -type f -depth \( -iname 'license' -o -iname 'readme*' \) -execdir rm -rfv {} \;
    find . -type d -name ".bin" -exec rm -rfv {} +
    rm -rf .yarnclean
    rm -rf *lock*
}

package() {
    local _npmdir="$pkgdir/usr/lib/$pkgname/"
    install -dm755 $_npmdir
    cd $_npmdir
    cp -r --no-preserve=ownership --preserve=mode $srcdir/$pkgname-$pkgver/* ./
    install -Dm755 /dev/stdin $pkgdir/usr/bin/$pkgname <<END
#!/bin/env sh
node /usr/lib/$pkgname/bin/$pkgname.js "\$@"
END
}

# vim:set ts=2 sw=2 et:
