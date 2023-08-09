# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=ruby-sdoc
_name=${pkgname#ruby-}
pkgver=2.6.1
pkgrel=1
pkgdesc="Standalone sdoc generator"
arch=(any)
url="https://github.com/rails/sdoc"
license=(MIT)

depends=(
  ruby
  ruby-rdoc
  ruby-nokogiri
  ruby-rouge
)
makedepends=(rubygems)
checkdepends=(
  ruby-rake
  git
)
options=(!emptydirs)

source=("$url/archive/v$pkgver/$_name-v$pkgver.tar.gz")
sha256sums=('ef6cc6cee56654295fd4ac6de9c82298168b43a0684deb905df070feee370269')

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$_name.gemspec"

  sed --in-place --regexp-extended 's|git ls-files -- bin/*|find bin/ -type f -not -path "*/\.git/*"|' "$_name.gemspec"
  sed --in-place --regexp-extended 's|git ls-files|find . -type f -not -path "*/\.git/*"|' "$_name.gemspec"
}

build() {
  cd "$_archive"

  local gemdir
  gemdir="$(gem env gemdir)"

  gem build "$_name.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$gemdir" \
    --bindir "tmp_install/usr/bin" \
    "$_name-$pkgver.gem"

  # Remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/$gemdir/cache/" \
    "tmp_install/$gemdir/gems/$_name-$pkgver/vendor/" \
    "tmp_install/$gemdir/doc/$_name-$pkgver/ri/ext/"

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

  local gemdir
  gemdir="$(gem env gemdir)"

  export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
  GEM_HOME="tmp_install/$gemdir" rake test:ruby
}

package() {
  cd "$_archive"

  cp --archive --verbose tmp_install/* "$pkgdir"

  install --verbose -D --mode=0644 LICENSE --target-directory "$pkgdir/usr/share/licenses/$pkgname"
  install --verbose -D --mode=0644 ./*.md --target-directory "$pkgdir/usr/share/doc/$pkgname"
}
