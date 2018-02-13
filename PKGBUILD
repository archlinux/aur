# Maintainer: Raphael Scholer <rascholer@gmail.com>
# Contributors: Dan Serban, Dany Martineau, RTFreedman, Harvey, Jordi De Groof,
#               qqqqqqqqq9

pkgname=mp3diags
pkgver=1.2.03
pkgrel=4
pkgdesc="Fix and identify issues with MP3 files"
url="http://mp3diags.sourceforge.net/"
license=("GPL")
arch=("i686" "x86_64")
depends=("boost-libs" "qt4")
makedepends=("boost")
optdepends=('mp3gain: MP3 normalization support')
source=("http://downloads.sourceforge.net/project/mp3diags/mp3diags-src/MP3Diags-${pkgver}.tar.gz")
sha1sums=('53a699b809781819988a17b7558b9c0aab08d76a')

build() {
	cd "MP3Diags-${pkgver}"
	./AdjustMt.sh
	qmake-qt4
	make
	lrelease-qt4 src/translations/mp3diags_*.ts
}

package() {
	cd "MP3Diags-${pkgver}"

	install -m755 -d "${pkgdir}/usr/bin"
	install -m755 -d "${pkgdir}/usr/share/applications"

	cd "bin"
	install -m755 -t "${pkgdir}/usr/bin" "MP3Diags"

	cd "../desktop"
	install -m644 -t "${pkgdir}/usr/share/applications" "MP3Diags.desktop"

	for i in "16" "22" "24" "32" "36" "40" "48"; do
		install -m755 -d "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps"
		install -p -m644 "MP3Diags${i}.png" \
		                 "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/MP3Diags.png"
	done

	cd "${srcdir}/MP3Diags-${pkgver}/src/translations"
	install -m755 -d "${pkgdir}/usr/share/mp3diags/translations"
	install -m644 -t "${pkgdir}/usr/share/mp3diags/translations" *.qm
}
