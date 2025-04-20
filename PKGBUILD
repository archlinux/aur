# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contrubutor: farwayer <farwayer@gmail.com>

pkgname=ruby-dotenv
_pkgname=${pkgname#ruby-}
pkgver=3.1.8
pkgrel=1
pkgdesc="Loads environment variables from .env"
arch=(any)
url="https://github.com/bkeepers/dotenv"
license=(MIT)
depends=(ruby)
makedepends=(
  git
  rubygems
)
checkdepends=(ruby-rspec)
options=(!emptydirs)
install=ruby-dotenv.install
source=("git+$url.git#tag=v$pkgver")
sha256sums=('edf25e082ec35726df6d768a544972b27b9a459cbf57cd234b24e8334ec81bd5')

_archive="$_pkgname"

prepare() {
  cd "$_archive"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$_pkgname.gemspec"

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

  cp -a tmp_install/* "$pkgdir"
  mv "$pkgdir/usr/bin/dotenv" "$pkgdir/usr/bin/ruby-dotenv"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
