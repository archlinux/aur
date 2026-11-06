# Maintainer: Ismet Togay <ismet.togay at gmail dot com>
# Contributor: Paramjit Singh <contact at paramjit dot org>
# Contributor: George Rawlinson <george at rawlinson dot net dot nz>
# Contributor: Mattias Andersson <contact at stablemate dot se>

pkgname=playwright
pkgver=1.65.0
pkgrel=1
pkgdesc='Node.js library to automate Chromium, Firefox and WebKit with a single API'
arch=('any')
url='https://playwright.dev'
license=('Apache-2.0')
depends=('nodejs>=20' 'bash')
makedepends=('npm')
optdepends=(
  'flite-voices-extra: extra Flite voice libraries for bundled WebKit'
  'icu74: ICU 74 ABI required by the downloaded WebKit payload; system ICU 78 is not sufficient'
  'libxml2-legacy: libxml2.so.2 ABI required by the downloaded WebKit payload'
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
sha512sums=('17700c59c478e2a301b7892afba29bea65fb6e3197b2192d28538f50b77bade103e992567af8db351ab2b0feeaf8001313d91d3c464189b7b1d4162cbe956878'
            'bcd48a807e98aad37b71d4ff2f7df8ce8d1af98c24ae989ccab1c995658f226fd0f8d9f64962278a5d35a13d266eef7a5381a0a11b426100fd0b3250823bbe94')

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

  [[ "$("$checkdir"/prefix/bin/playwright --version)" == "Version $pkgver" ]]
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
