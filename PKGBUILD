# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
pkgname=marker-git
pkgver=2023.05.02.r11.gae508ff7
pkgrel=1
pkgdesc="Markdown editor for linux made with Gtk+-3.0"
arch=('x86_64')
url="https://fabiocolacio.github.io/Marker"
license=('GPL-3.0-or-later')
depends=('gtksourceview3' 'gtkspell3' 'webkit2gtk-4.1')
makedepends=('git' 'itstool' 'meson')
checkdepends=('appstream-glib')
optdepends=('pandoc: export to HTML, PDF, RTF, OTF, DOCX, LaTeX'
            'yelp: in-app help')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('git+https://github.com/fabiocolacio/Marker.git'
        'git+https://github.com/Mandarancio/scidown.git'
        'git+https://github.com/Mandarancio/charter.git'
        'git+https://github.com/codeplea/tinyexpr.git'
        'add_gi18n_h.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'a549a622d3d58936643f4932235711c03a38550d09266e1863a936e41618b661')

pkgver() {
  cd Marker
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd Marker
  git submodule init
  git config submodule.src/scidown.url "$srcdir/scidown"
  git -c protocol.file.allow=always submodule update

  # Update version
  sed -i "s/2020.04.04/${pkgver%%.r*}/g" meson.build

  patch -Np1 -i ../add_gi18n_h.patch

  cd src/scidown
  git submodule init
  git config submodule.src/charter.url "$srcdir/charter"
  git -c protocol.file.allow=always submodule update

  cd src/charter
  git submodule init
  git config submodule.src/tinyexpr.url "$srcdir/tinyexpr"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson Marker build
  meson compile -C build
}

check() {
  cd Marker
  appstream-util validate-relax --nonet data/*.appdata.xml
  desktop-file-validate data/*.desktop
}

package() {
  meson install -C build --destdir "$pkgdir"
}
