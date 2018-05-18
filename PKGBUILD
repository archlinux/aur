# Maintainer: Raphael Michel <mail@raphaelmichel.de>
_pkgname=pretixdesk
pkgname=$_pkgname-git
pkgver=r100.b50a437
pkgrel=1
pkgdesc="Desktop application for attendee check-in with the pretix ticketing system"
arch=('x86_64')
license=('GPL')
url="https://pretix.eu"
depends=('jre8-openjdk' 'java-openjfx' 'bash' 'sqlite')
makedepends=('jre8-openjdk' 'java-openjfx' 'gradle')
source=('git+https://github.com/pretix/pretixdesk.git' 'git+https://github.com/pretix/libpretixsync.git' 'launcher' 'pretixdesk.desktop')
conflicts=('pretixdesk')
provides=('pretixdesk')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}/pretixdesk"
	git submodule init
	JAVA_HOME=/usr/lib/jvm/java-9-jdk ./gradlew build fatJar
}


prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule init
	git config submodule.libpretixsync.url $srcdir/libpretixsync
	git submodule update
}

package() {
	install -d "${pkgdir}/usr/bin"
	install -Dm 755 launcher "${pkgdir}/usr/bin/pretixdesk"
	install -Dm 644 pretixdesk.desktop "${pkgdir}/usr/share/applications/pretixdesk.desktop"

	cd "${srcdir}/${_pkgname}/pretixdesk"
	install -Dm 644 "build/libs/pretixdesk.jar" "${pkgdir}/usr/share/java/${_pkgname}/pretixdesk.jar"
	install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
