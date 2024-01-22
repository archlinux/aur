# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=curlyq
pkgver=0.0.11
pkgrel=1
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
  ruby-websocket
)
makedepends=(rubygems)
checkdepends=(
  ruby-parallel_tests
  ruby-rake
  ruby-tty-spinner
  ruby-yard
)
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('43a98b5f924980c01a0dd1666a4cd6132141b92942a5a1f0023ef653719a9e91')

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

check() {
  cd "$_archive"

  _gemdir="$(gem env gemdir)"
  export GEM_HOME="tmp_install/$_gemdir"
  rake test:extract
  rake test:headlinks
  rake test:html
  rake test:images
  rake test:json
  rake test:links
  # Opens browser - doesn't pass in a chroot.
  # rake test:scrape
  # rake test:tags
}

package() {
  cd "$_archive"

  cp --archive tmp_install/* "$pkgdir"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
