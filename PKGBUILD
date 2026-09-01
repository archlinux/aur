# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-quota
_npmname=@slkiser/opencode-quota
pkgver=4.8.2
pkgrel=2
pkgdesc="OpenCode plugin for quota & token usage tracking with zero context window pollution"
arch=('x86_64')
url="https://github.com/slkiser/opencode-quota"
license=('MIT')
depends=('gcc-libs' 'nodejs' 'opencode')
makedepends=('npm' 'node-gyp' 'python')
options=('!debug')
install=$pkgname.install

source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$pkgname-$pkgver.tgz")
sha256sums=('b15930549ba3c963f2c6572c73aebc6d66eeb4ebac7f587da37437f9739c880d')

latestver() {
    curl -fsSL "https://registry.npmjs.org/$_npmname/latest" | jq -r '.version'
}

package() {
    cd "$srcdir/package"

    npm install --omit=dev --omit=peer --ignore-scripts --legacy-peer-deps

    mapfile -t _peerdeps < <(node -e '
      const pkg = require("./package.json");
      for (const [name, range] of Object.entries(pkg.peerDependencies ?? {}))
        console.log(`${name}@${range}`);
    ')
    if ((${#_peerdeps[@]})); then
        rm -rf "$srcdir/peer-root"
        npm install --prefix "$srcdir/peer-root" --omit=dev --ignore-scripts --legacy-peer-deps "${_peerdeps[@]}"
        cp -a "$srcdir/peer-root/node_modules/." node_modules/
    fi

    # --ignore-scripts above means nothing compiles better-sqlite3's binding, and
    # it ships no prebuilt one, so the module throws when loaded. It is only the
    # fallback for runtimes without node:sqlite, which is why the plugin still
    # works — but a module that cannot load has no business being in the package.
    ( cd node_modules/better-sqlite3 &&
      npm_config_nodedir=/usr node-gyp rebuild --release &&
      find build -mindepth 1 -maxdepth 1 ! -name Release -exec rm -rf {} + &&
      find build/Release -mindepth 1 ! -name '*.node' -exec rm -rf {} + )

    node -e '
      const db = new (require("better-sqlite3"))(":memory:");
      db.prepare("select 1").get();
      db.close();
      console.log("better-sqlite3 binding exercised");
    '

    # Remove build tools pulled in by npm resolution (not needed at runtime)
    rm -rf node_modules/typescript node_modules/.bin
    rm -f node_modules/@msgpackr-extract/msgpackr-extract-linux-x64/*.musl.node
    rm -rf node_modules/@opentui/core/lib/tree-sitter/assets
    rm -f node_modules/@opentui/core/lib/tree-sitter/update-assets.js node_modules/@opentui/core/lib/tree-sitter/update-assets.d.ts
    rm -rf node_modules/jsesc/man node_modules/marked/man

    install -d "$pkgdir/usr/lib/opencode/plugins/$pkgname"
    cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname/"
    chmod 755 "$pkgdir/usr/lib/opencode/plugins/$pkgname/dist/bin/opencode-quota.js"
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/opencode/plugins/$pkgname/dist/bin/opencode-quota.js" "$pkgdir/usr/bin/opencode-quota"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
