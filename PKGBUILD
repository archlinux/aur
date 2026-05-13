# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-quota
_npmname=@slkiser/opencode-quota
pkgver=3.8.2
pkgrel=1
pkgdesc="OpenCode plugin for quota & token usage tracking with zero context window pollution"
arch=('x86_64')
url="https://github.com/slkiser/opencode-quota"
license=('MIT')
depends=('gcc-libs' 'nodejs' 'opencode')
makedepends=('npm')
options=('!debug')
install=$pkgname.install

source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$pkgname-$pkgver.tgz"
        "$pkgname-$pkgver-package-lock.json::https://raw.githubusercontent.com/slkiser/opencode-quota/v$pkgver/package-lock.json")
sha256sums=('f9bc9d674bbe99d851b8b160dc0c04c1ab938f407d296a1f8c1d41160b3c1c74'
            'ffda6696a2c03408de304f5a829ddfc07fb7d671ff996139cfa9100f72786cfc')

latestver() {
    curl -fsSL "https://registry.npmjs.org/$_npmname/latest" | jq -r '.version'
}

package() {
    cd "$srcdir/package"

    cp "$srcdir/$pkgname-$pkgver-package-lock.json" package-lock.json
    npm ci --omit=dev --ignore-scripts

    mapfile -t _peerdeps < <(node <<'JS'
const fs = require("node:fs")

const pkg = JSON.parse(fs.readFileSync("package.json", "utf8"))
const lock = JSON.parse(fs.readFileSync("package-lock.json", "utf8"))

for (const name of Object.keys(pkg.peerDependencies ?? {})) {
  const locked = lock.packages?.[`node_modules/${name}`]?.version
  if (!locked) throw new Error(`package-lock.json does not pin ${name}`)
  console.log(`${name}@${locked}`)
}
JS
    )
    if ((${#_peerdeps[@]})); then
        rm -rf "$srcdir/peer-root"
        npm install --prefix "$srcdir/peer-root" --omit=dev --ignore-scripts "${_peerdeps[@]}"
        cp -a "$srcdir/peer-root/node_modules/." node_modules/
    fi

    # Remove build tools pulled in by npm resolution (not needed at runtime)
    rm -rf node_modules/typescript node_modules/.bin
    rm -f node_modules/@msgpackr-extract/msgpackr-extract-linux-x64/*.musl.node
    rm -rf node_modules/@opentui/core/lib/tree-sitter/assets
    rm -rf node_modules/jsesc/man node_modules/marked/man

    install -d "$pkgdir/usr/lib/opencode/plugins/$pkgname"
    cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname/"
    chmod 755 "$pkgdir/usr/lib/opencode/plugins/$pkgname/dist/bin/opencode-quota.js"
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/opencode/plugins/$pkgname/dist/bin/opencode-quota.js" "$pkgdir/usr/bin/opencode-quota"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
