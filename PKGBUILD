# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Maxim Mikityanskiy <maxtram95@gmail.com>

pkgname=mindforger
pkgver=2.0.0
pkgrel=2
pkgdesc="Thinking notebook and Markdown IDE. Search, browse, view and edit your Markdown files. Get as much as possible from knowledge in your remarks"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://github.com/dvorka/mindforger"
license=(GPL-2.0-or-later)
depends=(qt5-base qt5-webkit zlib hunspell glibc gcc-libs
         libicuuc.so)
makedepends=(git cmake)
source=("git+https://github.com/dvorka/mindforger.git#tag=${pkgver}"
        "git+https://github.com/dvorka/mindforger-repository.git"
        "mindforger-cmark::git+https://github.com/dvorka/cmark.git")
sha256sums=('68ef84c0bee6e7c1640e183cf2dafd993a3f29f29dd05d68763415e5735a979a'
            'SKIP'
            'SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git config 'submodule.doc.url' "${srcdir}/mindforger-repository"
  git config 'submodule.deps/cmark-gfm.url' "${srcdir}/mindforger-cmark"
  git -c protocol.file.allow=always submodule update
}

build() {
  mkdir -p "$srcdir/$pkgname"/deps/cmark-gfm/build
  cd "$srcdir/$pkgname"/deps/cmark-gfm/build
  cmake -DCMARK_TESTS=OFF -DCMARK_SHARED=OFF -Wno-dev -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..
  cmake --build .

  cd "$srcdir/$pkgname"
  qmake -r CONFIG+=mfnoccache mindforger.pro
  make
}

package() {
  cd "$srcdir/$pkgname"
  make INSTALL_ROOT="$pkgdir/usr" install
}
