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
source=('git+https://github.com/deepseek-ai/deepseek-harness.git' 'aur-package.mjs')
sha256sums=('SKIP' 'da872acd5c4c4a047bda1c95f021b9f744e619d8731ef7bd7615f219007e3a81')

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

  node "$srcdir/aur-package.mjs" "$srcdir"

  cd "$srcdir/npm-root"
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
