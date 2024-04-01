# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Dmitry Kharitonov <arch[at]nano-model[dot]com>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=ruby-pdf-reader
_pkgname=${pkgname#ruby-}
pkgver=2.12.0
pkgrel=2
pkgdesc="Ruby library that implements a PDF parser conforming as much as possible to the PDF specification from Adobe"
arch=(any)
url="https://github.com/yob/pdf-reader"
license=(MIT)
depends=(
  ruby
  ruby-afm
  ruby-ascii85
  ruby-hashery
  ruby-ruby-rc4
  ruby-ttfunk
)
makedepends=(rubygems)
checkdepends=(ruby-rspec)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('afb01b71579a0d36d8e0ddb6324251c4f7598dd2cee9c5909801cd953171b928')

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed -i -E 's|~>|>=|g' "$_pkgname.gemspec"
  sed -i -E 's|"< 13.0"|">= 13.0"|g' "$_pkgname.gemspec"

  # Remove bundler
  sed -i '/require "bundler"/d' spec/spec_helper.rb
  sed -i '/Bundler.setup/d' spec/spec_helper.rb
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
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" MIT-LICENSE
}
