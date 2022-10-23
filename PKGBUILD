# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgbase=libcamera
pkgname=(libcamera libcamera-docs libcamera-tests)
pkgver=0.0.1
pkgrel=1
pkgdesc="An open source camera stack and framework for Linux, Android, and ChromeOS"
url="https://libcamera.org"
arch=(x86_64)
license=(LGPL2.1)
depends=(libyaml lttng-ust libunwind systemd libdrm libjpeg sdl2 
         gst-plugins-base-libs gtest)
makedepends=(git meson python-jinja python-ply python-yaml python-sphinx
             doxygen graphviz texlive-core qt5-tools)
options=(debug)
_commit=a83aed77df1258e469c0eb42d9cb4f1938db53f2  # tags/v0.0.1^0
source=("git+https://git.libcamera.org/libcamera/libcamera.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --tags | sed 's/[^-]*-g/r&/;s/^v//;s/-/+/g'
}

build() {
  arch-meson $pkgbase build -D test=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_libcamera() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$srcdir/$pkgbase/LICENSES"/*.txt -t "$pkgdir/usr/share/licenses/$pkgbase/"

  # Docs
  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc

  # Tests
  mkdir -p tests/usr
  mv {"$pkgdir",tests}/usr/bin
}

package_libcamera-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
  rm -rf \
    "$pkgdir/usr/share/doc/libcamera-0.0.1/html/.doctrees" \
    "$pkgdir/usr/share/doc/libcamera-0.0.1/html/.buildinfo"
}

package_libcamera-tests() {
  pkgdesc="Test applications for libcamera"
  depends=(libcamera qt5-base)

  mv tests/* "$pkgdir"
}
