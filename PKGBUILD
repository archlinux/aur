# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contrubutor: farwayer <farwayer@gmail.com>

pkgname=ruby-dotenv
_pkgname=${pkgname#ruby-}
pkgver=3.0.0
pkgrel=1
pkgdesc="Loads environment variables from .env"
arch=(any)
url="https://github.com/bkeepers/dotenv"
license=(MIT)
depends=(ruby)
makedepends=(rubygems)
checkdepends=(ruby-rspec)
options=(!emptydirs)
install=ruby-dotenv.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('16c6b9be6eef01d236e6fb2a2c5404b690046355be9270afb5c8166b543c6cbe')

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$_pkgname.gemspec"

  # we don't build from a git checkout
  sed --in-place --regexp-extended \
    's|git ls-files README.md LICENSE lib bin|find README.md LICENSE lib bin -type f -not -path "*/\.git/*"|' \
    "$_pkgname.gemspec"

  # Add missing require to tests
  echo "require 'pathname'" >> spec/spec_helper.rb
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

  # remove unrepreducible files
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

  # Remove tests that depend on rails
  local excluded_tests=(
    dotenv/rails_spec.rb
    dotenv/log_subscriber_spec.rb
  )
  local excluded_tests_pattern="spec/{${excluded_tests[0]}$(printf ',%s' "${excluded_tests[@]:1}")}"

  GEM_HOME="tmp_install/$(gem env gemdir)" rspec \
    --exclude-pattern "$excluded_tests_pattern"
}

package() {
  cd "$_archive"

  cp --archive tmp_install/* "$pkgdir"
  mv "$pkgdir/usr/bin/dotenv" "$pkgdir/usr/bin/ruby-dotenv"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
