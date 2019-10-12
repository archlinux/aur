# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=pdftk-git
pkgver=3.0.0.r62.a1b9815
pkgrel=1
pkgdesc='Command-line tool for working with PDFs'
arch=('any')
url='https://gitlab.com/pdftk-java/pdftk'
license=('GPL')
depends=('bcprov' 'java-commons-lang' 'java-runtime-headless')
makedepends=('git' 'ant')
checkdepends=('java-hamcrest' 'junit' 'junit-system-rules' 'poppler')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git" 'pdftk.sh')
sha512sums=('SKIP'
            '439c397472012d71c8e782a75819a7a950474c387b7050bbd5aa2f849d1dbe29423accf3f8e17d18436ba32eb4f76072df5b4f85caebd853df1e75c131631988')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	mkdir lib
	ln -s /usr/share/java/{bcprov,commons-lang/commons-lang,hamcrest-core,junit,junit-system-rules/system-rules}.jar lib
	# No need for code coverage reports during tests
	sed -ri '/<\/?jacoco:coverage>/d' build.xml
}

build() {
	cd "${pkgname%-git}"
	ant jar
}

check() {
	cd "${pkgname%-git}"
	ant test-run
}

package() {
	cd "${pkgname%-git}"
	install -Dm644 build/jar/pdftk.jar -t "$pkgdir/usr/share/java/$pkgname"
	install -Dm644 pdftk.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm755 "$srcdir/pdftk.sh" "$pkgdir/usr/bin/pdftk"
}
