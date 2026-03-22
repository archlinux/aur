# Maintainer: Jasmin <theblazehen@gmail.com>
pkgname=openchamber
_npmname=@openchamber/web
pkgver=1.9.1
pkgrel=1
pkgdesc="Desktop and web interface for OpenCode AI agent"
arch=('x86_64')
url="https://github.com/btriapitsyn/openchamber"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("https://registry.npmjs.org/@openchamber/web/-/web-${pkgver}.tgz")
noextract=("web-${pkgver}.tgz")
sha256sums=('bfe74452cd9b32d982b683285ad369e8d067d7fc044bb1732bec845ea48338e9')

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
    rm -f "$pkgdir/usr/lib/node_modules/@openchamber/web/node_modules/node-pty/prebuilds/linux-arm64/pty.node"

    if [ -f "$pkgdir/usr/lib/node_modules/@openchamber/web/node_modules/node-pty/prebuilds/linux-x64/pty.node" ]; then
        if file "$pkgdir/usr/lib/node_modules/@openchamber/web/node_modules/node-pty/prebuilds/linux-x64/pty.node" | grep -qi 'x86-64'; then
            strip --strip-unneeded "$pkgdir/usr/lib/node_modules/@openchamber/web/node_modules/node-pty/prebuilds/linux-x64/pty.node" || true
        fi
    fi

    find "$pkgdir/usr/lib/node_modules" -type f \( -name '*.so' -o -name '*.node' \) -exec sh -c 'file "$1" | grep -qi x86-64 && strip --strip-unneeded "$1" || true' sh {} \;

    mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
    printf "%s\n" "MIT" > "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
