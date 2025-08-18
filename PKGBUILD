# Maintainer Sunny brainworms2002 at gmail.com

pkgname=kanji-dojo
pkgver=2.1.9
pkgrel=1
pkgdesc="Practice writing Japanese letters, learn their meanings and related words"
arch=('x86_64')
license=('GPL3')
url="https://github.com/syt0r/Kanji-Dojo"
makedepends=('jdk17-openjdk' 'dpkg')
options=('!strip' '!debug')
source=("git+https://github.com/syt0r/Kanji-Dojo")
sha256sums=('SKIP')

build() {
	# build for linux
    JAVA_HOME=/usr/lib/jvm/java-17-openjdk/
	PATH=$PATH:/usr/lib/jvm/java-17-openjdk/bin
	cd Kanji-Dojo
	./gradlew desktopApp:packageDistributionForCurrentOS
}
package() {
	# extract deb
	dpkg-deb -x "Kanji-Dojo/desktopApp/build/compose/binaries/main/deb/kanji-dojo_${pkgver}-${pkgrel}_amd64.deb" kanji-dojo/

	# move to correct directories
	mkdir -p "${pkgdir}/opt"
	mkdir -p "${pkgdir}/usr/bin"
	mv "${srcdir}/kanji-dojo/opt/kanji-dojo" "${pkgdir}/opt/kanji-dojo"
	ln -s "${pkgdir}/opt/kanji-dojo/bin/Kanji Dojo" "${pkgdir}/usr/bin/kanji-dojo"
	install -Dm 644 "${pkgdir}/opt/kanji-dojo/lib/kanji-dojo-Kanji_Dojo.desktop" "${pkgdir}/usr/share/applications/kanji-dojo.desktop"
	chmod -R go-w "${pkgdir}"
}
