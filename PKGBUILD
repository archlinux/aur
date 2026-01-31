# Maintainer: Zesko
pkgname="limine-snapper-sync"
pkgver=1.22.0
pkgrel=1
pkgdesc="Automatically syncs Limine snapshot entries with Snapper snapshots."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-25.0.2/graalvm-community-jdk-25.0.2_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-25.0.2/graalvm-community-jdk-25.0.2_linux-aarch64_bin.tar.gz")
license=("GPL3")
options=(!debug !strip)
_graalvm_version=java-25-graalvm-ce
depends=(
	'bash'
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
makedepends=('git' 'gradle')
backup=(etc/limine-snapper-sync.conf)
conflicts=('limine-snapper-sync-git')
sha256sums=('c68cf79d04da748eeed7df191999c4f3200dfe145e63beec7ea4767f9bd8ba74')
sha256sums_x86_64=('e0be791c8fda4d03b6b0a0cb824fef3149736170057b3a515252b44419606af0')
sha256sums_aarch64=('b4580d9f223d0a4b3a1757e58b18ff4c1db950e67e105fc5cb741457d2384a71')

prepare() {
	[[ -d "${_graalvm_version}" ]] && rm -rf "${_graalvm_version}"
	mv graalvm-community-openjdk-*/ "${_graalvm_version}"
	if ! command -v "${_graalvm_version}"/bin/javac >/dev/null 2>&1; then
		echo "Error: "${_graalvm_version}"/bin/javac not found." >&2
		return 1
	fi
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	JAVA_HOME="$srcdir/${_graalvm_version}" gradle clean nativeCompile
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	src_path="install/arch-linux/"
	install -Dm 755 "build/native/nativeCompile/${pkgname}" "$src_path/usr/lib/limine/"
	install -dm 755 "$src_path/usr/share/doc/limine-snapper-sync/"
	cp -r README.md CHANGELOG.md "$src_path/usr/share/doc/limine-snapper-sync/"
	cp -r "$src_path/usr" "$src_path/etc" "$pkgdir"
}
