# Maintainer: Zesko
pkgname="limine-snapper-sync"
pkgver=1.21.0
pkgrel=1
pkgdesc="The tool syncs Limine snapshot entries with Snapper snapshots."
arch=("any")
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
license=("GPL3")
_jre_version=17
_jdk_version=21
depends=(
	'bash'
	'java-runtime-headless>='${_jre_version}
	'limine'
	'snapper'
	'btrfs-progs'
	'libnotify')
optdepends=(
	'limine-dracut-support: Automates kernel installation/removal and Limine boot entry management.'
	'limine-mkinitcpio-hook: Automates kernel installation/removal and Limine boot entry management.'
	'inotify-tools: Monitors when snapshots are created or deleted.'
	'rsync: Alternative method for restoring snapshots.'
	'b3sum: Fast Blake3 hash function to prevent duplication.'
	'xxhash: Fast hashing utility for deduplication with shorter hashes.'
)
makedepends=('git' 'jdk21-openjdk' 'maven')
backup=(etc/limine-snapper-sync.conf)
conflicts=('limine-snapper-sync-git')
sha256sums=('b114a368405121be236c1f5c97c6fd6f765a637611256586c9996415bcf41cad')

prepare() {
	unset JAVA_OPTS JDK_JAVA_OPTIONS JAVA_TOOL_OPTIONS
	JAVA_HOME=/usr/lib/jvm/java-${_jdk_version}-openjdk
	if ! command -v ${JAVA_HOME}/bin/javac >/dev/null 2>&1; then
		echo "Error: ${JAVA_HOME}/bin/javac not found." >&2
		return 1
	fi
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	JAVA_HOME=/usr/lib/jvm/java-${_jdk_version}-openjdk mvn clean package
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	src_path="install/arch-linux/"
	install -dm 755 $src_path/usr/share/java/
	install -Dm 644 target/limine-snapper-sync.jar $src_path/usr/share/java/
	install -dm 755 $src_path/usr/share/doc/limine-snapper-sync/
	cp -r README.md CHANGELOG.md screenshots $src_path/usr/share/doc/limine-snapper-sync/
	cp -r $src_path/usr $src_path/etc "$pkgdir"
}
