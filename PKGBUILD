# Contributor: Florian Dejonckheere <florian@floriandejonckheere.be>
# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>

pkgname=jsvm-git
_gitname=jsvm
pkgver=3d01c8b
pkgrel=2
pkgdesc='Reference software for the Scalable Video Coding codec'
arch=('i686' 'x86_64')
url='http://www.hhi.fraunhofer.de/de/kompetenzfelder/image-processing/research-groups/image-video-coding/svc-extension-of-h264avc/jsvm-reference-software.html'
license=('custom')
depends=('gcc-libs')
makedepends=('git')
provides=('jsvm')
source=("git://github.com/floriandejonckheere/${_gitname}.git"
	"git://github.com/floriandejonckheere/${_gitname}-patch.git")
md5sums=('SKIP'
	'SKIP')

pkgver(){
	cd "${srcdir}/${_gitname}"
	git describe --always | sed 's|-|.|g'
}

prepare(){
	cd "${srcdir}/${_gitname}"
	# GCC quirks
	git apply "../${_gitname}-patch/jsvm.patch"
}

build(){
	cd "${srcdir}/${_gitname}/JSVM/H264Extension/build/linux"
	make
}

package(){
	cd "${srcdir}/${_gitname}"
	install -Dm644 copyright.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	cd "${srcdir}/${_gitname}/bin"
	for FILE in $(ls); do
		install -Dm755 "${FILE}" "${pkgdir}/usr/bin/${FILE}"
	done
}
