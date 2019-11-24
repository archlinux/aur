# Maintainer: flacs <0f1ac5@gmail.com>
# Contributor: maz_1 <ohmygod19993 at gmail dot com>

_pkgname=edb-debugger
pkgname=$_pkgname-git
pkgver=1.1.0.r0.g6d9fb5b8
pkgrel=1
pkgdesc="EDB (Evan's Debugger) is a binary mode debugger with the goal of having usability on par with OllyDbg. Git version"
arch=('x86_64')
url='https://www.codef00.com/projects#debugger'
license=('GPL2')
# add 'gdtoa-desktop-git' dependency if you want 80-bit floats
# to be printed in their shortest possible representation
depends=('capstone' 'desktop-file-utils' 'graphviz' 'hicolor-icon-theme' 'qt5-svg' 'qt5-xmlpatterns')
makedepends=('boost>=1.35.0')
provides=('edb-debugger')
conflicts=('edb-debugger')
source=("git+https://github.com/eteran/edb-debugger.git"
        'edb.desktop')
sha256sums=('SKIP'
            '1d3bc1c8a6c5d08d0b627f03b926e5645e9b4ca0c70282e06585f181251990f3')

pkgver() {
	cd $_pkgname

	git_version=$( git describe --long --tags 2>/dev/null )
	IFS='-' read last_tag tag_rev commit <<< "$git_version"
	printf '%s.r%s.%s' "$last_tag" "$tag_rev" "$commit"
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

  # install to pkg dir
  make -C build DESTDIR="$pkgdir" install

  # icons
  install -Dm644 src/images/edb48-logo.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/edb.png"

  # install desktop file
  install -Dm644 "$srcdir/edb.desktop" "$pkgdir/usr/share/applications/edb.desktop"
}
