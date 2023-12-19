# Maintainer: NullBite <aur.archlinux@nullbite.com>
pkgname=packwiz-installer
pkgver=0.5.13
pkgrel=1
pkgdesc="An installer for packwiz modpacks."
arch=("any")
url="https://github.com/packwiz/packwiz-installer"
license=("MIT")
depends=('java-runtime')
makedepends=('git'
'java-environment<=11')
_tag=1ebb28c3ccea4bdd9df38615182826f564d7966e # git rev-parse v${pkgver}
_tag_bootstrap=fc4cd603d04d08c09fcd83cadb9ceedf776831e7
source=("$pkgname::git+https://github.com/packwiz/$pkgname.git#tag=$_tag"
"$pkgname-bootstrap::git+https://github.com/packwiz/$pkgname-bootstrap.git#tag=$_tag_bootstrap"
"packwiz-installer.sh")
sha256sums=('SKIP'
            'SKIP'
            '924aff17bf4ad5fd745c5378d39ec883f685a9b0f4f754828cd99bc83c71df6d')

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
}
