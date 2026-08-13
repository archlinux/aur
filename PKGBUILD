pkgname=deepseek-harness-git
pkgver=0.1.0rc.5.r12225.g47f9438
pkgrel=2
pkgdesc='DeepSeek Harness CLI and agent harness (git)'
arch=('x86_64')
url='https://github.com/deepseek-ai/deepseek-harness'
license=('MIT')
depends=('nodejs' 'pnpm')
makedepends=('git' 'npm')
options=('!strip')
provides=('deepseek-harness')
conflicts=('deepseek-harness' 'deepseek-harness-bin')
source=('git+https://github.com/deepseek-ai/deepseek-harness.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/deepseek-harness"
  local _ver
  _ver=$(node -p "require('./apps/cli/package.json').version.replace('-rc.', 'rc.')")
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
  node - "$srcdir/runtime-tarballs.txt" <<'NODE'
const fs = require('fs')
const path = require('path')
const cp = require('child_process')
const tarballs = fs.readFileSync(process.argv[2], 'utf8').trim().split('\n')
const dependencies = {}
for (const tarball of tarballs) {
  const manifest = JSON.parse(cp.execFileSync('bsdtar', ['-xOf', tarball, 'package/package.json'], { encoding: 'utf8' }))
  const relative = path.relative(process.cwd(), tarball).replaceAll('\\', '/')
  dependencies[manifest.name] = `file:${relative}`
}
const subprocessLocal = dependencies['@deepseek-ai/dsh-subprocess-local']
if (subprocessLocal === undefined) throw new Error('runtime closure is missing @deepseek-ai/dsh-subprocess-local')
fs.writeFileSync('package.json', `${JSON.stringify({
  name: 'deepseek-harness-aur-build',
  version: '0.0.0',
  private: true,
  dependencies,
  allowScripts: {
    [subprocessLocal]: true,
    koffi: true,
    'node-pty': true,
    '@google/genai': false,
    protobufjs: false,
    'node-addon-require-builtin': false,
  },
}, null, 2)}\n`)
NODE
  npm install --omit=optional --no-audit --no-fund --package-lock=false
  node node_modules/@deepseek-ai/dsh/lib/bin.js --version
}

package() {
  install -d "$pkgdir/usr/lib/deepseek-harness" "$pkgdir/usr/bin"
  cp -a "$srcdir/npm-root/node_modules" "$pkgdir/usr/lib/deepseek-harness/"
  ln -s ../lib/deepseek-harness/node_modules/@deepseek-ai/dsh/lib/bin.js "$pkgdir/usr/bin/dsh"
  install -Dm644 "$srcdir/deepseek-harness/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"
}
