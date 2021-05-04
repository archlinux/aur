# Maintainer Crewmate <sus@morshu.xyz>
_pkgname=materia-theme-transparent
pkgname=materia-transparent-gtk-theme-git
pkgver=r1648.85bdc295
pkgrel=1
epoch=1
pkgdesc="A Transparent Material Design theme for GNOME/GTK+ based desktop environments"
url="https://github.com/ckissane/materia-theme-transparent"
arch=(any)
license=(GPLV2)
depends=(gnome-themes-extra)
makedepends=(meson npm git gtk3 gtk4 gnome-shell)
optdepends=('gtk-engine-murrine: for gtk2 theme')
provides=(materia-theme)
conflicts=(materia-theme)
replaces=(materia-theme)
source=(
  "${_pkgname}::git+https://github.com/ckissane/materia-theme-transparent"
  remove-npm-install-from-meson-build.patch
)
sha256sums=(
  "SKIP"
  "c74a6f934c58b50256fc09014ebd683b483800ddf8aade5e01f6f79d2832cc41"
)

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  patch -Np1 < ${srcdir}/remove-npm-install-from-meson-build.patch
  npm install --cache ${srcdir}/npm-cache
}

build() {
  arch-meson "$srcdir/${_pkgname}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 $srcdir/$_pkgname/COPYING -t "$pkgdir/usr/share/licenses/${pkgname}"
}
