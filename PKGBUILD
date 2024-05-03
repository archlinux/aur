# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Kimiblock
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=apostrophe-git
pkgver=3.0.r0.gdff1c5e
pkgrel=1
_reveal_ver=5.1.0
pkgdesc="A distraction free Markdown editor for GNU/Linux made with GTK+"
arch=('any')
url="https://world.pages.gitlab.gnome.org/apostrophe"
license=('GPL-3.0-or-later')
depends=(
  'gtksourceview5'
  'libadwaita'
  'libspelling'
  'python-cairo'
  'python-chardet'
  'python-gobject'
  'python-levenshtein'
  'python-pyenchant'
  'python-pypandoc'
  'python-regex'
  'python-setuptools'
  'ttf-fira-mono'
  'ttf-fira-sans'
  'webkitgtk-6.0'
)
makedepends=(
  'git'
  'gobject-introspection'
  'meson'
)
optdepends=(
  'mathjax: for formula preview'
  'texlive-bin: for the pdftex module'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/World/apostrophe.git'
        "https://github.com/hakimel/reveal.js/archive/${_reveal_ver}/reveal.js-${_reveal_ver}.tar.gz"
        'embed-reveal.patch')
sha256sums=('SKIP'
            'ddc83539ec50583eac9a972e88f892971b37c44e70dd0c08be069e2688684b71'
            'd9f140a58a2f65395450a4907263b8c925d6186f90c59e37cc378141be695f5c')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  mkdir -p "${pkgname%-git}/libs/reveal.js"
  cp -r "$srcdir/reveal.js-${_reveal_ver}"/* "${pkgname%-git}/libs/reveal.js"

  # Point Meson to the reveal.js files
  patch meson.build < "$srcdir/embed-reveal.patch"
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

  install -d "$pkgdir/usr/share/${pkgname%-git}/libs/reveal.js"
  cp -r "reveal.js-${_reveal_ver}"/* "$pkgdir/usr/share/${pkgname%-git}/libs/reveal.js"
}
