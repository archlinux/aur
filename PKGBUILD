# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=apostrophe
pkgver=2.6.3
pkgrel=6
pkgdesc="A distraction free Markdown editor for GNU/Linux made with GTK+"
arch=('any')
url="https://world.pages.gitlab.gnome.org/apostrophe"
license=('GPL3')
depends=('gspell' 'libhandy' 'otf-fira-mono' 'otf-fira-sans' 'python-cairo'
         'python-chardet' 'python-gobject' 'python-levenshtein' 'python-pyenchant'
         'python-pypandoc' 'python-regex' 'python-setuptools' 'webkit2gtk-4.1')
makedepends=('meson' 'gobject-introspection' 'sassc')
optdepends=('texlive-bin: for the pdftex module'
            'mathjax: for formula preview')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/World/apostrophe/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        'Allow-building-with-webkitgtk-4.1.patch')
sha256sums=('6f73c80146af0820ec705ec8b32ec64f0f323f51de6b6a4cfd4d02f0719876f3'
            'c5c64aa312a17fcf761b0da956147f91532c8c43b33d608ca3acb6f10bd53d12')

prepare() {
  cd "$pkgname-v$pkgver"

  # Bug 1953395 - Apostrophe can't export to HTML
  sed -i 's|/app/share/fonts/FiraSans-Regular.ttf|/usr/share/fonts/OTF/FiraSans-Regular.otf|' \
    data/media/css/web/base.css
  sed -i 's|/app/share/fonts/FiraMono-Regular.ttf|/usr/share/fonts/OTF/FiraMono-Regular.otf|' \
    data/media/css/web/base.css

  # W: hidden-file-or-dir
  rm apostrophe/.pylintrc

  patch -Np1 -i ../Allow-building-with-webkitgtk-4.1.patch
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
