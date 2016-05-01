# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Hubert Jarosz <marqin.pl+aur at gmail dot com> PGP: 0xFFECF63C1AAB83FF

pkgname=renderdoc-git
pkgver=r3059.d98c29b
pkgrel=1
pkgdesc="OpenGL and Vulkan debugging tool"
arch=(i686 x86_64)
url="https://github.com/baldurk/renderdoc"
license=("MIT")
depends=(qt5-x11extras)
source=("git+https://github.com/baldurk/renderdoc"
        "renderdoc.desktop"
        "cflags.patch")
sha256sums=('SKIP'
            'eab4941dc17fbbdcb9e34a698c3b304d212be54956daeb0c3b1cf5b7f2b00984'
            '21ba3fb37c0db0c9772ab3229431fc365289ae5e25eb7cb345632f2e87f74195')
conflicts=('renderdoc')
provides=('renderdoc')

pkgver() {
  cd "${srcdir}"/renderdoc
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"/renderdoc
  patch -sp1 -i ../cflags.patch
}

build() {
  cd "${srcdir}"/renderdoc

  mkdir -p build
  pushd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_QRENDERDOC=OFF \
    ..
  make
  popd

  pushd qrenderdoc
  qmake "CONFIG+=release" "DESTDIR=${srcdir}/renderdoc/build/bin" .
  make
  popd
}

package() {
  cd "${srcdir}"
  install -Dm644 renderdoc.desktop "$pkgdir/usr/share/applications/renderdoc.desktop"

  cd "${srcdir}"/renderdoc/build/bin
  install -Dm644 librenderdoc.so "$pkgdir/usr/lib/librenderdoc.so"
  install -Dm755 qrenderdoc "$pkgdir/usr/bin/qrenderdoc"
  install -Dm755 renderdoccmd "$pkgdir/usr/bin/"

  cd "${srcdir}"/renderdoc
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  cd "${srcdir}"/renderdoc/docs/imgs
  install -Dm644 logo.png "$pkgdir/usr/share/icons/renderdoc.png"
}
