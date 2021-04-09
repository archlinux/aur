# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=pdftk-git
pkgver=3.0.0.r182.19b7ac4
pkgrel=1
pkgdesc='Command-line tool for working with PDFs'
arch=('any')
url='https://gitlab.com/pdftk-java/pdftk'
license=('GPL')
depends=('java-runtime-headless')
makedepends=('git' 'ant' 'bcprov' 'java-commons-lang')
checkdepends=('java-hamcrest' 'junit' 'junit-system-rules' 'poppler')
optdepends=('bcprov: encrypted PDF support'
            'java-commons-lang: dump_data operation support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git" 'pdftk.sh')
sha512sums=('SKIP'
            'e6e3ae576d80c9e03fc9b08d858d854db055cf74d8650b7b315e680a719fce5152ceb381e1315d526ba530d26a7427b256c311dbc0109dda777174d1abca74cd')

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
