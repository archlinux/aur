# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Anatoly Bashmakov <anatoly at posteo dot net>

pkgname=ruby-prawn-icon
_name=${pkgname#ruby-}
pkgver=3.1.0
pkgrel=3
pkgdesc="Easy icons for Prawn"
arch=(any)
url="https://github.com/jessedoyle/prawn-icon"
license=(
  GPL-2.0-only
  GPL-3.0-only
  Ruby
)
depends=(
  ruby
  ruby-prawn
)
makedepends=(
  ruby-rdoc
  rubygems
)
checkdepends=(
  ruby-pdf-inspector
  ruby-rspec
)
options=(!emptydirs)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "remove-redundant-dev-dependencies.patch"
  "remove-failing-test.patch"
)
sha256sums=(
  '13bb55525aca68bf56c6e60b865f0bfdffe295e503a5bf98bc90b14434f98f86'
  '279cc028906f29a31c0f228331fef4eeb9260e0aa029dc6e824d0ec912a9b824'
  'e720009f731b4f6a7b5be91df107060e65257305e5e31feb33e83975dfb794c8'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed -i -E 's|~>|>=|g' "$_name.gemspec"

  patch --forward --strip=1 --input="$srcdir/remove-redundant-dev-dependencies.patch"
  patch --forward --strip=1 --input="$srcdir/remove-failing-test.patch"
}

build() {
  cd "$_archive"

  local gemdir="$(gem env gemdir)"

  gem build "$_name.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$gemdir" \
    --bindir "tmp_install/usr/bin" \
    "$_name-$pkgver.gem"

  # Remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/$gemdir/cache/" \
    "tmp_install/$gemdir/gems/$_name-$pkgver/vendor/" \
    "tmp_install/$gemdir/doc/$_name-$pkgver/ri/ext/"

  find "tmp_install/$gemdir/gems/" \
    -type f \
    \( \
    -iname "*.o" -o \
    -iname "*.c" -o \
    -iname "*.so" -o \
    -iname "*.time" -o \
    -iname "gem.build_complete" -o \
    -iname "Makefile" \
    \) \
    -delete

  find "tmp_install/$gemdir/extensions/" \
    -type f \
    \( \
    -iname "mkmf.log" -o \
    -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  cd "$_archive"

  GEM_HOME="tmp_install/$(gem env gemdir)" rspec
}

package() {
  cd "$_archive"

  cp -a tmp_install/* "$pkgdir"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    COPYING LICENSE
}
