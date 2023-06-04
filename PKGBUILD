_pkgbase=relcs-git
pkgname=relcs-git
pkgver=1.0_b1
pkgrel=1
pkgdesc="Grand Theft Auto: LCS reverse engineered"
arch=(x86_64 aarch64)
url=https://github.com/halpz/re3/tree/miami
license=(custom:none)
depends=(librw-git openal mpg123)
makedepends=(cmake)
provides=("$_pkgbase")
conflicts=("$_pkgbase")
install=relcs.install
source=(
	git+https://github.com/halpz/re3.git#branch=lcs
	git+https://github.com/aap/librw.git
    git+https://github.com/xiph/ogg.git
    git+https://github.com/xiph/opus.git
    git+https://github.com/xiph/opusfile.git	
	reLCS.desktop)
md5sums=(
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP)
pkgver(){
	cd re3
	echo 1.0_r`git rev-list --count HEAD`.`git rev-parse --short HEAD`
}
prepare() {

  cd "$srcdir/re3"
  git submodule init
  for submod in librw ogg opus opusfile
  do
    git config "submodule.vendor/$submod.url" "../$submod"
  done
  git -c protocol.file.allow=always submodule update

}
build(){
  cd "$srcdir/re3"
  premake5 --with-librw gmake2
  ./printHash.sh src/extras/GitSHA1.cpp
  make -C build config=release_linux-amd64-librw_gl3_glfw-oal
}
package(){
cd "$srcdir/re3"
  install -D -m755 -t "$pkgdir/usr/bin" \
    "bin/linux-amd64-librw_gl3_glfw-oal/Release/reLCS"
      install -D -m644 -t "$pkgdir/usr/share/applications" ../reLCS.desktop
  install -D -m644 res/images/logo.svg "$pkgdir/usr/share/pixmaps/reLCS.svg"
  mkdir -p "$pkgdir/usr/share/games/relcs"
  cp -a gamefiles "$pkgdir/usr/share/games/relcs/"
  chmod og=rX -R "$pkgdir/usr/share/games/relcs"
}
