# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="4fc87e209c4b44baf638d7b8dd7c287e7b42358f"
pkgbase="gtkclipblock"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-gtk2"
  "${pkgbase}-gtk3"
  "${pkgbase}-gtk4"
)
pkgver="0.2.4"
pkgrel="1"
pkgdesc="A hack to prevent GTK programs from interacting with the primary clipboard"
url="https://github.com/notpeelz/gtkclipblock"
arch=("x86_64")
license=("LGPL-3.0-or-later")
depends=("glibc")
makedepends=(
  "git"
  "meson"
  "cmake"
  "gtk2"
  "gtk3"
  "gtk4"
)
source=(
  "${pkgbase}::git+https://github.com/notpeelz/gtkclipblock.git#commit=${_commit}"
)
sha256sums=(
  "SKIP"
)

prepare() {
  cd "${srcdir}/${pkgbase}"
  git submodule init
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgbase}"

  arch-meson -Dgtk2=enabled -Dgtk3=enabled -Dgtk4=enabled build-hybrid
  meson compile -C build-hybrid

  arch-meson -Dgtk2=enabled -Dgtk3=disabled -Dgtk4=disabled -Dsoname-suffix=-gtk2 build-gtk2
  meson compile -C build-gtk2

  arch-meson -Dgtk2=disabled -Dgtk3=enabled -Dgtk4=disabled -Dsoname-suffix=-gtk3 build-gtk3
  meson compile -C build-gtk3

  arch-meson -Dgtk2=disabled -Dgtk3=disabled -Dgtk4=enabled -Dsoname-suffix=-gtk4 build-gtk4
  meson compile -C build-gtk4
}

package_gtkclipblock() {
  pkgdesc="${pkgdesc} (GTK 2/3/4)"
  install="${pkgbase}.install"
  provides=(
    "${pkgbase}-gtk2"
    "${pkgbase}-gtk3"
    "${pkgbase}-gtk4"
  )
  conflicts=(
    "${pkgbase}-gtk2"
    "${pkgbase}-gtk3"
    "${pkgbase}-gtk4"
  )

  cd "${srcdir}/${pkgbase}"
  meson install -C build-hybrid --destdir "${pkgdir}"
}

package_gtkclipblock-gtk2() {
  pkgdesc="${pkgdesc} (GTK 2 only)"
  install="${pkgbase}-gtk2.install"
  conflicts=("${pkgbase}")

  cd "${srcdir}/${pkgbase}"
  meson install -C build-gtk2 --destdir "${pkgdir}"
}

package_gtkclipblock-gtk3() {
  pkgdesc="${pkgdesc} (GTK 3 only)"
  install="${pkgbase}-gtk3.install"
  conflicts=("${pkgbase}")

  cd "${srcdir}/${pkgbase}"
  meson install -C build-gtk3 --destdir "${pkgdir}"
}

package_gtkclipblock-gtk4() {
  pkgdesc="${pkgdesc} (GTK 4 only)"
  install="${pkgbase}-gtk4.install"
  conflicts=("${pkgbase}")

  cd "${srcdir}/${pkgbase}"
  meson install -C build-gtk4 --destdir "${pkgdir}"
}
