# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=geckodriver-git
pkgver=138.0.3.r5880.g917c73cfe1a5
pkgrel=1
pkgdesc="WebDriver for Firefox"
arch=('i686' 'x86_64')
url="https://github.com/mozilla-firefox/firefox/tree/main/testing/geckodriver"
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("geckodriver=$pkgver")
conflicts=('geckodriver')
source=("git+https://github.com/mozilla-firefox/firefox.git")
sha256sums=('SKIP')


prepare() {
  cd "firefox/testing/geckodriver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "firefox/testing/geckodriver"

  _tag=$(git tag -l --sort -creatordate | grep -E '^FIREFOX_?[0-9_]+_RELEASE$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^FIREFOX_//;s/_RELEASE//;s/_/./g'
}

check() {
  cd "firefox/testing/geckodriver"

  #cargo test \
  #  --frozen
}

package() {
  cd "firefox/testing/geckodriver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/firefox/testing/geckodriver"
}
