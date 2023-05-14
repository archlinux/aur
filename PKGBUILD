# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: schw0reismus <schw0reismus@protonmail.com>

pkgname=foliate-git
pkgver=2.6.4.r103.g1613ac8
pkgrel=2
pkgdesc="Simple and modern GTK eBook reader"
arch=(any)
url="https://johnfactotum.github.io/foliate/"
license=(GPL3)
depends=(gjs gtk4 libadwaita webkitgtk-6.0)
makedepends=(meson ninja git)
optdepends=('hyphen: Auto-hyphenation support'
			'hyphen-en: Hyphenation rules for English; you may choose package for your language'
			'dictd: Offline dictionary support'
			'festival: Text-to-speech support'
			'espeak-ng: Text-to-speech support'
		   )
provides=(foliate)
conflicts=(foliate)
source=("git+https://github.com/johnfactotum/foliate.git#branch=gtk4"
        "git+https://github.com/johnfactotum/foliate-js.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd foliate
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd foliate
  git submodule init
  git config submodule.src/foliate-js.url "${srcdir}/foliate-js"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd foliate
  meson build --prefix=/usr
  ninja -C build
}

package(){
  cd foliate
  DESTDIR="$pkgdir" ninja -C build install
}
