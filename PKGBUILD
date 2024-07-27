# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: <gaelic>
# Contributor: Anatoly Bashmakov anatoly at posteo dot net

pkgname=asciidoctor-pdf
pkgver=2.3.18
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
  'd2d9140363e8a81c2aa4a06a35d2fb63971773900674d7b1942b4e090bd8194c'
  '40e0aea913c4abc3313b9ae05957e334510899ae64fd882a898144c9ede025d4'
)

prepare() {
  cd $pkgname-$pkgver

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed -i -E 's|~>|>=|g' "$pkgname.gemspec"

  patch --forward --strip=1 --input="$srcdir/remove-failing-tests.patch"
}

build() {
  cd $pkgname-$pkgver

  local gemdir="$(gem env gemdir)"

  gem build "$pkgname.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$gemdir" \
    --bindir "tmp_install/usr/bin" \
    "$pkgname-$pkgver.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/$gemdir/cache/" \
    "tmp_install/$gemdir/gems/$pkgname-$pkgver/vendor/" \
    "tmp_install/$gemdir/doc/$pkgname-$pkgver/ri/ext/"

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
  cd $pkgname-$pkgver

  GEM_HOME="tmp_install/$(gem env gemdir)" rspec
}

package() {
  cd $pkgname-$pkgver

  cp -a -t "$pkgdir" tmp_install/*
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.adoc
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
