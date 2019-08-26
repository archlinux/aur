# Maintainer: maz_1 <ohmygod19993 at gmail dot com>

_pkgname=edb-debugger
pkgname=$_pkgname-git
pkgver=1.0.0.r368.gf1b6efe8
pkgrel=1
pkgdesc="EDB (Evan's Debugger) is a binary mode debugger with the goal of having usability on par with OllyDbg. Git version"
arch=('i686' 'x86_64')
url='http://www.codef00.com/projects#debugger'
license=('GPL2')
depends=('qt5-base' 'capstone' 'qt5-xmlpatterns')
makedepends=('boost>=1.35.0')
source=("git+https://github.com/eteran/edb-debugger.git"
        'edb.desktop')
sha256sums=('SKIP'
            'af1d0eae06544fbca7a9af2e2f55dc472324abf28402652e88d3b62c1882a132')

pkgver() {
	cd $_pkgname

	if git_version=$( git describe --long --tags 2>/dev/null ); then
		IFS='-' read last_tag tag_rev commit <<< "$git_version"
		printf '%s.r%s.%s' "$last_tag" "$tag_rev" "$commit"
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

prepare() {
  cd $_pkgname

  git submodule update --init --recursive
}

build() {
  cd $_pkgname

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $_pkgname

  cd build
  # install to pkg dir
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
  cd ..

  # icons
  install -Dm644 src/images/edb48-logo.png "$pkgdir/usr/share/pixmaps/edb.png"
  install -Dm644 src/images/edb48-logo.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/edb.png"

  # install desktop file
  install -Dm644 "$srcdir/edb.desktop" "$pkgdir/usr/share/applications/edb.desktop"
}
