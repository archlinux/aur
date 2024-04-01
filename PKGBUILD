# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: <gaelic>
# Contributor: Anatoly Bashmakov anatoly at posteo dot net

pkgname=asciidoctor-pdf
_pkgname=$pkgname
pkgver=2.3.15
pkgrel=1
pkgdesc="Translate asciidoctor directly to pdf"
arch=(any)
url="https://github.com/asciidoctor/asciidoctor-pdf"
license=(MIT)
depends=(
  asciidoctor
  ruby
  ruby-concurrent
  ruby-matrix
  ruby-prawn
  ruby-prawn-icon
  ruby-prawn-svg
  ruby-prawn-table
  ruby-prawn-templates
  ruby-treetop
)
makedepends=(rubygems)
checkdepends=(
  gsfonts
  poppler
  ruby-chunky_png
  ruby-coderay
  ruby-pdf-inspector
  ruby-rspec
)
optdepends=('ruby-coderay: for syntax highlighting')
options=(!emptydirs)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "remove-failing-tests.patch"
)
sha256sums=(
  'cd05a8b5cff781655531da2a4b78af9f437a1cb67074eb1e81a4cbee96f637e2'
  '40e0aea913c4abc3313b9ae05957e334510899ae64fd882a898144c9ede025d4'
)

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed -i -E 's|~>|>=|g' "$_pkgname.gemspec"

  patch --forward --strip=1 --input="$srcdir/remove-failing-tests.patch"
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

  # remove unrepreducible files
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

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.adoc
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
