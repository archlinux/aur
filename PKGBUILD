# Maintainer: Carl Smedstad <carsme at archlinux dot org>
# Contributor: Maxime Gauduin <alucryd@gmail@com>
# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>
# Contributor: Guilherme Nogueira <guilherme@nirev.org>

pkgname=ruby-treetop
_pkgname=${pkgname#ruby-}
pkgver=1.6.12
_commit=b6a60e16e80f288dd25d45e372e5249f190f4561
pkgrel=3
pkgdesc="A Ruby-based parsing DSL based on parsing expression grammars"
arch=(any)
url="https://github.com/cjheath/treetop"
license=(MIT)
depends=(
  ruby
  ruby-polyglot
)
makedepends=(
  git
  rubygems
)
checkdepends=(
  ruby-activesupport
  ruby-rr
  ruby-rspec
)
options=(!emptydirs)
source=("git+$url.git#commit=$_commit")
sha256sums=('60b44029ded39276145a755981cf9a83a8c09708547390640eb4884d5ebe5685')

_archive="$_pkgname"

pkgver() {
  cd "$_archive"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed -i -E 's|~>|>=|g' "$_pkgname.gemspec"
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

  cp -a -t "$pkgdir" tmp_install/*

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
