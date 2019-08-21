# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>

_npmname=localtunnel
pkgname=nodejs-$_npmname
pkgver=1.9.2
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
sha512sums=('344285edb0c913d537c7326ede46dac85d164ef9e0e8fc30eedcea35bfd7b44011630ab0ec22845fb06f38c83df05b44f5eb360918b397ad60915de14bc76a62')

package() {
    export npm_config_cache="$srcdir/npm_cache"
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz

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
