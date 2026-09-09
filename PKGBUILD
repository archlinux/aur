pkgname=deepseek-harness-git
pkgver=0.1.5.alpha.1.r16089.g5dda764
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
source=('git+https://github.com/deepseek-ai/deepseek-harness.git' 'aur-package.mjs' 'check-runtime.mjs')
sha256sums=('SKIP' 'aad05717a929cce13e4dd944f682451c9a082089dd0ed5c22d7b144799ddc991' '618b13fc921853382140219303075a167df8a541602cbf81f3b411ca6e159cad')

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
}

check() {
  node "$srcdir/check-runtime.mjs" "$srcdir/npm-root"
  node "$srcdir/npm-root/node_modules/@deepseek-ai/dsh/lib/bin.js" --version
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
