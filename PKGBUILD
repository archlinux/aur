# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>

pkgname=musepack-tools
pkgver=475
pkgrel=5
pkgdesc="Musepack decoder/encoder"
arch=('i686' 'x86_64')
url="http://www.musepack.net/"
license=('LGPL')
depends=('libcuefile' 'libreplaygain')
makedepends=('cmake')
source=("http://files.musepack.net/source/musepack_src_r$pkgver.tar.gz"
        'math.patch'
        'static.patch')

build() {
  cd "$srcdir/musepack_src_r$pkgver"

  #export LDFLAGS+="-lm"

  patch -Np1 -i "$srcdir/math.patch"
  patch -Np1 -i "$srcdir/static.patch"
  
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_SKIP_RPATH=ON
}

package() {
  cd "$srcdir/musepack_src_r$pkgver"

  make DESTDIR="$pkgdir" install

  for bin in chap cut dec enc gain 2sv8; do
    install -Dm755 mpc$bin/mpc$bin "$pkgdir/usr/bin/mpc$bin"
  done

  find ${pkgdir} -depth -type d -name .svn -exec rm -rf {} \;
}
md5sums=('754d67be67f713e54baf70fcfdb2817e'
         '9de31f07a3492c7b1db1248b055fbdc8'
         '58258c134881322f7abb33060f5525c6')
sha1sums=('bdd4042773eb5c885df70d7a19914fa6e2306391'
          'd6f4315bd1de07db25ad01af2c7337c6e928c2c5'
          '4c38caa371920583518c72b25a3098fef74cc890')
sha256sums=('a4b1742f997f83e1056142d556a8c20845ba764b70365ff9ccf2e3f81c427b2b'
            '11a3c589629f9ab3993ef8eb8fb01df45d06af0d95b365e8d14a7d51adecaece'
            '9df6dbb1e35e0919f0f8e4734556a5855648468638ec8f58cbb0269dd1298309')
sha512sums=('23aa16152b27ba99ff7f4672b8f91562ee9ad829bbe1ee066693eabf69844ee9f8e4b3eebf1bac78e6994119fbb53b034479a1b996576aeecbfba7d797f130b0'
            '6d5cd6b841c0d0de7ae67bf7fb9d6984098f28b7253ab30bdca41f0a6881000dd608e74b5d4a2d2caf062340d84505bf6671fa6c631385e1509bd19a4136fd7f'
            '342ea5db3726611fb99438d9f04b5f3dc4feb3b06c35f301ecba30d1f9382985fb083e57733c7f6de4f45d51ece432e845a8a3fdab1464b6f440de0638b8cfa8')
