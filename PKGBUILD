# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=solanum
pkgver=3.0.1.r0.g3f84b1d
pkgrel=3
pkgdesc="A pomodoro timer for the GNOME desktop"
arch=(x86_64)
url="https://gitlab.gnome.org/World/solanum"
license=('GPL3')
depends=('libadwaita' 'gst-plugins-bad-libs')
makedepends=('cargo' 'meson' 'git')
checkdepends=('appstream-glib')
_commit=3f84b1d0c46fe1a3daef2940b1d0747222023984  # tags/v3.0.1
source=("git+$url#commit=$_commit"
		meson-drop-unused-argument.patch
		force-release-build.diff)
sha256sums=('SKIP'
            'e2d30fb22bb8948659d909064df462bd74f44f2eb768757d041618aecb36b245'
            '6abe8cf8013af7ce2edef14dddeb35fe9be8f1e4ad854301e29f4e708f521d42')

prepare() {
  cd $pkgname
  git apply "$srcdir/meson-drop-unused-argument.patch"
  # Make sure cargo runs as release buildtype instead of debug
  git apply "$srcdir/force-release-build.diff"
}

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/^v//;s/-/./g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
