# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=opencode-quota
_npmname=@slkiser/opencode-quota
pkgver=5.0.2
pkgrel=1
pkgdesc="OpenCode plugin for quota & token usage tracking with zero context window pollution"
arch=('x86_64')
url="https://github.com/slkiser/opencode-quota"
license=('MIT')
depends=('gcc-libs' 'nodejs' 'opencode')
makedepends=('npm')
options=('!debug')
install=$pkgname.install

source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$pkgname-$pkgver.tgz")
sha256sums=('bf98a9994ce579f6fb6cd6ddc5763c502fd38d62d627c229cd06171f313d0c54')

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

    # The plugin reads its store through node:sqlite (bun:sqlite under Bun), so
    # gate the build on the runtime actually providing it.
    node -e '
      const {DatabaseSync} = require("node:sqlite");
      const db = new DatabaseSync(":memory:");
      db.exec("create table t(a)");
      db.prepare("insert into t values (?)").run(1);
      console.log("node:sqlite exercised:", db.prepare("select a from t").get().a);
    '

    # Remove build tools pulled in by npm resolution (not needed at runtime).
    # node-gyp rides along in the tree with its bundled gyp/packaging python
    # sources; nothing imports it at load time (msgpackr resolves its prebuilt
    # binding through node-gyp-build), and shipping it makes namcap demand a
    # python runtime dep for a plugin that never compiles anything.
    rm -rf node_modules/.bin node_modules/node-gyp
    rm -f node_modules/@msgpackr-extract/msgpackr-extract-linux-x64/*.musl.node
    rm -rf node_modules/@opentui/core/lib/tree-sitter/assets
    rm -f node_modules/@opentui/core/lib/tree-sitter/update-assets.js node_modules/@opentui/core/lib/tree-sitter/update-assets.d.ts
    rm -rf node_modules/jsesc/man node_modules/marked/man node_modules/cssesc/man

    install -d "$pkgdir/usr/lib/opencode/plugins/$pkgname"
    cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname/"
    chmod 755 "$pkgdir/usr/lib/opencode/plugins/$pkgname/dist/bin/opencode-quota.js"
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/opencode/plugins/$pkgname/dist/bin/opencode-quota.js" "$pkgdir/usr/bin/opencode-quota"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
