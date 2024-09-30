# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
_pkgname=pixbufloader-qoi
pkgname=$_pkgname-git
pkgver=0.2.0.r12.c1ecb4f
pkgrel=1
pkgdesc='GdkPixbuf loader for the Quite Ok Image format'
arch=('x86_64' 'aarch64')
url='https://git.sr.ht/~fabrixxm/pixbufloader-qoi'
license=('MIT')
depends=('gdk-pixbuf2' 'shared-mime-info>=2.3')
makedepends=('git' 'meson' 'qoi-headers-git')
provides=('pixbufloader-qoi')
source=("git+https://git.sr.ht/~fabrixxm/pixbufloader-qoi")
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/$_pkgname"
  meson_version=$(cat meson.build | grep "version" | head -n1 | sed "s/[^0-9.]//g")
  printf "%s.r%s.%s" "$meson_version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson build "$_pkgname"
    ninja -C build
}

check() {
  cd "${srcdir}/build"
  ninja test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

