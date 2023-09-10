# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Anatoly Bashmakov <anatoly at posteo dot net>

pkgname=ruby-prawn-svg
_name=${pkgname#ruby-}
pkgver=0.32.0
pkgrel=3
pkgdesc="SVG renderer for Prawn Ruby PDF library "
arch=(any)
url="http://github.com/mogest/prawn-svg"
license=(MIT)
depends=(
  ruby
  ruby-css_parser
  ruby-prawn
  ruby-rexml
)
makedepends=(
  rubygems
)
checkdepends=(
  ruby-rspec
)
options=(!emptydirs)
source=(
  "$url/archive/refs/tags/v$pkgver.tar.gz"
  "fix-gem-files.patch"
)
sha256sums=(
  '78b4e19321c405253579c5c4d92cfac975f5530388fdd82a9cee436e9c45ddf4'
  '8738187b6316a7b1d44d0240ffe428850f6a50eccbada64e69db63a4feb61373'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$_name.gemspec"

  patch --strip=1 --input="$srcdir/fix-gem-files.patch"

  # Remove files potentially left over from previous builds
  rm -rf tmp_install
  rm -rf spec/sample_output/*.pdf
  rm -f Gemfile.lock
  rm -f "$_name-$pkgver.gem"
}

build() {
  cd "$_archive"

  local _gemdir
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

  local _gemdir
  _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install/$_gemdir" rspec
}

package() {
  cd "$_archive"

  cp --archive --verbose tmp_install/* "$pkgdir"

  install --verbose -D --mode=0644 LICENSE --target-directory "$pkgdir/usr/share/licenses/$pkgname"
  install --verbose -D --mode=0644 ./*.md --target-directory "$pkgdir/usr/share/doc/$pkgname"
}
