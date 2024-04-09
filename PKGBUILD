# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Scott Furry <scott.wl.furry@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Sial <sial@cpan.org>
# Contributor: Martin Herndl <martin.herndl@gmail.com>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=guayadeque
pkgver=0.4.7+5+g8f214144
pkgrel=1
pkgdesc="Lightweight music player"
arch=(x86_64)
url="https://www.guayadeque.org/"
license=(GPL3)
depends=(wxsqlite3 wxwidgets-gtk3 webkit2gtk taglib gst-plugins-base gst-plugins-good)
makedepends=(cmake git)
optdepends=('gst-libav: additional codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
source=("git+https://github.com/anonbeat/guayadeque.git#commit=8f21414475504d820d027b1d20268d7b39547188"
        #"${pkgname}-${pkgver}.tar.gz::https://github.com/anonbeat/guayadeque/archive/v${pkgver}.tar.gz"
        "guayadeque-wxWidgets-3.2.patch::https://github.com/sluedecke/guayadeque/commit/a9ecb9d8bf785281ed8ccf292cccf3525ffeb457.patch"
        "guayadeque-taglib2.patch::https://github.com/openmonk/guayadeque/pull/5/commits/20315f28a6003287067e3da893af0499494a061d.patch")
sha256sums=('7677304919cfd87f577e2e54ababc9884ba889e9b675760fa7d843684befe81f'
            '046883477c149fb78668285cbd7293be343adc3010631ff55ab2eae2dc2d12e0'
            '1a888ed69c5426b7f14b31f46607e5a8354dc24598c1b4646a44b14713dafeeb')

prepare() {
  cd guayadeque
  install -d build-guayadeque
  patch -Np1 -i ../guayadeque-wxWidgets-3.2.patch
  patch -Np1 -i ../guayadeque-taglib2.patch
}

pkgver() {
  cd guayadeque
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cmake -B build -S "guayadeque" -Wno-dev \
    -DCMAKE_CXX_STANDARD=11 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -D_GUREVISION_:STRING="${pkgrel}" \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
