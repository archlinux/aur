# Maintainer: Valentin Obst <aur@vpao.de>
pkgname=coderec
pkgver=0.1.2
pkgrel=1
pkgdesc="Identifies machine code in binary files."
arch=('x86_64')
url="https://github.com/vobst/coderec"
license=('Apache-2.0')
depends=('brotli'
         'expat'
         'fontconfig'
         'freetype2'
         'gcc-libs'
         'glib2'
         'glibc'
         'graphite'
         'harfbuzz'
         'libpng'
         'pcre2'
         'zlib')
makedepends=('cargo'
             'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vobst/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver-corpus.tar.gz::https://valentinobst.de/a13f15d91f0f8846d748e42e7a881f783eb8f922861a63d9dfb74824d21337039dd8216f0373c3e5820c5e32de8f0a1880ec55456ff0da39f17d32f567d62b84/cpu_rec_corpus.tar.gz")
sha512sums=('7482922b8f92d6a7e4cdc9adca67bb09820d1aa702f5628c463334b8d3036da11250527a15c570ec8817520401240c5277cfaf88abe4886924dcc15b55a7ef15'
            'a13f15d91f0f8846d748e42e7a881f783eb8f922861a63d9dfb74824d21337039dd8216f0373c3e5820c5e32de8f0a1880ec55456ff0da39f17d32f567d62b84')
noextract=("$pkgname-$pkgver-corpus.tar.gz")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  rm -rf cpu_rec_corpus
  tar xf "$srcdir/$pkgname-$pkgver-corpus.tar.gz"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
