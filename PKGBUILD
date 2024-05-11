# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase="dav1d-git"
_gitname=${pkgbase%-git}
pkgname=(
  dav1d-git
  dav1d-doc-git
)
pkgver=1.4.1.r29.g37d5243
pkgrel=1

pkgdesc="AV1 cross-platform decoder focused on speed and correctness"
url="https://code.videolan.org/videolan/dav1d"
license=(BSD-2-Clause)
arch=(x86_64)

makedepends=(
  doxygen
  git
  graphviz
  meson
  nasm
  ninja
  vulkan-headers
  xxhash
)

source=(
  "git+$url.git"
  "git+$url-test-data.git"
)
b2sums=(
  SKIP
  SKIP
)

prepare() {
  cd "$_gitname"
  ln -fs "$srcdir/dav1d-test-data" tests/dav1d-test-data
}

pkgver() {
  cd "$_gitname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson setup --prefix=/usr --buildtype=plain \
    -Dtestdata_tests=true \
    -Denable_docs=true \
    "$_gitname" build
  ninja -C build all doc/html
}

check() {
  meson test -C build --print-errorlogs
}

package_dav1d-git() {
  depends=(glibc)
  provides=(libdav1d.so dav1d)
  conflicts=(dav1d)
  optdepends=("dav1d-doc-git: HTML documentation")

  meson install -C build --destdir "$pkgdir"

  cd "$_gitname"
  install -Dm 644 README.md CONTRIBUTING.md NEWS -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_dav1d-doc-git() {
  arch=(any)
  provides=(dav1d-doc)
  conflicts=(dav1d-doc)
  pkgdesc+=" (documentation)"

  install -d "${pkgdir}/usr/share/doc/${pkgbase}"
  cp -r build/doc/html -t "${pkgdir}/usr/share/doc/$pkgbase"

  cd "$_gitname"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/$pkgname"
}
