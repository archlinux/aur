# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname="gtk-nocsd"
pkgname="${_pkgname}-git"
pkgver=r102.a898873
pkgrel=1
pkgdesc="A small LD_PRELOAD library to disable CSD in GTK3, LibHandy, GTK4 and LibAdwaita apps"
arch=("x86_64")
url="https://codeberg.org/MorsMortium/${_pkgname}"
license=("GPL-3.0-or-later")
provides=("${_pkgname}" "gtk3-nocsd" "gtk3-nocsd-git" "gtk4-nocsd" "gtk4-nocsd-git")
conflicts=("${_pkgname}" "gtk3-nocsd" "gtk3-nocsd-git" "gtk4-nocsd" "gtk4-nocsd-git")
replaces=("gtk3-nocsd" "gtk3-nocsd-git" "gtk4-nocsd" "gtk4-nocsd-git")
makedepends=("git" "libadwaita")
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  gcc -fPIC -shared ./Source/GTK-NoCSD.c -o libgtk-nocsd.so \
    $(pkg-config --cflags libadwaita-1) \
    $(pkg-config --cflags --libs gobject-2.0 gio-2.0)
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 755 libgtk-nocsd.so "${pkgdir}/usr/lib/libgtk-nocsd.so"
  mkdir -p "${pkgdir}/opt/gtk-nocsd/"
  ln "${pkgdir}/usr/lib/libgtk-nocsd.so" "${pkgdir}/opt/gtk-nocsd/libgtk-nocsd.so"
}
