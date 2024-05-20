# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=ruby-cool.io
_pkgname=${pkgname#ruby-}
pkgver=1.8.1
pkgrel=1
pkgdesc="Simple evented I/O for Ruby"
arch=(x86_64)
url="https://github.com/tarcieri/cool.io"
license=(MIT)
depends=(
  glibc
  ruby
)
makedepends=(
  git
  rubygems
)
checkdepends=(ruby-rspec)
options=(!emptydirs)
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('0364aaf3f35cbe09fb18f274d2f42e21c147dbda9990b8716b3c76c01c4a2183')

_archive="$pkgname"

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
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
