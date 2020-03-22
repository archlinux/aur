# Maintainer: b6b <b6bb at pm dot me>

pkgname=l-smash-x264-tmod-git
pkgver=v2.14.5.21.g18a9ed2
pkgrel=1
pkgdesc='MP4 muxer and other tools (git version with support for compiling x264-tmod)'
arch=(x86_64)
url=http://l-smash.github.io/l-smash
license=(custom)
depends=(
  glibc
)
makedepends=(
  git
)
provides=(
  l-smash
  liblsmash.so
)
conflicts=(
  l-smash
)
source=(
  git+https://github.com/l-smash/l-smash.git
  https://gist.githubusercontent.com/b6b/817262540eb2348c35b4c5592317d49f/raw/b4dcb1773713943187b58c2796aa7c3b379b9e8c/x264-tmod.patch
)
sha256sums=(
  SKIP
  2c0d80a45b0d2f7b2628b9bf32fef4261c39a3b46c91769f32771ca0fc2ce410
)

prepare() {
  cd l-smash

  patch -i "${srcdir}"/x264-tmod.patch
}

pkgver() {
  cd l-smash

  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd l-smash

  ./configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static \
    --extra-cflags="$CFLAGS" \
    --extra-ldflags="$LDFLAGS"

  make
}

package() {
  cd l-smash

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}"/usr/share/licenses/l-smash
  install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/l-smash/
}
