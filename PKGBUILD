# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Anatoly Bashmakov <anatoly at posteo dot net>

pkgname=ruby-prawn
_name=${pkgname#ruby-}
pkgver=2.4.0
pkgrel=3
pkgdesc="A fast and nimble PDF generator for Ruby"
arch=(any)
url="https://github.com/prawnpdf/prawn"
license=(
  GPL-2.0-only
  GPL-3.0-only
  Ruby
)
depends=(
  ruby
  ruby-pdf-core
  ruby-ttfunk
)
makedepends=(rubygems)
checkdepends=(
  ruby-pdf-inspector
  ruby-pdf-reader
  ruby-rspec
)
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ca6a2e7663a15d5f1a336625202fe63241ed9c9eb6538cd9bc5a78e02267f644')

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$_name.gemspec"

  # Don't sign the gem
  sed --in-place '/signing_key/d' "$_name.gemspec"
}

build() {
  cd "$_archive"

  _gemdir="$(gem env gemdir)"

  gem build "$_name.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    "$_name-$pkgver.gem"

  # Remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/$_gemdir/cache/" \
    "tmp_install/$_gemdir/gems/$_name-$pkgver/vendor/" \
    "tmp_install/$_gemdir/doc/$_name-$pkgver/ri/ext/"

  find "tmp_install/$_gemdir/gems/" \
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

  find "tmp_install/$_gemdir/extensions/" \
    -type f \
    \( \
    -iname "mkmf.log" -o \
    -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  cd "$_archive"

  # Remove to avoid depending on
  # https://github.com/prawnpdf/prawn-manual_builder
  rm spec/prawn_manual_spec.rb

  _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/$_gemdir" rspec
}

package() {
  cd "$_archive"

  cp --archive tmp_install/* "$pkgdir"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    COPYING LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}
