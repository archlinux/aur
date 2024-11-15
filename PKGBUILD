# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
# Contributor: Yigit Sever <yigit at yigitsever dot com>
# Contributor: gryffyn <aur at evan dot me>

pkgname=zsteg
pkgver=0.2.13
pkgrel=2
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
sha256sums=("7113fee4bba57df3eb9874ba2b4dbc00826b0bec72e77ac2af24fbdc356e3469")

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
