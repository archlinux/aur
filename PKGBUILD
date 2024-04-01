# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=ruby-ttfunk
_name=${pkgname#ruby-}
pkgver=1.8.0
pkgrel=1
pkgdesc="Font Metrics Parser for Prawn"
arch=(any)
url="https://github.com/prawnpdf/ttfunk"
license=(
  GPL-2.0-only
  GPL-3.0-only
  Ruby
)
depends=(
  ruby
  ruby-bigdecimal
)
makedepends=(rubygems)
checkdepends=(ruby-rspec)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7a9ee2f791a2f3214a3bd73cb58843105c7b7d3748a1e1424834e6f438ef3fbc')

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed -i -E 's|~>|>=|g' "$_name.gemspec"
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
}
