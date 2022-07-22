pkgname=reveal-md
pkgver=5.3.4
pkgrel=1
pkgdesc='Get beautiful reveal.js presentations from your Markdown file'
arch=('any')
url='https://webpro.github.io/reveal-md/'
license=('MIT')
depends=(nodejs)
makedepends=(yarn git)
options=('!strip')
source=(git+https://github.com/webpro/$pkgname.git#tag=$pkgver)
sha256sums=('SKIP')

prepare() {
    cd $srcdir/$pkgname
    sed 's,puppeteer,puppeteer-core,' -i package.json
    sed "s,require('puppeteer');,require('puppeteer-core');," -i lib/print.js lib/featured-slide.js
}

build() {    
    cd $srcdir/$pkgname
    rm -rf package-lock.json
    yarn install \
        --cache-folder $srcdir/cache \
        --link-folder $srcdir/link

    # Aggressively remove binary and addins in node_modules
    yarn autoclean -I
    yarn autoclean -F
    find . -name "\.bin" -exec rm -rfv {} +
    find . -name "\.git*" -exec rm -rfv {} +
    find . -name "\.eslintrc*" -exec rm -rfv {} +
    find . -name "\.editorconfig" -exec rm -rfv {} +
    find . -name "\.npm*" -exec rm -rfv {} +
    find . -name "\.yarn*" -exec rm -rfv {} +
    find . -name "\.travis.yml" -exec rm -rfv {} +
    find . -name "\.tonic_example.js" -exec rm -rfv {} +
    find . -name "\.prettierrc.js" -exec rm -rfv {} +
    find . -name "\.coveralls.yml" -exec rm -rfv {} +
    find . -name "\.js*" -exec rm -rfv {} +
    find . -name "\.babelrc.js" -exec rm -rfv {} +
    find . -name "\.vscode" -exec rm -rfv {} +
    find . -name "\.DS_Store" -exec rm -rfv {} +
    find . -name "yarn.lock" -exec rm -rfv {} +

}

package() {
    local _destdir="/usr/lib/node_modules/$pkgname"

    install -dm755 $pkgdir/$_destdir
    cp -a $srcdir/$pkgname/* $pkgdir/$_destdir/

    install -dm755 $pkgdir/usr/bin
    install -Dm755 /dev/stdin $pkgdir/usr/bin/$pkgname <<END
#!/bin/env sh
NODE_ENV=production node $_destdir/bin/$pkgname.js "\$@"
END
}

# vim:set ts=2 sw=2 et:
