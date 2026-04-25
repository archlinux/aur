# Maintainer: Zesko
pkgname="limine-snapper-sync"
pkgver=1.27.0
pkgrel=1
pkgdesc="Automatically syncs Limine snapshot entries with Snapper snapshots."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-25.0.2/graalvm-community-jdk-25.0.2_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-25.0.2/graalvm-community-jdk-25.0.2_linux-aarch64_bin.tar.gz")
license=("GPL3")
options=(!debug !strip)
_graalvm_version=graalvm_ce_jdk25
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
sha256sums=('a39bc5f77a5ccb070c391b4606703d2a81c247cf93392709837602614b21f28c')
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
	cd "$srcdir/${pkgname}"
	export GRAALVM_HOME="$srcdir/${_graalvm_version}"
	export JAVA_HOME="${GRAALVM_HOME}"
	export NATIVE_IMAGE_OPTIONS="-march=compatibility"
	/usr/bin/gradle clean nativeCompile -Dorg.gradle.java.home="${JAVA_HOME}"
}

package() {
	cd "$srcdir/${pkgname}"
	local src="install/arch-linux"

	# directories
	install -dm 755 \
		"$pkgdir/usr/share/doc/limine-snapper-sync" \
		"$pkgdir/etc/boot/hooks/pre.d" \
		"$pkgdir/etc/boot/hooks/post.d" \
		"$pkgdir/usr/lib/limine"

	# docs
	install -Dm 644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/limine-snapper-sync/"

	# files
	cp -a "$src/etc" "$src/usr" "$pkgdir/"
	install -Dm 755 "build/native/nativeCompile/limine-snapper-sync" "$pkgdir/usr/lib/limine/"
}
