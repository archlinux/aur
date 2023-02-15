# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>

pkgname=zsteg
pkgver=0.2.12
pkgrel=1
pkgdesc="detect stegano-hidden data in PNG & BMP"
arch=(any)
url="https://github.com/zed-0xff/zsteg"
license=(MIT)
depends=(
        "ruby"
        "ruby-zpng"
        "ruby-iostruct"
)
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("d5bc52b3dcfb750ef4d429c888d7f95452eac25f523063341561d4343b48995f")

build() {
  cd "$pkgname-$pkgver"
  gem build "$pkgname.gemspec"
}

package() {
  local _gemdir="$(gem env gemdir)"

  cd "$pkgname-$pkgver"
  gem install \
    --local \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$pkgname-$pkgver.gem"

  # remove unrepreducible files
  rm -frv \
    "$pkgdir/$_gemdir/cache/" \
    "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/vendor/" \
    "$pkgdir/$_gemdir/doc/$pkgname-$pkgver/ri/ext/"

  find "$pkgdir/$_gemdir/gems/" \
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

  find "$pkgdir/$_gemdir/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}
