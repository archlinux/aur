# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=shopify-cli
_npmname=@shopify/cli
pkgver=4.6.1
pkgrel=1
pkgdesc="A CLI tool to build for the Shopify platform"
arch=('x86_64')
url="https://github.com/Shopify/cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/@shopify/cli/-/cli-${pkgver}.tgz")
noextract=("cli-${pkgver}.tgz")
sha256sums=('9dd46a82188aa91ed8aa61e33b6993a61ee35cc57ba9fbaee4f4fa6d0781feb9')

package() {
    npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" \
        "${srcdir}/cli-${pkgver}.tgz"

    # Fix cross-directory hardlinks (esbuild may create hardlinks across folders)
    esbuild_dir="$pkgdir/usr/lib/node_modules/@shopify/cli/node_modules"
    if [ -f "$esbuild_dir/esbuild/bin/esbuild" ] && [ -f "$esbuild_dir/@esbuild/linux-x64/bin/esbuild" ]; then
        if [ "$(stat -c %i "$esbuild_dir/esbuild/bin/esbuild")" = "$(stat -c %i "$esbuild_dir/@esbuild/linux-x64/bin/esbuild")" ]; then
            rm -f "$esbuild_dir/esbuild/bin/esbuild"
            cp -p "$esbuild_dir/@esbuild/linux-x64/bin/esbuild" "$esbuild_dir/esbuild/bin/esbuild"
        fi
    fi

    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/@shopify/cli/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"

    # Install license file (try several common names)
    license_files=( "$pkgdir/usr/lib/node_modules/@shopify/cli/LICENSE" \
                    "$pkgdir/usr/lib/node_modules/@shopify/cli/license" \
                    "$pkgdir/usr/lib/node_modules/@shopify/cli/LICENSE.md" \
                    "$pkgdir/usr/lib/node_modules/@shopify/cli/LICENSE.txt" \
                    "$pkgdir/usr/lib/node_modules/@shopify/cli/COPYING" \
                    "$pkgdir/usr/lib/node_modules/@shopify/cli/LICENSES" )
    for lf in "${license_files[@]}"; do
      if [ -f "$lf" ]; then
        install -Dm644 "$lf" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
        break
      fi
    done
    # Fallback: create minimal SPDX license file if none found
    if [ ! -f "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" ]; then
      mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
      printf 'MIT\n' > "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
      chmod 644 "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
