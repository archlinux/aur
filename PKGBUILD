# Maintainer: HanHaocheng <hanhaocheng@archlinux>
#
# HUAWEI serves DevEco Command Line Tools / Device Tool only after login, and
# hands out per-request signed URLs (HW-CC-*). This helper signs in in your
# browser, then mints such a URL so a build can consume it:
#
#   deveco-clt-url --login-cookie   # paste the Cookie header from DevTools once
#   DEVECO_CLT_URL=$(deveco-clt-url) makepkg -si
#
# It never prints cookie values and only caches what you ask it to:
#   ~/.cache/deveco/cookie   (0600, written by --login-cookie)
#   ~/.cache/deveco/clt-url  (0600, the signed URL)
pkgname=deveco-clt-url
pkgver=0.2.1
pkgrel=1
pkgdesc='Mint signed download URLs for HUAWEI DevEco Command Line Tools / Device Tool'
arch=('any')
url='https://developer.huawei.com/consumer/cn/download/command-line-tools-for-hmos'
license=('MIT')
depends=('python' 'sqlite')
optdepends=(
  'openssl: decrypt cookies stored by Chromium-family browsers'
  'libsecret: read the keyring password those browsers use'
  'firefox: read cookies straight from a Firefox profile'
)
source=('deveco-clt-url' 'LICENSE')
sha256sums=('SKIP' 'SKIP')

check() {
  local v
  v=$(sed -n 's/^__version__ = "\(.*\)"$/\1/p' deveco-clt-url | head -1)
  [[ $v == "$pkgver" ]] || {
    error "deveco-clt-url reports version '$v', but pkgver is '$pkgver'"
    return 1
  }
}

package() {
  install -Dm755 deveco-clt-url "$pkgdir/usr/bin/deveco-clt-url"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
