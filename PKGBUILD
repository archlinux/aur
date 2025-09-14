# Maintainer: Zesko
pkgname="limine-snapper-sync-git"
pkgver=r453.9cb83c4
pkgrel=1
pkgdesc="The tool syncs Limine snapshot entries with Snapper snapshots."
arch=("any")
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=(git+$url.git)
license=("GPL3")
_jre_version=17
_jdk_version=21
depends=(
	'bash'
	'java-runtime-headless>='${_jre_version}
	'limine'
	'snapper'
	'btrfs-progs'
	'inotify-tools'
	'libnotify')
optdepends=(
	'limine-dracut-support: It automates kernel installation/removal and Limine boot entry management.'
	'limine-mkinitcpio-hook: It automates kernel installation/removal and Limine boot entry management.'
	'snap-pac: triggers Snapper to create snapshots during system updates.'
	'rsync: Alternative method for restoring snapshots.'
	'journalctl-desktop-notification: Sends desktop notifications for errors, including detected hardware issues.'
	'b3sum: Fast Blake3 hash function to prevent duplication.'
	'xxhash: Fast hashing utility for deduplication with shorter hashes.'
)
makedepends=('git' 'jdk21-openjdk' 'maven')
sha1sums=('SKIP')
backup=(etc/limine-snapper-sync.conf)
conflicts=('limine-snapper-sync')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	unset JAVA_OPTS JDK_JAVA_OPTIONS JAVA_TOOL_OPTIONS
	JAVA_HOME=/usr/lib/jvm/java-${_jdk_version}-openjdk
	if ! command -v ${JAVA_HOME}/bin/javac >/dev/null 2>&1; then
		echo "Error: ${JAVA_HOME}/bin/javac not found." >&2
		return 1
	fi
}

build() {
	cd "$srcdir/${pkgname%-git}"
	JAVA_HOME=/usr/lib/jvm/java-${_jdk_version}-openjdk mvn clean package
}

package() {
	cd "$srcdir/${pkgname%-git}"
	src_path="install/arch-linux/"
	install -dm 755 $src_path/usr/share/java/
	install -Dm 644 target/limine-snapper-sync.jar $src_path/usr/share/java/
	install -dm 755 $src_path/usr/share/doc/${pkgname%-git}/
	cp -r README.md CHANGELOG.md screenshots $src_path/usr/share/doc/${pkgname%-git}/
	cp -r $src_path/usr $src_path/etc "$pkgdir"
}
