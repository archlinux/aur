# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contirbutor: Anatoly Bashmakov <anatoly at posteo dot net>

pkgname=ruby-css_parser
_pkgname=${pkgname#ruby-}
pkgver=1.17.0
pkgrel=1
pkgdesc="Ruby CSS parser"
arch=(any)
url="https://github.com/premailer/css_parser"
license=(MIT)
depends=(
  ruby
  ruby-addressable
)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('4b24427237997117293225f9abaa3374b498f09d6cd51f4fb05993b85e64ff15')

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed -i -E 's|~>|>=|g' "$_pkgname.gemspec"
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

package() {
  cd "$_archive"

  cp -a -t "$pkgdir" tmp_install/*

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" MIT-LICENSE
}
