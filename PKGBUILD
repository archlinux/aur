# # Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=appimage-thumbnailer
pkgver=3.0.0
pkgrel=1
pkgdesc="Generates AppImage thumbnails for Linux desktops"
arch=('x86_64')
url="https://github.com/kem-a/appimage-thumbnailer"
license=('MIT')
depends=(
  '7zip'
  'cairo'
  'glibc'
  'dwarfs'
  'librsvg'
)
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'post-install.patch')
sha256sums=('16e8f1e008117e7bbb834a13ee3f99690b6ce668e3155a4a22d629b6a48e7f60'
            'bad4307f975de5612b6e543a18b822dad1a1a62bbc7537067ecbcaa920735aa7')

prepare() {
  cd "$pkgname-$pkgver"

  # Disable invoking post.install.sh during install
  patch -Np1 -i ../post-install.patch
}

build() {
  arch-meson "$pkgname-$pkgver" build -Dbundle_dwarfs=false
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
