# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Anatoly Bashmakov <anatoly at posteo dot net>

pkgname=ruby-prawn-svg
_pkgname=${pkgname#ruby-}
pkgver=0.34.2
pkgrel=1
pkgdesc="SVG renderer for Prawn Ruby PDF library"
arch=(any)
url="https://github.com/mogest/prawn-svg"
license=(MIT)
depends=(
  ruby
  ruby-css_parser
  ruby-matrix
  ruby-prawn
  ruby-rexml
)
makedepends=(rubygems)
checkdepends=(ruby-rspec)
options=(!emptydirs)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "fix-gem-files.patch"
)
sha256sums=(
  '1324f8a1657ec4964d38364dda7e7eeeb5181dd22d095735928ffc7522f2435c'
  'fd1e6dee91c543bcd3f6f7be7b482fc4503f01533e5042625ae25f2210bf8521'
)

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed -i -E 's|~>|>=|g' "$_pkgname.gemspec"

  patch --forward --strip=1 --input="$srcdir/fix-gem-files.patch"

  # Remove files potentially left over from previous builds
  rm -rf tmp_install
  rm -rf spec/sample_output/*.pdf
  rm -f Gemfile.lock
  rm -f "$_pkgname-$pkgver.gem"
}

build() {
  cd "$_archive"

  local gemdir="$(gem env gemdir)"

  gem build "$_pkgname.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$gemdir" \
    --bindir "tmp_install/usr/bin" \
    "$_pkgname-$pkgver.gem"

  # Remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/$gemdir/cache/" \
    "tmp_install/$gemdir/gems/$_pkgname-$pkgver/vendor/" \
    "tmp_install/$gemdir/doc/$_pkgname-$pkgver/ri/ext/"

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
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
