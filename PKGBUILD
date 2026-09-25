# Maintainer: calmcrow <calmcrow@outlook.com>
#
# ============================================================
#  weixinpay-ai-installer-bin - Third-party repackaging
# ============================================================
#  Wraps the npm distribution published by Tenpay (WeChat Pay)
#  into a pacman package. Only the installer CLI is shipped;
#  nothing is modified and no agent is touched at install time.
#
#  - Upstream: https://www.npmjs.com/package/@tenpay/weixinpay-ai-installer
#  - Usage:    weixinpay-ai-installer install [--host=openclaw|dsh|hermes]
#
#  The upstream license (LICENSE inside the tarball) is proprietary and
#  restricts re-publishing the artifacts, so this PKGBUILD downloads the
#  tarball straight from the npm registry at build time and never ships
#  it inside this repository.

pkgname=weixinpay-ai-installer-bin
_npmver=1.1.0
pkgver=1.1.0
pkgrel=1
pkgdesc='WeChat Pay AI installer - one command to add WeChat AI payment capability to OpenClaw / DeepSeek Harness agents'
arch=('any')
url='https://www.npmjs.com/package/@tenpay/weixinpay-ai-installer'
license=('custom')
depends=('nodejs>=18')
makedepends=('npm')
provides=('weixinpay-ai-installer')
conflicts=('weixinpay-ai-installer')
options=('!strip')
install=weixinpay-ai-installer-bin.install
source=("weixinpay-ai-installer-${_npmver}.tgz::https://registry.npmjs.org/@tenpay/weixinpay-ai-installer/-/weixinpay-ai-installer-${_npmver}.tgz")
sha256sums=('9a4e865fd7ffaba25d64c1b0dbd33132f9fb81c06a173455ccd9ddda4c748a43')

prepare() {
    rm -rf npm-root npm-cache
    mkdir -p npm-root/usr npm-cache

    npm install --global \
        --prefix "$srcdir/npm-root/usr" \
        --cache "$srcdir/npm-cache" \
        --omit=dev \
        --omit=peer \
        --no-audit \
        --no-fund \
        --legacy-peer-deps \
        "$srcdir/weixinpay-ai-installer-${_npmver}.tgz"
}

package() {
    cp -a "$srcdir/npm-root/usr/." "$pkgdir/usr/"
    install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
    chown -R root:root "$pkgdir"
}
