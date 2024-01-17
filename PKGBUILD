# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=ruby-pdf-inspector
_name=${pkgname#ruby-}
pkgver=1.3.0
_commit_hash=1f6e59cb7d56b956783d2cbb0b67db8cd2a4d006
pkgrel=2
pkgdesc="Collection of PDF::Reader based analysis classes for inspecting PDF output"
arch=(any)
url="https://github.com/prawnpdf/pdf-inspector"
license=(
  GPL-2.0-only
  GPL-3.0-only
  Ruby
)
depends=(
  ruby
  ruby-pdf-reader
)
makedepends=(rubygems)
checkdepends=(ruby-rspec)
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit_hash.tar.gz")
sha256sums=('bb86a6a6ee801ca41b5b44ca2a0cba3fac9a5d89e84772e36ca691c220cfba43')

_archive="$_name-$_commit_hash"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$_name.gemspec"

  # Upstream looks for signing key in a wierd place: .ssh/gem-private_key.pem
  sed --in-place '/spec.signing_key/d' "$_name.gemspec"
}

build() {
  cd "$_archive"

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

  # Remove unrepreducible files
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

  _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/$_gemdir" rspec
}

package() {
  cd "$_archive"

  cp --archive --verbose tmp_install/* "$pkgdir"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}
