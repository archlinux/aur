# Maintainer: Ismet Togay <ismet.togay at gmail dot com>
# Contributor: Paramjit Singh <contact at paramjit dot org>
# Contributor: George Rawlinson <george at rawlinson dot net dot nz>
# Contributor: Mattias Andersson <contact at stablemate dot se>

pkgname=playwright
pkgver=1.63.0
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
sha512sums=(
  'fbbce204b89d4b835a34276de7b4940d3fb062699de5f9a241e8d489cfe46fe62c61208fc8e384f6c79bccc8cd990aec9cda4326a778587bd5ffc95f29f50352'
  'ad80ac045fcce478d4721e766dbb5538d1058efe97bbcb26f21ef674d951e5bcc81357ef0bf6f182ca7392349f53e3307843263ccf0a25e6c6ea79f2c68e660a'
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
