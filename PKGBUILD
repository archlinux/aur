# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=curlyq
pkgver=0.0.16
pkgrel=3
pkgdesc="A command line helper for curl and web scraping"
arch=(any)
url="https://github.com/ttscoff/curlyq"
license=(MIT)
depends=(
  ruby
  ruby-gli
  ruby-nokogiri
  ruby-selenium-webdriver
  ruby-tty-which
  ruby-erb # should be ruby-gli dependency
)
makedepends=(rubygems)
#checkdepends=(
#  ruby-parallel_tests
#  ruby-rake
#  ruby-tty-spinner
#  ruby-yard
#  ruby-test-unit
#)
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4c1aec307b5ca35feb5152b46f5166c77933e63976b0334bad73f375e37a0a1c')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$pkgname.gemspec"

  rm -rf tmp_install

  # We don't build from a git checkout
  sed --in-place --regexp-extended 's|git ls-files|find . -type f -not -path "*/\.git/*"|' "$pkgname.gemspec"

  # Relax version constraint for nokogiri, v1.13.9 is the version available in
  # the official repositories. Tests pass anyway.
  sed --in-place "s/'nokogiri','>= 1.16.0/'nokogiri','>= 1.13.0/" "$pkgname.gemspec"

  # Remove strange test environment setup - seems to be built in a way to only
  # work on the upstream developer's marchive.
  sed --in-place '/Dir.chdir(File.expand_path/d' test/helpers/curlyq-helpers.rb
  sed --in-place "s/BUNDLE, 'exec',//" test/helpers/curlyq-helpers.rb
}

build() {
  cd "$_archive"

  _gemdir="$(gem env gemdir)"

  gem build "$pkgname.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    "$pkgname-$pkgver.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/$_gemdir/cache/" \
    "tmp_install/$_gemdir/gems/$pkgname-$pkgver/vendor/" \
    "tmp_install/$_gemdir/doc/$pkgname-$pkgver/ri/ext/"

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
# https://github.com/ttscoff/curlyq/issues/2
#check() {
#  cd "$_archive"
#
#  _gemdir="$(gem env gemdir)"
#  export GEM_HOME="tmp_install/$_gemdir"
#  rake test:extract
#  rake test:headlinks
#  rake test:html
#  rake test:images
#  rake test:json
#  rake test:links
#  # Opens browser - doesn't pass in a chroot.
#  # rake test:scrape
#  # rake test:tags
#}

package() {
  cd "$_archive"

  cp --archive tmp_install/* "$pkgdir"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
