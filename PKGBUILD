pkgname=deepseek-harness-bin
_npmver=0.1.0-rc.7
pkgver=0.1.0rc.7
pkgrel=1
pkgdesc='DeepSeek Harness CLI and agent harness'
arch=('x86_64')
url='https://github.com/deepseek-ai/deepseek-harness'
license=('MIT')
depends=('nodejs' 'pnpm')
makedepends=('npm')
options=('!strip')
provides=('deepseek-harness')
conflicts=('deepseek-harness' 'deepseek-harness-git')
source=("dsh-${_npmver}.tgz::https://registry.npmjs.org/@deepseek-ai/dsh/-/dsh-${_npmver}.tgz")
sha256sums=('2f8f0b763d611ac536f7a9411ee43c0afc067c1b8732c3102c04dbe398bcacc5')

prepare() {
  rm -rf npm-root npm-cache
  mkdir -p npm-root/usr npm-cache

  npm install --global \
    --prefix "$srcdir/npm-root/usr" \
    --cache "$srcdir/npm-cache" \
    --omit=dev \
    --no-audit \
    --no-fund \
    --allow-scripts=@deepseek-ai/dsh-subprocess-local,koffi,node-pty \
    "$srcdir/dsh-${_npmver}.tgz"
}

package() {
  cp -a "$srcdir/npm-root/usr/." "$pkgdir/usr/"
  install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"
}
