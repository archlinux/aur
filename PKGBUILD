pkgname=deepseek-harness
pkgver=0.1.0_rc.5
pkgrel=1
pkgdesc='DeepSeek Harness CLI and agent harness'
arch=('x86_64')
url='https://github.com/deepseek-ai/deepseek-harness'
license=('MIT')
depends=('nodejs>=22.19.0')
makedepends=('npm' 'pnpm>=11')
options=('!strip')
provides=('dsh')
conflicts=('deepseek-harness-bin' 'deepseek-harness-git')
_commit='47f943859bef60e4160492346772ded9b24f765a'
source=("deepseek-harness-${_commit}.tar.gz::https://codeload.github.com/deepseek-ai/deepseek-harness/tar.gz/${_commit}")
sha256sums=('534c9f1c9d30fea136026ecf7a23c2137e350f43558e2f1eff6218aef7b15b26')

prepare() {
  cd "$srcdir/deepseek-harness-${_commit}"

  # This hook only manages development git hooks and breaks production packing.
  node -e "const fs=require('fs'); const p=JSON.parse(fs.readFileSync('package.json','utf8')); delete p.scripts.postinstall; fs.writeFileSync('package.json', JSON.stringify(p,null,2)+'\\n')"
  pnpm install --frozen-lockfile
}

build() {
  cd "$srcdir/deepseek-harness-${_commit}"
  pnpm run build

  rm -rf dist/aur-dsh dist/aur-vendor
  pnpm exec tsx scripts/release/pack.ts --family vendor --out dist/aur-vendor
  pnpm exec tsx scripts/release/pack.ts --family dsh --out dist/aur-dsh

  node - "$srcdir/runtime-tarballs.txt" <<'NODE'
const fs = require('fs')
const path = require('path')
const cp = require('child_process')
const packages = new Map()
for (const dir of ['dist/aur-vendor', 'dist/aur-dsh']) {
  for (const file of fs.readdirSync(dir).filter(file => file.endsWith('.tgz'))) {
    const full = path.resolve(dir, file)
    const manifest = JSON.parse(cp.execFileSync('bsdtar', ['-xOf', full, 'package/package.json'], { encoding: 'utf8' }))
    packages.set(manifest.name, { file: full, manifest })
  }
}
const seen = new Set()
function visit(name) {
  if (seen.has(name)) return
  const entry = packages.get(name)
  if (entry === undefined) return
  seen.add(name)
  for (const section of ['dependencies', 'peerDependencies']) {
    for (const dependency of Object.keys(entry.manifest[section] ?? {})) visit(dependency)
  }
}
visit('@deepseek-ai/dsh')
const tarballs = [...seen].sort().map(name => packages.get(name).file)
fs.writeFileSync(process.argv[2], `${tarballs.join('\n')}\n`)
NODE

  rm -rf "$srcdir/npm-root"
  mkdir -p "$srcdir/npm-root"
  cd "$srcdir/npm-root"
  printf '%s\n' '{"name":"deepseek-harness-aur-build","version":"0.0.0","private":true}' > package.json
  mapfile -t _tarballs < "$srcdir/runtime-tarballs.txt"
  npm install --no-save --omit=optional --no-audit --no-fund --package-lock=false "${_tarballs[@]}"
  node node_modules/@deepseek-ai/dsh/lib/bin.js --version
}

package() {
  install -d "$pkgdir/usr/lib/deepseek-harness" "$pkgdir/usr/bin"
  cp -a "$srcdir/npm-root/node_modules" "$pkgdir/usr/lib/deepseek-harness/"
  ln -s ../lib/deepseek-harness/node_modules/@deepseek-ai/dsh/lib/bin.js "$pkgdir/usr/bin/dsh"
  chmod -R u+rwX,go+rX,go-w "$pkgdir/usr/lib/deepseek-harness"
}
