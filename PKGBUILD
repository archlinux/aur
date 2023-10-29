# Maintainer: AtticFinder65536 <atticventilation-aur@protonmail.com>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase="dav1d-git"
pkgname=(dav1d-git dav1d-doc-git)
_gitname=${pkgname%-git}
pkgver=1.3.0.r3.g47107e3
pkgrel=3

pkgdesc="AV1 cross-platform decoder focused on speed and correctness"
url="https://code.videolan.org/videolan/dav1d"
license=(BSD)
arch=(aarch64 armv7h x86_64)

makedepends=(
  doxygen
  git
  graphviz
  libplacebo
  meson
  nasm
  ninja
  sdl2
  vulkan-headers
  xxhash
)

source=("git+$url.git"
	"git+$url-test-data.git")
b2sums=(SKIP
	SKIP)

prepare() {
  cd "$_gitname"
  ln -s "$srcdir/dav1d-test-data" tests/dav1d-test-data
}

pkgver() {
  cd "$_gitname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson setup --prefix=/usr --buildtype=plain \
    -Denable_docs=true \
    -Denable_examples=true \
    "$_gitname" build
  ninja -C build all doc/html
}

check() {
  meson test -C build
}

package_dav1d-git() {
  depends=(glibc)
  provides=(libdav1d.so dav1d)
  conflicts=(dav1d)
  optdepends=(
    "dav1d-doc-git: HTML documentation"
    "libplacebo: for the dav1dplay example"
    "sdl2: for the dav1dplay example"
  )

  meson install -C build --destdir "$pkgdir"

  cd "$_gitname"
  install -Dm 644 README.md CONTRIBUTING.md NEWS -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_dav1d-doc-git() {
  pkgdesc+=" (documentation)"
  provides=(dav1d-doc)
  conflicts=(dav1d-doc)

  install -d "${pkgdir}/usr/share/doc/${pkgbase}"
  cp -r build/doc/html -t "${pkgdir}/usr/share/doc/$pkgbase"

  cd "$_gitname"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/$pkgname"
}
