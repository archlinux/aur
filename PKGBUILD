# Contributor: Florian Dejonckheere <florian@floriandejonckheere.be>
# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>

pkgname=jsvm-git
_gitname=jsvm
pkgver=da983ce
pkgrel=1
pkgdesc='Reference software for the Scalable Video Coding codec'
arch=('i686' 'x86_64')
url='https://github.com/kierank/${_gitname}'
license=('custom')
depends=('gcc-libs')
makedepends=('git')
provides=('jsvm')
source=("git://github.com/kierank/${_gitname}.git"
	"gcc.patch")
md5sums=('SKIP'
	'2056b96c292aa3e9be0f01c5824b3cba')

pkgver(){
	cd "${srcdir}/${_gitname}"
	git describe --always | sed 's|-|.|g'
}

prepare(){
	cd "${srcdir}/${_gitname}"
	# GCC quirks
	git apply "../gcc.patch"
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
