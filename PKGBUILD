# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=fluentd
pkgver=1.16.4
_commit=9e4b91bb056fe93332918d1a9949cc5dfbd923fe
pkgrel=1
pkgdesc="Data collector designed to scale and simplify log management"
arch=(any)
url="https://github.com/fluent/fluentd"
license=(Apache-2.0)
depends=(
  ruby
  ruby-console
  ruby-cool.io
  ruby-http_parser.rb
  ruby-msgpack
  ruby-serverengine
  ruby-sigdump
  ruby-strptime
  ruby-tzinfo
  ruby-tzinfo-data
  ruby-webrick
  ruby-yajl-ruby
)
makedepends=(
  git
  rubygems
)
checkdepends=(
  inetutils
  procps-ng
  ruby-async
  ruby-async-http
  ruby-flexmock
  ruby-oj
  ruby-rake
  ruby-rr
  ruby-test-unit-rr
  ruby-timecop
)
optdepends=(
  'jemalloc: for a more efficient malloc implementation'
  'ruby-oj: for a faster json parser'
)
backup=(etc/fluent/fluentd.conf)
options=(!emptydirs)
install="$pkgname.install"
source=(
  "git+$url.git#commit=$_commit"
  "systemd.service"
  "tmpfiles.conf"
  "sysusers.conf"
  "unbundlify-tests.patch"
)
sha256sums=(
  'SKIP'
  'b02013a8e3895369df58557b813d260a11edf245c59afc1747971205f1b9e825'
  'ea811ec16a78cbe1248266bca6589ebaab54f75048288959641b8ef3a8ea7e1b'
  '8eca8af4df0ea2c0b954d8bf72029e7d2034b7e77f9be36d3d261630068f5674'
  '0b9b3cfb302fd849fd414e79bafe99a4009bb4dc8dcbd3a1a4b6ae7c87b653ce'
)

_archive="$pkgname"

pkgver() {
  cd "$_archive"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$pkgname.gemspec"

  patch --forward --strip=1 --input="$srcdir/unbundlify-tests.patch"
}

build() {
  cd "$_archive"

  local gemdir="$(gem env gemdir)"

  gem build "$pkgname.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$gemdir" \
    --bindir "tmp_install/usr/bin" \
    "$pkgname-$pkgver.gem"

  # Remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/$gemdir/cache/" \
    "tmp_install/$gemdir/gems/$pkgname-$pkgver/vendor/" \
    "tmp_install/$gemdir/doc/$pkgname-$pkgver/ri/ext/"

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

  export TZ=UTC
  GEM_HOME="tmp_install/$(gem env gemdir)" rake test -v
}

package() {
  cd "$_archive"

  cp -a tmp_install/* "$pkgdir"

  install -Dm644 fluent.conf "$pkgdir/etc/fluent/fluentd.conf"

  install -Dm644 "$srcdir/systemd.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  cp -a -t "$pkgdir/usr/share/doc/$pkgname" example docs
}
