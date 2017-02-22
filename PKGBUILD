# Maintainer: Thibaud Kehler <thibaud.kehler at gmx dot net>
pkgname='timelineproject-hg'
pkgver=1.13.0.r5056+
pkgrel=1
pkgdesc="Aims to create a free, cross-platform application for displaying and navigating events on a timeline."
arch=('any')
url="http://thetimelineproj.sourceforge.net/"
license=('GPL3')
depends=('python2-humblewx' 'wxpython')
makedepends=('mercurial')
source=("${pkgname%-hg}::hg+http://hg.code.sf.net/p/thetimelineproj/main")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-hg}/"
	printf "%s.r%s" "$(hg tags -q | sed -n '2p')" "$(hg identify -n)" 
}

prepare() {
	 cd "$srcdir/${pkgname%-hg}/source"
	 sed -i 's/#!\/usr\/bin\/env\ python/#!\/usr\/bin\/env\ python2/' timeline.py # fix arch python2 compatibility
}

package() {
	 mkdir -p "${pkgdir}/opt/"
	 rsync -a --exclude=".*" "$srcdir/${pkgname%-hg}/" "${pkgdir}/opt/${pkgname%-hg}/"
	 chmod -R 755 "${pkgdir}/opt/${pkgname%-hg}/"
	 mkdir -p "${pkgdir}/usr/bin/"
	 ln -s "/opt/${pkgname%-hg}/source/timeline.py" "${pkgdir}/usr/bin/${pkgname%-hg}"
}
