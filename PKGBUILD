# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=apostrophe-git
pkgver=2.5.r31.ga7459de
pkgrel=2
pkgdesc="A distraction free Markdown editor for GNU/Linux made with GTK+"
arch=('any')
url="https://world.pages.gitlab.gnome.org/apostrophe"
license=('GPL3')
depends=('gspell' 'libhandy' 'otf-fira-mono' 'python-cairo' 'python-gobject'
         'python-levenshtein' 'python-pyenchant' 'python-pypandoc' 'python-regex'
         'webkit2gtk')
makedepends=('git' 'meson' 'gobject-introspection' 'sassc')
checkdepends=('appstream-glib')
optdepends=('texlive-latexextra: for the pdftex module'
            'mathjax: for formula preview')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/World/apostrophe.git'
        "${pkgname%-git}.patch")
sha256sums=('SKIP'
            '6471631544fd666074ade2aec0e15c48a09735f8305ce64e8ba5091b28c20039')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch -Np1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
  arch-meson -Dprofile=development "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
