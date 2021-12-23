# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
_pkgname=pixbufloader-qoi
pkgname=$_pkgname-git
pkgver=0.1.0.r5.97377b7
pkgrel=1
pkgdesc='GdkPixbuf loader for the Quite Ok Image format'
arch=('x86_64' 'aarch64')
url='https://git.sr.ht/~fabrixxm/pixbufloader-qoi'
license=('MIT')
depends=('gdk-pixbuf2')
makedepends=('git' 'meson') # 'qoi-headers-git')
provides=('pixbufloader-qoi')
source=("git+https://git.sr.ht/~fabrixxm/pixbufloader-qoi" "https://raw.githubusercontent.com/phoboslab/qoi/master/qoi.h")
sha256sums=(SKIP SKIP)

pkgver() {
  cd "${srcdir}/$_pkgname"
  meson_version=$(cat meson.build | grep "version" | head -n1 | sed "s/[^0-9.]//g")
  printf "%s.r%s.%s" "$meson_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson build "$_pkgname" -Dqoi_include_path=${srcdir}
    ninja -C build
}

check() {
  cd "${srcdir}/build"
  ninja test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

