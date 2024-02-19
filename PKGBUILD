# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="b0f202a1bdf1cee380f044a4d1a9013f55b81e43"
pkgbase="gtkclipblock"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-gtk2"
  "${pkgbase}-gtk3"
  "${pkgbase}-gtk4"
)
pkgver="0.2.2"
pkgrel="1"
pkgdesc="A hack to prevent GTK programs from interacting with the primary clipboard"
url="https://github.com/notpeelz/gtkclipblock"
arch=("x86_64")
license=("LGPL3")
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
  for version in hybrid 2 3 4; do
    meson setup --prefix=/usr "build-${version}" -Dgtk-version="${version}"
    meson compile -C "build-${version}"
  done
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
  meson install -C build-2 --destdir "${pkgdir}"
}

package_gtkclipblock-gtk3() {
  pkgdesc="${pkgdesc} (GTK 3 only)"
  install="${pkgbase}-gtk3.install"
  conflicts=("${pkgbase}")

  cd "${srcdir}/${pkgbase}"
  meson install -C build-3 --destdir "${pkgdir}"
}

package_gtkclipblock-gtk4() {
  pkgdesc="${pkgdesc} (GTK 4 only)"
  install="${pkgbase}-gtk4.install"
  conflicts=("${pkgbase}")

  cd "${srcdir}/${pkgbase}"
  meson install -C build-4 --destdir "${pkgdir}"
}
