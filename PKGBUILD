pkgname=linvst-stable
pkgver=2.8
pkgrel=1
provides=('linvst')
conflicts=('linvst')
pkgdesc="Bridge that allows Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
url="https://github.com/osxmidi/LinVst"
arch=('x86_64')
license=('GPL')
depends=('wine' 'gtk3')
makedepends=()
install="linvst-stable.install"

_pkgname=LinVst

source=("https://github.com/osxmidi/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('fc60414454ba2af7aafeece1639fb35fce6bf27a4df7a432b2912ecfbc9405b5')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make -f Makefile-embed-6432 DESTDIR="${pkgdir}" all
	cd "convert"
	bash makegtk3
	bash makegtk3tree
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make -f Makefile-embed-6432 DESTDIR="${pkgdir}" VST_DIR="${pkgdir}/usr/share/linvst" install
	install -m 755 "convert/linvstconvert" "${pkgdir}/usr/bin/"
	install -m 755 "convert/linvstconverttree" "${pkgdir}/usr/bin/"
	install -m 755 "convert/convert-cli" "${pkgdir}/usr/bin/linvstconvert-cli"
	install -m 755 "convert/Python-script/linvstconvert-py" "${pkgdir}/usr/bin/"
	cd "${pkgdir}/usr/bin/"
	ln -s "../share/linvst/linvst.so"
}
