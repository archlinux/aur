# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>

_npmname=localtunnel
pkgname=nodejs-$_npmname
pkgver=2.0.1
pkgrel=1
#epoch=
pkgdesc="Expose localhost to the world"
arch=('any')
url="https://localtunnel.me"
license=('MIT')
# Most probably
depends=('nodejs')
makedepends=('jq' 'npm')
# The source code
#source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
# Get the NPM registry build, as in: https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/nodejs-emojione
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha512sums=('2e2688e7065dcf4c459084295db348eb6667367f0832c561c311e6840fa1e2f8fc47d246ff4edb4075b0425cb2edbf79ff97d53821c97c81eff9ae579e4bda24')

package() {
    export npm_config_cache="$srcdir/npm_cache"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

    # Add the license
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s "/usr/lib/node_modules/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

    # Fix issues with references to $srcdir & $pkgdir
    local fixed_package_json="$(mktemp)"
    local original_package_json="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$original_package_json" > "$fixed_package_json"
    mv "$fixed_package_json" "$original_package_json"
    chmod 644 "$original_package_json"
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    # Fix permissions and ownership
    find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
    chown -R root:root "$pkgdir/usr"
}
