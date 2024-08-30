# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contirbutor: Anatoly Bashmakov <anatoly at posteo dot net>

pkgname=ruby-css_parser
_pkgname=${pkgname#ruby-}
pkgver=1.19.0
pkgrel=1
pkgdesc="Ruby CSS parser"
arch=(any)
url="https://github.com/premailer/css_parser"
license=(MIT)
depends=(
  ruby
  ruby-addressable
)
makedepends=(
  git
  ruby-rdoc
)
checkdepends=(
  ruby-maxitest
  ruby-rake
  ruby-webrick
)
options=(!emptydirs)
source=(
  "git+$url.git#tag=v$pkgver"
  "remove-unnecessary-dev-dependencies.patch"
)
sha256sums=(
  '4568dfade0883f602afb21d17a72ff80017018d18bede85036531506825fe849'
  'cb3ba58c225472c0aabd487136ed7430d0af93e92d1ca448318e112562c1e1a0'
)

prepare() {
  cd "$_pkgname"
  rm Gemfile.lock
  patch -Np1 -i "$srcdir/remove-unnecessary-dev-dependencies.patch"
  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed -i -E 's|~>|>=|g' "$_pkgname.gemspec"
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
  GEM_HOME="tmp_install/$(gem env gemdir)" rake test
}

package() {
  cd "$_pkgname"
  cp -a -t "$pkgdir" tmp_install/*
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" MIT-LICENSE
}
