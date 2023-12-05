# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: <gaelic>
# Contributor: Anatoly Bashmakov anatoly at posteo dot net

pkgname=asciidoctor-pdf
_name=$pkgname
pkgver=2.3.10
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
optdepends=(
  'ruby-coderay: for syntax highlighting'
)
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('984372dbea851efb74beb7647e166ea12ac5bb9f70ec99bd82f156a585d52329')

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$_name.gemspec"
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

  # remove unrepreducible files
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

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.adoc
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
