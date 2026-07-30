# Maintainer: Yakov Till <yakov.till@gmail.com>

_npmname=lat.md
pkgname=lat.md
pkgver=0.12.2
pkgrel=1
pkgdesc="A knowledge graph for your codebase, written in markdown"
arch=('x86_64')
url="https://github.com/1st1/lat.md"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
options=('!debug')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('5879417268f30d9147638f4e559bfd6d78761c63534ae960726e6bc3d7cb4a21')

latestver() {
    curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" | jq -r '.version'
}

package() {
    npm install -g \
        --prefix "$pkgdir/usr" \
        --cache "$srcdir/npm-cache" \
        --ignore-scripts \
        --omit=dev \
        "$srcdir/${pkgname}-${pkgver}.tgz"

    # Remove non-linux native binaries
    find "$pkgdir/usr" -type f -name '*.node' \
        \( -name '*darwin*' -o -name '*win32*' -o -name '*musl*' \) \
        -delete
    # Remove non-linux platform optional-dep directories
    find "$pkgdir/usr/lib/node_modules/${_npmname}/node_modules/@libsql" \
        -mindepth 1 -maxdepth 1 -type d \
        \( -name '*darwin*' -o -name '*win32*' -o -name '*musl*' \) \
        -exec rm -rf {} + 2>/dev/null || true

    # Clean npm metadata referencing $srcdir/$pkgdir
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
    local fixed original
    original="$pkgdir/usr/lib/node_modules/${_npmname}/package.json"
    fixed="$(mktemp)"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$original" > "$fixed"
    mv "$fixed" "$original"
    chmod 644 "$original"

    # Remove stray caches and man pages from transitive deps
    find "$pkgdir/usr" -type d -name .cache -exec rm -rf {} + 2>/dev/null || true
    find "$pkgdir/usr/lib/node_modules/${_npmname}/node_modules" \
        -type d -name man -exec rm -rf {} + 2>/dev/null || true

    # License
    install -Dm644 "$pkgdir/usr/lib/node_modules/${_npmname}/LICENSE" \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

    # Fix permissions
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
    chown -R root:root "$pkgdir"
}
