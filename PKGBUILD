# Maintainer: maz_1 <ohmygod19993 at gmail dot com>

_pkgname=edb-debugger
pkgname=$_pkgname-git
pkgver=r906.863ea6a
pkgrel=1
pkgdesc="EDB (Evan's Debugger) is a binary mode debugger with the goal of having usability on par with OllyDbg. Git version"
arch=('i686' 'x86_64')
url='http://www.codef00.com/projects#debugger'
license=('GPL2')
depends=('qt5-base' 'capstone' 'qt5-xmlpatterns')
makedepends=('boost>=1.35.0')
install=edb.install
source=("git+https://github.com/eteran/edb-debugger.git"
        "git+https://github.com/eteran/qhexview.git"
        'edb.desktop')
md5sums=('SKIP'
        'SKIP'
         '8844cd95efef848f8f4a444259491961')

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
  cd $_pkgname/src
  git submodule init qhexview
  git config submodule.qhexview.url ../../qhexview
  git submodule update qhexview
}
build() {
  cd $_pkgname
  sed -i "s:/usr/local:/usr:g" common.pri
  qmake-qt5 -makefile DEFAULT_PLUGIN_PATH="/usr/lib/edb/"
  make
}

package() {
  cd $_pkgname

  # install to pkg dir
  make INSTALL_ROOT="$pkgdir" install

  # correct /usr/lib64 -> /usr/lib on x86_64
  [ "$CARCH" = "x86_64" ] && (mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib")

  # icons
  install -Dm644 src/images/edb48-logo.png "$pkgdir/usr/share/pixmaps/edb.png"
  install -Dm644 src/images/edb48-logo.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/edb.png"

  # install desktop file
  cd ..
  install -Dm644 edb.desktop "$pkgdir/usr/share/applications/edb.desktop"
}
