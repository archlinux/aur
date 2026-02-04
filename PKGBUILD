# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
# Contributor: Yigit Sever <yigit at yigitsever dot com>
# Contributor: gryffyn <aur at evan dot me>

pkgname=zsteg
pkgver=0.2.14
pkgrel=1
pkgdesc="detect stegano-hidden data in PNG & BMP"
arch=(any)
url="https://github.com/zed-0xff/zsteg"
license=(MIT)
depends=(
        "ruby"
        "ruby-zpng"
        "ruby-iostruct"
        "ruby-prime"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4f008163d9d3e156c79f77aa8a356c07f33cd7080208458e0c2edbe0df60cf67')

prepare() {
  cd "$pkgname-$pkgver"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$pkgname.gemspec"
}

build() {
  cd "$pkgname-$pkgver"
  gem build "$pkgname.gemspec"

  local _gemdir="$(gem env gemdir)"

  gem install \
    --local \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    "$pkgname-$pkgver.gem"

  # remove unrepreducible files
  rm -frv \
    "$pkgdir/$_gemdir/cache/" \
    "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/vendor/" \
    "$pkgdir/$_gemdir/doc/$pkgname-$pkgver/ri/ext/"

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

package() {
  cd "$pkgname-$pkgver"
  cp --archive --verbose tmp_install/* "$pkgdir"
}
