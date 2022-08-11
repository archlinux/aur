# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: gryffyn <aur at evan dot me>

pkgname=zsteg
pkgver=0.2.10
pkgrel=1
pkgdesc="detect stegano-hidden data in PNG & BMP"
arch=(any)
url='https://github.com/zed-0xff/zsteg'
license=(MIT)
depends=('ruby' 'ruby-zpng' 'ruby-iostruct')
source=("${pkgname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fed43cbdeeaae7e25b87e7858dee2321b7a527c7686d062a60e5bb92928ebd3f')

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
