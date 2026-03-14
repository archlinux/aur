# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=openchamber
_npmname=@openchamber/web
pkgver=1.8.7
pkgrel=1
pkgdesc="Desktop and web interface for OpenCode AI agent"
arch=('x86_64')
url="https://github.com/btriapitsyn/openchamber"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/@openchamber/web/-/web-${pkgver}.tgz")
noextract=("web-${pkgver}.tgz")
sha256sums=('bd8825d8a1604bda4c9fe18b5d2a68e562c62d36d136edf9ff43ac82749ad7c4')

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

    rm -f "$pkgdir/usr/lib/node_modules/@openchamber/web/node_modules/bun-pty/rust-pty/target/release/librust_pty_arm64.so"

    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
    printf "%s\n" "MIT" > "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
