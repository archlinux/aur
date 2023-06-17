# Maintainer: NullBite <aur.archlinux@nullbite.com>
pkgname=packwiz-installer
pkgver=0.5.10
pkgrel=1
pkgdesc="An installer for packwiz modpacks."
arch=("any")
url="https://github.com/packwiz/packwiz-installer"
license=("MIT")
depends=('java-environment')
makedepends=('git'
'java-environment-openjdk<=11')
_tag=7b6daaf7e552f44888d68dcd8235822dd1c2956e # git rev-parse v${pkgver}
source=("$pkgname::git+https://github.com/packwiz/$pkgname.git#tag=$_tag"
"$pkgname-bootstrap::git+https://github.com/packwiz/$pkgname-bootstrap.git#tag=v0.0.3"
"packwiz-installer.sh"
"packwiz-installer-bootstrap.sh")
sha256sums=('SKIP'
            'SKIP'
            '924aff17bf4ad5fd745c5378d39ec883f685a9b0f4f754828cd99bc83c71df6d'
            '783990641e80a1b6603264d420ccf0ab6ad5a5c519e05a27162472c1746630cd')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//'
}

prepare() {
	cd "$srcdir/$pkgname-bootstrap"
	chmod +x gradlew
}

build() {
	# subshell for isolated environment, as to not alter PATH for the rest
	# of the build
	(
		# attempt to locate compatible JDK version for building, then
		# fall back to default JDK
		PATH="/usr/lib/jvm/java-8-openjdk/bin${PATH:+:${PATH}}"
		PATH="/usr/lib/jvm/java-11-openjdk/bin${PATH:+:${PATH}}"
		export PATH
		cd "$srcdir/$pkgname"
		./gradlew buildNeeded

		cd "$srcdir/$pkgname-bootstrap"
		./gradlew buildNeeded
	)
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm644 build/dist/packwiz-installer.jar \
		"${pkgdir}/usr/share/java/packwiz/packwiz-installer.jar"

	cd "$srcdir/$pkgname-bootstrap"
	install -Dm644 build/libs/packwiz-installer-bootstrap-all.jar \
		"${pkgdir}/usr/share/java/packwiz/packwiz-installer-bootstrap.jar"

	cd "$srcdir"
	install -Dm755 packwiz-installer.sh "${pkgdir}/usr/bin/packwiz-installer"
	install -Dm755 packwiz-installer-bootstrap.sh \
		"${pkgdir}/usr/bin/packwiz-installer-bootstrap"
}
