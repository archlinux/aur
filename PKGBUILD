# Maintainer: Ulrik Boll Djurtoft <ullebe1@gmail.com>
pkgname=appeditor-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r48.ea4a7bd
pkgrel=1
pkgdesc="AppEditor allows you to edit application entries in the application menu."
arch=('i686' 'x86_64')
url="https://github.com/donadigo/appeditor"
license=('GPL')
depends=(
				 'vala'
				 'gtk3'
				 'granite'
				 'meson'
				)
makedepends=('ninja' 'git')
source=("git://github.com/donadigo/appeditor.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson build
	cd build
	meson configure -Dprefix=/usr
	ninja
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	DESTDIR="${pkgdir}/" ninja install
	cd ..
	install -D -m644 "data/com.github.donadigo.appeditor.desktop.in" "${pkgdir}/usr/share/applications/com.github.donadigo.appeditor.desktop.in"
}
