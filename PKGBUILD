# Maintainer: Ismet Togay <ismet.togay@gmail.com>
# Contributor: Paramjit Singh <contact at paramjit dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Mattias Andersson <contact@stablemate.se>

pkgname=playwright
pkgver=1.61.0
pkgver() {
  npm view "$pkgname" version
}
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=("any")
url="https://playwright.dev"
license=("Apache-2.0")
depends=(
  "nodejs"
  "bash"
  "icu"
  "libwebp"
  "pcre"
  "libffi"
  "flite"
)
makedepends=("npm" "jq")
optdepends=(
  "chromium: for chromium support"
  "firefox: for firefox support"
  "webkit2gtk-4.1: system webkit (not used by Playwright's bundled webkit)"
)
conflicts=("python-playwright")
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
# b2sums=SKIP is required because pkgver() makes the tarball URL dynamic;
# the hash cannot be known ahead of time.
b2sums=("SKIP")

package() {
  # Skip the postinstall browser download; users run `playwright install`
  # themselves after install.
  # https://playwright.dev/docs/library#skip-browser-download
  local npm_flags=(
    --no-audit
    --no-fund
    --no-update-notifier
    --omit=dev
  )
  PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1 npm install \
    --global \
    --prefix "$pkgdir/usr" \
    --cache "$srcdir/npm-cache" \
    "${npm_flags[@]}" \
    "$srcdir/$pkgname-$pkgver.tar.gz"

  # Strip references to $pkgdir and $srcdir from package.json files.
  # npm records install paths; this is the upstream-recommended cleanup.
  # https://wiki.archlinux.org/title/Node.js_package_guidelines
  find "$pkgdir" -name package.json -print0 | xargs -0 -r sed -i '/_where/d'

  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  if [[ -f "$pkgjson" ]]; then
    local tmp
    tmp=$(mktemp)
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmp"
    mv "$tmp" "$pkgjson"
    chmod 644 "$pkgjson"
  fi

  find "$pkgdir" -type f -name package.json -print0 | while IFS= read -r -d '' pkgjson; do
    local tmp
    tmp=$(mktemp)
    jq 'del(.man)' "$pkgjson" > "$tmp"
    mv "$tmp" "$pkgjson"
    chmod 644 "$pkgjson"
  done

  # npm gives ownership of ALL FILES to build user.
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
