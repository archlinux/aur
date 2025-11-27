# Maintainer: Zesko
pkgname="limine-entry-tool"
pkgver=1.26.1
pkgrel=1
_extver="-${pkgrel}"
pkgdesc="Install kernel for the Limine bootloader."
arch=('any')
url="https://gitlab.com/Zesko/limine-entry-tool"
source=("$url/-/archive/${pkgver}${_extver}/$pkgname-${pkgver}${_extver}.tar.gz")
license=("GPL3")
provides=('limine-entry-tool')
_jre_version=17
_jdk_version=21
depends=(
	'bash'
	'grep'
	'tar'
	'java-runtime-headless>='${_jre_version}
	'limine'
	'efibootmgr')
makedepends=('git' 'jdk21-openjdk' 'maven')
backup=(etc/limine-entry-tool.conf)
conflicts=('limine-entry-tool')
sha256sums=('e8913173f3e7c1046fac3a68768680eb302337afe441c7aa1d8a5fc4de4df37e')

prepare() {
	unset JAVA_OPTS JDK_JAVA_OPTIONS JAVA_TOOL_OPTIONS
	JAVA_HOME=/usr/lib/jvm/java-${_jdk_version}-openjdk
	if ! command -v ${JAVA_HOME}/bin/javac >/dev/null 2>&1; then
		echo "Error: ${JAVA_HOME}/bin/javac not found." >&2
		return 1
	fi
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}${_extver}"
	JAVA_HOME=/usr/lib/jvm/java-${_jdk_version}-openjdk mvn clean package
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}${_extver}"
	src_path="install/arch-linux/${pkgname}"
	install -dm 755 $src_path/usr/share/java/
	install -dm 755 $src_path/usr/share/limine-entry-tool.d/
	install -dm 755 $src_path/etc/limine-entry-tool.d/
	install -Dm 644 target/limine-entry-tool.jar $src_path/usr/share/java/
	install -dm 755 $src_path/usr/share/doc/${pkgname}/
	cp -r README.md CHANGELOG.md $src_path/usr/share/doc/${pkgname}/
	cp -r $src_path/usr $src_path/etc "$pkgdir"
}
