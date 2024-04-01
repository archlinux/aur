# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Anatoly Bashmakov <anatoly at posteo dot net>

pkgname=ruby-prawn-table
_name=${pkgname#ruby-}
pkgver=0.2.2
pkgrel=8
pkgdesc="Provides support for tables in Prawn"
arch=(any)
url="https://github.com/prawnpdf/prawn-table"
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
  ruby-yard
  rubygems
)
checkdepends=(
  ruby-mocha
  ruby-pdf-inspector
  ruby-rspec
  ruby-simplecov
)
options=(!emptydirs)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "remove-failing-tests.patch"
)
sha256sums=(
  '25f0bcdc6ffbb0ff3746f96d02e083cbbaf1c71cd928176a23b2bd5e77ccc377'
  '68873f4ea2242f16d1bc25c026c83739935133b907f272f9e3ddc4632037d492'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed -i -E 's|~>|>=|g' "$_name.gemspec"

  # sed --in-place '/rspec/d' "$_name.gemspec"
  sed -i '/prawn-manual_builder/d' "$_name.gemspec"
  sed -i 's/2.14.1/>= 2.15.1/' "$_name.gemspec"

  # Remove 5 failint tests - 4 of them due to depending on image not packaged
  # with Prawn, 1 due incompatible with recent rspec.
  patch --forward --strip=1 --input="$srcdir/remove-failing-tests.patch"
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

  cp -a -t "$pkgdir" tmp_install/*

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    COPYING LICENSE
}
