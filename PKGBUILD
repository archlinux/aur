# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Kimiblock
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=apostrophe-git
pkgver=2.6.3.r202.gcc6bef4
pkgrel=3
pkgdesc="A distraction free Markdown editor for GNU/Linux made with GTK+"
arch=('any')
url="https://world.pages.gitlab.gnome.org/apostrophe"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'python-cairo'
  'python-chardet'
  'python-gobject'
  'python-levenshtein'
  'python-pyenchant'
  'python-pypandoc'
  'python-regex'
  'python-setuptools'
  'webkitgtk-6.0'
)
makedepends=(
  'git'
  'meson'
  'gobject-introspection'
)
checkdepends=('appstream-glib')
optdepends=(
  'mathjax: for formula preview'
  'texlive-bin: for the pdftex module'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/World/apostrophe.git'
        '0001-Use-system-font.patch'
        '2-rm-reveal-check.patch')
sha256sums=('SKIP'
            'e909c05f259a874afd5e414fd13b0f162972e59c61c23e6d619e502254fcd4fe'
            'a3e2eea5fca084f53fd6d0f9e61ace8e14b4c83d9c2f1d5ea74c8589c8c10b8f')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Bug 1953395 - Apostrophe can't export to HTML
  sed -i 's|/app/share/fonts/FiraSans-Regular.ttf|/usr/share/fonts/OTF/FiraSans-Regular.otf|' \
    data/media/css/web/base.css
  sed -i 's|/app/share/fonts/FiraMono-Regular.ttf|/usr/share/fonts/OTF/FiraMono-Regular.otf|' \
    data/media/css/web/base.css

  # W: hidden-file-or-dir
  rm apostrophe/.pylintrc

  # Use system monospace & sans font instead of hard dependency on Fira Mono / Fira Sans
  patch -Np1 -i "$srcdir/0001-Use-system-font.patch"

  ## WIP

  # Why are we pretending we don't need reveal.js?
  # It's only for HTML 5 Slideshow and would be an optional dependency
  # The nodejs-reveal.js AUR package does not cover this dependency as 
  # upstream is looking for it in "prefix/share/apostrophe/libs/reveal.js, fully unzipped"
  patch "$srcdir/apostrophe/meson.build" < "$srcdir/2-rm-reveal-check.patch"
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
