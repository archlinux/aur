pkgname=deepseek-harness-bin
_npmver=0.1.2-rc.1
pkgver=0.1.2rc.1
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
sha256sums=('ca370668053ad6d0ac325e919ef5f65de53de00b7bad78008e6fb422dfce3530')

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
