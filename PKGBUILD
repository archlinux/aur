# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Ameer Jhan <$(echo "YW1lZXJqaGFucHJvZkBnbWFpbC5jb20=" | base64 -d)>

pkgname=kubelive-git
pkgver=r000g0000000
pkgrel=2
pkgdesc='Kubelive is kubectl reinvented to be more reactive and interactive'
arch=('any')
url='https://github.com/ameerthehacker/kubelive'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq' 'nodejs' 'nodejs-nopt' 'node-gyp')
provides=('kubelive' 'kubelive-git')
conflicts=('kubelive' 'kubelive-git')
source=('git://github.com/ameerthehacker/kubelive')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/kubelive/" && echo -n "r$(git rev-list --count HEAD | tr -d '\n')g$(git rev-parse --short HEAD | tr -d '\n')"
}

package() {
    cd "$srcdir/"
    npm install -g --cache "${srcdir}/npm-cache" --user root --prefix "${pkgdir}/usr" "https://github.com/ameerthehacker/kubelive.git"
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/kubelive/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
    chown -R root:root "${pkgdir}"
}
