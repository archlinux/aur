# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=fluent-reader
pkgver=1.2.2
pkgrel=1
_pkgname="${pkgname}-${pkgver}"
pkgdesc='Modern desktop RSS reader built with Electron, React, and Fluent UI'
arch=('any')
url='https://hyliu.me/fluent-reader/'
license=('BSD')
depends=('hicolor-icon-theme')
makedepends=('nodejs' 'node-gyp' 'npm')
source=("https://github.com/yang991178/fluent-reader/archive/v${pkgver}.tar.gz"
        'fluent-reader.desktop')
sha256sums=('39006dc6cdbdbadb58084227cda38ba4ffc4d5634f5cdd9a04381f10f9859cc4'
            '8094dd526fcb3bd67913a20224fa8c167068d58b8e0ba51b74e8b74c23f73026')

prepare() {
  cd "$srcdir/$_pkgname"

  sed -i 's|include: \[/src/, /node_modules\\/@fluentui/\],|include: /src/,|' webpack.config.js

  cat > patch-griffel.js <<'EOF'
// Patches @griffel/webpack-plugin for build compatibility:
// - uses `fileURLToPath` so loader resolution works on Windows paths with spaces
// - skips transforming `@griffel/react`'s own runtime files, which break with
//   newer transforms that only accept the public single-argument API shape
const fs = require("node:fs")
const path = require("node:path")

const filePath = path.join(
    __dirname,
    "node_modules",
    "@griffel",
    "webpack-plugin",
    "src",
    "webpackLoader.mjs"
)

if (!fs.existsSync(filePath)) {
    console.warn("patch-griffel.js: file not found, skipping patch:", filePath)
    process.exit(0)
}

let content = fs.readFileSync(filePath, "utf8")

if (
    content.includes("fileURLToPath") &&
    content.includes("griffelReactPath")
) {
    console.log("patch-griffel.js: already patched, skipping.")
    process.exit(0)
}

if (!content.includes("fileURLToPath")) {
    content = content.replace(
        `import * as path from 'node:path';`,
        `import * as path from 'node:path';\nimport { fileURLToPath } from 'node:url';`
    )
    content = content.replace(
        `const __dirname = path.dirname(new URL(import.meta.url).pathname);`,
        `const __dirname = path.dirname(fileURLToPath(import.meta.url));`
    )
}

if (!content.includes("griffelReactPath")) {
    content = content.replace(
        `    const functionNames = functionsToTransform ?? ['makeStyles', 'makeResetStyles', 'makeStaticStyles'];\n    if (!functionNames.some(name => sourceCode.includes(name))) {\n        this.callback(null, sourceCode, inputSourceMap);\n        return;\n    }\n`,
        `    const functionNames = functionsToTransform ?? ['makeStyles', 'makeResetStyles', 'makeStaticStyles'];\n    const griffelReactPath = '${path.sep}node_modules${path.sep}@griffel${path.sep}react${path.sep}';\n    if (this.resourcePath.includes(griffelReactPath) || !functionNames.some(name => sourceCode.includes(name))) {\n        this.callback(null, sourceCode, inputSourceMap);\n        return;\n    }\n`
    )
}

fs.writeFileSync(filePath, content, "utf8")
console.log(
    "patch-griffel.js: patched @griffel/webpack-plugin for build compatibility."
)
EOF
}

build() {
  cd "$_pkgname"
  npm install
  export NODE_ENV=production
  npm run build
  node_modules/.bin/electron-builder --linux dir -p never
}

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/opt/"
  cp -dr --no-preserve=ownership "bin/linux/x64/linux-unpacked" "$pkgdir/opt/$pkgname"
  
  # install binary symlink
  install -d "${pkgdir}/usr/bin/"
  ln -sf /opt/fluent-reader/fluent-reader "${pkgdir}/usr/bin/fluent-reader"
  
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
  
  install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
}
 
