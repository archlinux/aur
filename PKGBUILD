# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=ruby-flexmock
_pkgname=${pkgname#ruby-}
pkgver=3.0.1
pkgrel=1
pkgdesc="Flexible mocking for Ruby testing"
arch=(any)
url="https://github.com/doudou/flexmock"
license=(MIT)
depends=(ruby)
makedepends=(
  git
  rubygems
)
checkdepends=(
  ruby-bundler
  ruby-minitest
  ruby-rake
  ruby-simplecov
)
options=(!emptydirs)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('eba38fa86a4d5948939922135ee1ebb5788f72ad81066f8a6ec7a3eda47021b0')

prepare() {
  cd "$_pkgname"
  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$_pkgname.gemspec"
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
  GEM_HOME="tmp_install/$(gem env gemdir)" rake test -v
}

package() {
  cd "$_pkgname"
  cp -a tmp_install/* "$pkgdir"
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
