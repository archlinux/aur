# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=pdftk-java
pkgver=3.0.7
pkgrel=1
pkgdesc='Command-line tool for working with PDFs'
arch=('any')
url='https://gitlab.com/pdftk-java/pdftk'
license=('GPL')
depends=('bcprov' 'java-commons-lang' 'java-runtime-headless')
makedepends=('ant')
checkdepends=('java-hamcrest' 'junit' 'junit-system-rules' 'poppler')
provides=('pdftk')
conflicts=('pdftk')
source=("$url/-/archive/v$pkgver/pdftk-v$pkgver.tar.bz2" "pdftk.sh")
sha512sums=('22e144a186b77817ff909543f068031023d7ebcc762443fc5ab4a31f008b9d62dd5662b7d122657e22e95292ea4b6443c4539ff279024d024aac92d7582b13f4'
            '439c397472012d71c8e782a75819a7a950474c387b7050bbd5aa2f849d1dbe29423accf3f8e17d18436ba32eb4f76072df5b4f85caebd853df1e75c131631988')

prepare() {
	cd "pdftk-v$pkgver"
	mkdir lib
	ln -s /usr/share/java/{bcprov,commons-lang/commons-lang,hamcrest-core,junit,system-rules}.jar lib
	# No need for code coverage reports during tests
	sed -ri '/<\/?jacoco:coverage>/d' build.xml
}

build() {
	cd "pdftk-v$pkgver"
	ant jar
}

check() {
	cd "pdftk-v$pkgver"
	ant test-run
}

package() {
	cd "pdftk-v$pkgver"
	install -Dm644 build/jar/pdftk.jar -t "$pkgdir/usr/share/java/pdftk"
	install -Dm644 pdftk.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm755 "$srcdir/pdftk.sh" "$pkgdir/usr/bin/pdftk"
}
