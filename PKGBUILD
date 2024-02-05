# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=ruby-cool.io
_pkgname=${pkgname#ruby-}
pkgver=1.8.0
pkgrel=2
pkgdesc="Simple evented I/O for Ruby"
arch=(x86_64)
url="https://github.com/tarcieri/cool.io"
license=(MIT)
depends=(
  glibc
  ruby
)
makedepends=(rubygems)
checkdepends=(ruby-rspec)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e0500529b86e487cb7a682833e46d30dc6e6fbf63e9d5e419aee05bd7cadb9bd')

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$_pkgname.gemspec"

  # We don't build from a git checkout
  sed --in-place --regexp-extended 's|git ls-files|find . -type f -not -path "*/\.git/*"|' "$_pkgname.gemspec"
}

build() {
  cd "$_archive"

  local _gemdir="$(gem env gemdir)"

  gem build "$_pkgname.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    "$_pkgname-$pkgver.gem"

  # Remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/$_gemdir/cache/" \
    "tmp_install/$_gemdir/gems/$_pkgname-$pkgver/vendor/" \
    "tmp_install/$_gemdir/doc/$_pkgname-$pkgver/ri/ext/"

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

  local _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/$_gemdir" rspec
}

package() {
  cd "$_archive"

  cp --archive tmp_install/* "$pkgdir"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}
