# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Hubert Jarosz <marqin.pl+aur at gmail dot com> PGP: 0xFFECF63C1AAB83FF

pkgname=renderdoc-git
pkgver=r2777.9ee529e
pkgrel=2
pkgdesc="OpenGL and Vulkan debugging tool"
arch=(i686 x86_64)
url="https://github.com/baldurk/renderdoc"
license=("MIT")
depends=(qt5-x11extras)
source=("git+https://github.com/baldurk/renderdoc"
        "renderdoc.desktop"
        "patch1.diff")
sha256sums=('SKIP'
            'eab4941dc17fbbdcb9e34a698c3b304d212be54956daeb0c3b1cf5b7f2b00984'
            'f166de9d2bb46b8d64e73e7e8afe026525ecfb58d47fc5dacf0b0fff7a57adf2')
conflicts=('renderdoc')
provides=('renderdoc')

pkgver() {
  cd "${srcdir}"/renderdoc
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"/renderdoc
  patch -p1 < ../patch1.diff
}

build() {
  cd "${srcdir}"/renderdoc
  make
}

package() {
  cd "${srcdir}"
  install -Dm644 renderdoc.desktop "$pkgdir/usr/share/applications/renderdoc.desktop"

  cd "${srcdir}"/renderdoc/bin
  install -Dm644 librenderdoc.so "$pkgdir/usr/lib/librenderdoc.so"
  install -Dm755 qrenderdoc "$pkgdir/usr/bin/qrenderdoc"
  install -Dm755 renderdoccmd "$pkgdir/usr/bin/"

  cd "${srcdir}"/renderdoc
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  cd "${srcdir}"/renderdoc/docs/imgs
  install -Dm644 logo.png "$pkgdir/usr/share/icons/renderdoc.png"
}
