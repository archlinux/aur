# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=kimaki
pkgver=0.4.71
pkgrel=1
pkgdesc="Discord bot - Iron Man's Jarvis for coding agents with OpenCode integration"
arch=('x86_64')
url="https://github.com/remorses/kimaki"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
options=('!strip')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('96d905c68904763ce59869cdaf60277b8ce65f07f64545b2bc86535735e571a2')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" \
        "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/cli/issues/1103 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    # Remove build artifacts (object files, static libs, gyp configs, Makefiles)
    # These are left behind by native addon builds and shouldn't be in the package.
    # Also removes $pkgdir references embedded in build-tmp files.
    find "${pkgdir}" -type d -name 'build-tmp*' -exec rm -rf {} + 2>/dev/null || true

    # Remove references to pkgdir
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    # Remove references to srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}
