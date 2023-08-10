# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contrubutor: farwayer <farwayer@gmail.com>

pkgname=ruby-dotenv
_name=${pkgname#ruby-}
pkgver=2.8.1
pkgrel=4
pkgdesc="Loads environment variables from .env"
arch=(any)
url="https://github.com/bkeepers/dotenv"
license=(MIT)
depends=(ruby)
makedepends=(rubygems)
checkdepends=(ruby-rspec)
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('03f1e21bd6d681501dd719b4f4ce2663049ac27531c0bee69e740e2e9b6526c0')
install=ruby-dotenv.install

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$_name.gemspec"

  # we don't build from a git checkout
  sed --in-place --regexp-extended \
    's|git ls-files README.md LICENSE lib bin|find README.md LICENSE lib bin -type f -not -path "*/\.git/*"|' \
    "$_name.gemspec"
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

  GEM_HOME="tmp_install/$_gemdir" rspec --exclude-pattern spec/dotenv/rails_spec.rb
}

package() {
  cd "$_archive"

  cp --archive --verbose tmp_install/* "$pkgdir"
  mv "$pkgdir/usr/bin/dotenv" "$pkgdir/usr/bin/ruby-dotenv"

  install --verbose -D --mode=0644 LICENSE --target-directory "$pkgdir/usr/share/licenses/$pkgname"
  install --verbose -D --mode=0644 ./*.md --target-directory "$pkgdir/usr/share/doc/$pkgname"
}
