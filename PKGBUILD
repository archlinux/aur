# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Anatoly Bashmakov <anatoly at posteo dot net>

pkgname=ruby-prawn-svg
_pkgname=${pkgname#ruby-}
pkgver=0.35.1
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
makedepends=(
  git
  rubygems
)
checkdepends=(ruby-rspec)
options=(!emptydirs)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('652e9263991e4a632b0c18c1a475f3191374e0f3b7c5e51cfc1bb305bdc03d41')

prepare() {
  cd "$_pkgname"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed -i -E 's|~>|>=|g' "$_pkgname.gemspec"

  cat /dev/null > Gemfile.lock
  sed -i '/rubocop/d' Gemfile
}

build() {
  cd "$_pkgname"

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
  cd "$_pkgname"

  GEM_HOME="tmp_install/$(gem env gemdir)" rspec
}

package() {
  cd "$_pkgname"

  cp -a -t "$pkgdir" tmp_install/*
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
