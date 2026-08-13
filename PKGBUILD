pkgname=deepseek-harness-git
pkgver=0.1.0.rc.5.r12225.g47f9438
pkgrel=1
pkgdesc='DeepSeek Harness CLI and agent harness (git)'
arch=('x86_64')
url='https://github.com/deepseek-ai/deepseek-harness'
license=('MIT')
depends=('nodejs>=22.19.0')
makedepends=('git' 'npm' 'pnpm>=11')
options=('!strip')
provides=('deepseek-harness' 'dsh')
conflicts=('deepseek-harness' 'deepseek-harness-bin')
source=('git+https://github.com/deepseek-ai/deepseek-harness.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/deepseek-harness"
  local _ver
  _ver=$(node -p "require('./apps/cli/package.json').version.replace(/-/g, '.')")
  printf '%s.r%s.g%s' "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/deepseek-harness"

  # This hook only manages development git hooks and breaks production packing.
  node -e "const fs=require('fs'); const p=JSON.parse(fs.readFileSync('package.json','utf8')); delete p.scripts.postinstall; fs.writeFileSync('package.json', JSON.stringify(p,null,2)+'\\n')"
  pnpm install --frozen-lockfile
}

build() {
  cd "$srcdir/deepseek-harness"
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
