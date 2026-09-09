pkgname=deepseek-harness-git
pkgver=0.1.5.alpha.1.r16089.g5dda764
pkgrel=1
pkgdesc='DeepSeek Harness CLI and agent harness (git)'
arch=('x86_64')
url='https://github.com/deepseek-ai/deepseek-harness'
license=('MIT')
depends=('nodejs' 'pnpm')
makedepends=('git' 'npm')
options=('!strip')
provides=('deepseek-harness')
conflicts=('deepseek-harness' 'deepseek-harness-bin')
source=('git+https://github.com/deepseek-ai/deepseek-harness.git' 'aur-package.mjs')
sha256sums=('SKIP' 'af8d0cc8d2b1b775f8b9d56561e4584a2dff342585e1a399454241023832cb20')

pkgver() {
  cd "$srcdir/deepseek-harness"
  local _ver
  _ver=$(node -p "require('./apps/cli/package.json').version.replace('-rc.', 'rc.').replace(/-/g, '.')")
  printf '%s.r%s.g%s' "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/deepseek-harness"

  # This hook only manages development git hooks and breaks production packing.
  node -e "const fs=require('fs'); const p=JSON.parse(fs.readFileSync('package.json','utf8')); delete p.scripts.postinstall; fs.writeFileSync('package.json', JSON.stringify(p,null,2)+'\\n')"
  # Keep pnpm's mutable store out of the source and package trees.
  export pnpm_config_store_dir="$srcdir/.pnpm-store"
  pnpm install --frozen-lockfile --store-dir "$pnpm_config_store_dir"
}

build() {
  cd "$srcdir/deepseek-harness"
  pnpm run build:official

  rm -rf dist/aur-dsh dist/aur-vendor
  pnpm run release:pack --family vendor --out dist/aur-vendor
  pnpm run release:pack --family dsh --out dist/aur-dsh

  node "$srcdir/aur-package.mjs" "$srcdir"

  cd "$srcdir/npm-root"
  npm install --include=optional --no-audit --no-fund --package-lock=false

  # Verify the assembled runtime through the Session persistence path.
  # This exercises the native locking dependency used by JSONL persistence.
  node --input-type=module <<'EOF'
import { mkdtemp, rm } from 'node:fs/promises'
import { tmpdir } from 'node:os'
import { join } from 'node:path'
import { Context } from '@deepseek-ai/cordis'
import JsonlSessionPersistence from '@deepseek-ai/dsh-session-persistence-jsonl'
import { SESSION_FORMAT_VERSION, SessionId } from '@deepseek-ai/dsh-session'
const root = await mkdtemp(join(tmpdir(), 'dsh-session-'))
try {
  const ctx = new Context()
  await ctx.plugin(JsonlSessionPersistence, { root, compression: 'none' })
  const id = SessionId('aur-packaging-smoke')
  const header = { version: SESSION_FORMAT_VERSION, id, createdAt: Date.now(), isSeeded: false, cwd: '/tmp' }
  const created = await ctx.sessionPersistence.create(header)
  await created.flush()
  await created.close()
  const reopened = await ctx.sessionPersistence.open(id, 'read')
  const result = await reopened.read()
  if (reopened.header.id !== id || result.events.length !== 0) throw new Error('session persistence round-trip failed')
  await reopened.close()
  console.log(`verified persisted Session ${id}`)
} finally { await rm(root, { recursive: true, force: true }) }
EOF

  node node_modules/@deepseek-ai/dsh/lib/bin.js --version
}

package() {
  install -d "$pkgdir/usr/lib/deepseek-harness" "$pkgdir/usr/bin"
  # Preserve the runtime tree's metadata and symlink structure without
  # attempting to preserve source-tree ownership under fakeroot.
  cp -a --no-preserve=ownership "$srcdir/npm-root/node_modules" "$pkgdir/usr/lib/deepseek-harness/"
  ln -s ../lib/deepseek-harness/node_modules/@deepseek-ai/dsh/lib/bin.js "$pkgdir/usr/bin/dsh"
  install -Dm644 "$srcdir/deepseek-harness/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
}
