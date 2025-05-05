_pkgbase=re3
pkgname=revc-git
pkgver=1.0.r870.ga16fcd8
pkgrel=1
pkgdesc="Grand Theft Auto: Vice City reverse engineered"
arch=(x86_64 aarch64)
url=https://github.com/halpz/re3/tree/miami
license=(custom:none)
depends=(glibc gcc-libs librw-git openal mpg123 glfw)
makedepends=(git cmake)
install=revc.install
source=(
	"re3.bundle::https://archive.org/download/github.com-GTAmodding-re3_-_2021-09-06_14-11-00/GTAmodding-re3_-_2021-09-06_14-11-00.bundle"
	reVC.desktop)
sha256sums=('035cb5f59811ae086510f02bd3817eaf43933c9723e52dba60807f48c4e9d9c3'
            '27bc5264b5f90555bda380142a813b5af8c141e17127bd7cf363bfd186ed4a1c')
pkgver(){
	cd "$srcdir/$_pkgbase"
	git tag --force 1.0 e604be65d9b7845ee7ca975545fc9277c662bc11
	git describe --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare(){
	rm -fr "$srcdir/$_pkgbase"
	git init "$srcdir/$_pkgbase"
	cd "$srcdir/$_pkgbase"
	git pull --rebase "$srcdir/re3.bundle" refs/remotes/origin/miami

	sed -i 's/glfwGetX11Display/glfwGetX11DisplayglfwGetX11Display/' src/CMakeLists.txt
}
build(){
	cd "$srcdir/$_pkgbase"
	cmake -DREVC_VENDORED_LIBRW= .
	make
}
package(){
	cd re3
	install src/reVC -Dt "$pkgdir"/usr/bin
	install -D {res/images/logo,"$pkgdir"/usr/share/pixmaps/reVC}.svg
	install ../reVC.desktop -Dt "$pkgdir"/usr/share/applications
	cp -r gamefiles "$pkgdir"/usr/share/reVC
}
