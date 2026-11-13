# Maintainer: Alex S. <shantanna_at_hotmail_dot_com>

pkgname=dsh-superagent-prototype-git
pkgver=0.1.0.r1.g8c32a9d
pkgrel=1
pkgdesc='DSH Superagent prototype — proactive GitHub/Feishu agent bundle for DeepSeek Harness (git)'
arch=('any')
url='https://github.com/deepseek-ai/dsh-superagent-prototype'
license=('MIT')
depends=('nodejs')
makedepends=('nodejs' 'npm' 'pnpm' 'git')
provides=('dsh-superagent-prototype')
conflicts=('dsh-superagent-prototype' 'dsh-superagent-prototype-bin')
options=('!strip')
source=('git+https://github.com/deepseek-ai/dsh-superagent-prototype.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dsh-superagent-prototype"
  printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/dsh-superagent-prototype"
  pnpm install
}

build() {
  cd "$srcdir/dsh-superagent-prototype"
  pnpm build
}

package() {
  cd "$srcdir/dsh-superagent-prototype"
  install -d "$pkgdir/usr/lib/dsh-superagent-prototype"
  cp -a lib cordis.patch.yml locale prompts skills package.json README.md LICENSE \
    "$pkgdir/usr/lib/dsh-superagent-prototype/"

  # Runtime dependencies (zod, proper-lockfile) — peer dependencies come from DSH.
  cd "$pkgdir/usr/lib/dsh-superagent-prototype"
  npm install --omit=dev --legacy-peer-deps --no-audit --no-fund

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "$srcdir/dsh-superagent-prototype/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
