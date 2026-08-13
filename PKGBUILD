pkgname=deepseek-harness
_npmver=0.1.0-rc.6
pkgver=0.1.0rc.6
pkgrel=1
pkgdesc='DeepSeek Harness CLI and agent harness'
arch=('x86_64')
url='https://github.com/deepseek-ai/deepseek-harness'
license=('MIT')
depends=('nodejs' 'pnpm')
makedepends=('npm')
options=('!strip')
conflicts=('deepseek-harness-bin' 'deepseek-harness-git')

# Upstream's source-build/release path is not yet ready for downstream packaging.
# Use the official npm release tarball until upstream provides a complete source release path.
source=("dsh-${_npmver}.tgz::https://registry.npmjs.org/@deepseek-ai/dsh/-/dsh-${_npmver}.tgz")
sha256sums=('1b8a9a0ad3c7feaece47926e0bd37ca151c7ccfa997953afa5fd01261784eadc')

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
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"
}
