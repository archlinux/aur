pkgname=hfsutils
pkgver=3.2.6_p14
pkgrel=1
pkgdesc="HFS Access utils"
arch=('x86_64')
license=('GPL2')
url="https://www.mars.org/home/rob/proj/hfs/"
depends=(glibc)
source=(
	"https://deb.debian.org/debian/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver/_p*}.orig.tar.gz"
	"https://deb.debian.org/debian/pool/main/${pkgname:0:1}/${pkgname}/${pkgname}_${pkgver/_p/-}.debian.tar.xz"
	)
sha256sums=('bc9d22d6d252b920ec9cdf18e00b7655a6189b3f34f42e58d5bb152957289840'
            '855cbdad4fead0e3e37a994d4a2b82f872eda4fe5ed7703d9a3e1de398dbc7ac')

prepare() {
	for file in $(cat ./debian/patches/series); do
		patch -Np1 -d ${pkgname}-${pkgver%_p*} <"debian/patches/$file"
	done
}

build() {
	cd "${pkgname}-${pkgver%_p*}"
	autoreconf -fi
	./configure
	make prefix=/usr
	make -C hfsck prefix=/usr
}

package() {
	cd "${pkgname}-${pkgver%_p*}"
	install -d -m755 "${pkgdir}/usr/bin"
	install -d -m755 "${pkgdir}/usr/share/man/man1"
	DESTDIR="${pkgdir}" make install prefix="${pkgdir}/usr" MANDEST="${pkgdir}/usr/share/man"
}
