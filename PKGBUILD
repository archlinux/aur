# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Anatoly Bashmakov <anatoly at posteo dot net>

pkgname=ruby-pdf-core
_pkgname=${pkgname#ruby-}
pkgver=0.10.0
pkgrel=1
pkgdesc="Implements low level PDF features for Prawn (experimental)"
arch=(any)
url="https://github.com/prawnpdf/pdf-core"
license=(
  GPL-2.0-only
  GPL-3.0-only
  Ruby
)
depends=(ruby)
makedepends=(rubygems)
checkdepends=(
  ruby-pdf-inspector
  ruby-pdf-reader
  ruby-rspec
)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('301532cbdc05142dad047c58c88a1684f39d37bd36e87890709a1739ab778192')

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$_pkgname.gemspec"
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

  cp -a tmp_install/* "$pkgdir"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}
