# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=apostrophe
pkgver=2.5
pkgrel=3
pkgdesc="A distraction free Markdown editor for GNU/Linux made with GTK+"
arch=('any')
url="https://world.pages.gitlab.gnome.org/apostrophe"
license=('GPL3')
depends=('gspell' 'libhandy' 'otf-fira-mono' 'otf-fira-sans' 'python-cairo'
         'python-gobject' 'python-levenshtein' 'python-pyenchant' 'python-pypandoc'
         'python-regex' 'python-setuptools' 'webkit2gtk')
makedepends=('meson' 'gobject-introspection' 'sassc')
optdepends=('texlive-latexextra: for the pdftex module'
            'mathjax: for formula preview')
checkdepends=('appstream-glib')
changelog="$pkgname-NEWS"
source=("https://gitlab.gnome.org/World/apostrophe/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        "$pkgname.patch")
sha256sums=('366b239ea7bb720c11fc7344827b6739e4983132c9932aa4705a3b88533d75e4'
            '6471631544fd666074ade2aec0e15c48a09735f8305ce64e8ba5091b28c20039')

prepare() {
  cd "$pkgname-v$pkgver"
  patch -Np1 -i "$srcdir/$pkgname.patch"

  # Bug 1953395 - Apostrophe can't export to HTML
  sed -i 's|/app/share/fonts/FiraSans-Regular.ttf|/usr/share/fonts/mozilla-fira/FiraSans-Regular.otf|' \
    data/media/css/web/base.css
  sed -i 's|/app/share/fonts/FiraMono-Regular.ttf|/usr/share/fonts/mozilla-fira/FiraMono-Regular.otf|' \
    data/media/css/web/base.css

  # W: hidden-file-or-dir
  rm apostrophe/.pylintrc
}

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
