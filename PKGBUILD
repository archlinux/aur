# Maintainer: Zesko
pkgname="limine-snapper-sync"
pkgver=1.33.1
pkgrel=1
pkgdesc="Integrates Limine boot entries with Snapper snapshots."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-25.6.5.1/graalvm-community-jdk-25i6-25.0.5.1_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-25.6.5.1/graalvm-community-jdk-25i6-25.0.5.1_linux-aarch64_bin.tar.gz")
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
makedepends=('git' 'gradle' 'gettext')
backup=(etc/limine-snapper-sync.conf)
conflicts=('limine-snapper-cli' 'limine-snapper-sync-git')
sha256sums=('24b34445cdcf37cceaf3d02d7cfdacfd1c07c26af79abf0ccad87d0443b1bc32')
sha256sums_x86_64=('d792848db26f1602f0a5cf2cd9279d9a652d32ab450d891ce616c9ca67e359d0')
sha256sums_aarch64=('d8e6edf0009bb5d70c6a670eb030d36aa804795427306434c0f7f63c01435307')

prepare() {
	[[ -d "${_graalvm_version}" ]] && rm -rf "${_graalvm_version}"
	mv graalvm-community-*/ "${_graalvm_version}"
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
