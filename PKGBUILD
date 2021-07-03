# Maintainer: Mario Finelli <mario at finel dot li>

_gemname=http
pkgname=ruby-$_gemname
pkgver=5.0.1
pkgrel=1
pkgdesc="An easy-to-use client library for making requests from Ruby"
arch=('any')
url="https://github.com/httprb/http"
license=('MIT')
depends=('ruby' 'ruby-addressable' 'ruby-http-cookie' 'ruby-http-form_data' 'ruby-http_parser.rb')
makedepends=('ruby-rdoc')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('19bd27e0c0f8f839fde0f1c47c2f17b511154df77471041e71703ff6718b8543e2b725a866be39f4a51aa23e58c86016919b8d07c6f5f473b384bbb1cfeb42de')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -rf cache

  # delete unnecessary folders & files
  cd "gems/$_gemname-$pkgver"
  rm -vrf .github .rubocop
  find . -type f -name ".*" -delete

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -v -t "$pkgdir/usr/share/doc/$pkgname" \
    CHANGES.md CONTRIBUTING.md README.md

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -v LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
}
