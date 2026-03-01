# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=openchamber
_npmname=@openchamber/web
pkgver=1.8.2
pkgrel=1
pkgdesc="Desktop and web interface for OpenCode AI agent"
arch=('any')
url="https://github.com/btriapitsyn/openchamber"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/@openchamber/web/-/web-${pkgver}.tgz")
noextract=("web-${pkgver}.tgz")
sha256sums=('f9b54f5c1a018c13945b92361514b56ba592bc5ae126cc1d2be8512930011718')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" \
        "${srcdir}/web-${pkgver}.tgz"

    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/@openchamber/web/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # Remove literal references to $srcdir and $pkgdir left in some upstream build files
    find "$pkgdir/usr/lib/node_modules" -type f -exec sed -i 's|\$srcdir||g;s|\$pkgdir||g' {} +
    rm -f "$pkgdir/usr/lib/node_modules/@openchamber/web/node_modules/node-pty/build/config.gypi" \
          "$pkgdir/usr/lib/node_modules/@openchamber/web/node_modules/node-pty/build/Makefile"

    # Install license file for namcap (search common license filenames)
    license_files=( "$pkgdir/usr/lib/node_modules/@openchamber/web/LICENSE" "$pkgdir/usr/lib/node_modules/@openchamber/web/license" "$pkgdir/usr/lib/node_modules/@openchamber/web/LICENSE.md" )
    for lf in "${license_files[@]}"; do
      if [ -f "$lf" ]; then
        install -Dm644 "$lf" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
        break
      fi
    done
}
