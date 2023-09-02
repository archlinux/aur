# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contirbutor: Anatoly Bashmakov <anatoly at posteo dot net>

pkgname=ruby-css_parser
_name=${pkgname#ruby-}
pkgver=1.16.0
pkgrel=1
pkgdesc="Ruby CSS parser"
arch=(any)
url="https://github.com/premailer/css_parser"
license=(MIT)
depends=(
  ruby
  ruby-addressable
)
makedepends=(ruby-rdoc)
checkdepends=(
  ruby-maxitest
  ruby-rake
  ruby-webrick
)
options=(!emptydirs)

source=(
  "$url/archive/v$pkgver/$_name-v$pkgver.tar.gz"
  "remove-unnecessary-dev-dependencies.patch"
)
sha256sums=(
  '90faa9d5c6575a84ec12902c782944d5bd190ed12f3ccd677bcaf39b664e41f7'
  '815847fe7d39e97d7012a2f9d5027c3718144c3f4c2bf429c5b300b2311f6832'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$_name.gemspec"

  # Remove lockfile & unnecessary dev dependencies
  rm Gemfile.lock
  patch --strip=1 --input="$srcdir/remove-unnecessary-dev-dependencies.patch"
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

  local _gemdir
  _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install/$_gemdir" rake test
}

package() {
  cd "$_archive"

  cp --archive --verbose tmp_install/* "$pkgdir"

  install --verbose -D --mode=0644 MIT-LICENSE --target-directory "$pkgdir/usr/share/licenses/$pkgname"
  install --verbose -D --mode=0644 ./*.md --target-directory "$pkgdir/usr/share/doc/$pkgname"
}
