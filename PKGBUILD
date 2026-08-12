# Maintainer: Ismet Togay <ismet.togay at gmail dot com>
# Contributor: Paramjit Singh <contact at paramjit dot org>
# Contributor: George Rawlinson <george at rawlinson dot net dot nz>
# Contributor: Mattias Andersson <contact at stablemate dot se>

pkgname=playwright
pkgver=1.62.1
pkgrel=2
pkgdesc='Node.js library to automate Chromium, Firefox and WebKit with a single API'
arch=('any')
url='https://playwright.dev'
license=('Apache-2.0')
depends=('nodejs>=20' 'bash')
makedepends=('npm')
optdepends=(
  'flite-voices-extra: extra Flite voice libraries for bundled WebKit'
  'icu74: ICU 74 ABI required by the downloaded WebKit payload; system ICU 78 is not sufficient'
)
conflicts=('python-playwright')
install="$pkgname.install"
source=(
  "$pkgname-$pkgver.tgz::https://registry.npmjs.org/playwright/-/playwright-$pkgver.tgz"
  "playwright-core-$pkgver.tgz::https://registry.npmjs.org/playwright-core/-/playwright-core-$pkgver.tgz"
)
noextract=(
  "$pkgname-$pkgver.tgz"
  "playwright-core-$pkgver.tgz"
)
sha512sums=(
  'd0cf8bdcb003f3f9e6e79e0b3a56bd032c748f4b66159d0505ca10ec5d55b951e933f5e9882f11703cc1401f16e7e840f0bdb64c7c442f3785fb659c533bdc2e'
  'c0f612c0404963d187ada2125eacaab71d276b42e93b75c45fb8cd0e19ed6dec7bb73512ee42e766c3a516bb85241e078bfae10cc8d71aa1dec0367af2761957'
)

check() {
  local checkdir="$srcdir/check"
  rm -rf "$checkdir"
  mkdir -p "$checkdir"

  PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 npm install \
    --global \
    --prefix "$checkdir/prefix" \
    --cache "$checkdir/npm-cache" \
    --offline \
    --ignore-scripts \
    --no-audit \
    --no-fund \
    "$srcdir/$pkgname-$pkgver.tgz" \
    "$srcdir/playwright-core-$pkgver.tgz"

  [[ "$($checkdir/prefix/bin/playwright --version)" == "Version $pkgver" ]]
  [[ -f "$checkdir/prefix/lib/node_modules/$pkgname/package.json" ]]
  [[ -f "$checkdir/prefix/lib/node_modules/playwright-core/package.json" ]]
  ! find "$checkdir/prefix" -type d -name 'ms-playwright' -print -quit | grep -q .
  ! find "$checkdir/prefix" -type f -exec file {} + | grep -q 'ELF '
}

package() {
  PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 npm install \
    --global \
    --prefix "$pkgdir/usr" \
    --cache "$srcdir/npm-cache" \
    --offline \
    --ignore-scripts \
    --no-audit \
    --no-fund \
    "$srcdir/$pkgname-$pkgver.tgz" \
    "$srcdir/playwright-core-$pkgver.tgz"

  find "$pkgdir" -name package.json -print0 |
    xargs -0 -r sed -i '/_where/d'

  tar -xOf "$srcdir/$pkgname-$pkgver.tgz" package/LICENSE > "$srcdir/playwright-upstream-LICENSE"
  install -Dm644 "$srcdir/playwright-upstream-LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chown -R root:root "$pkgdir"
}
