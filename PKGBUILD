# Maintainer: Zesko
pkgname="limine-snapper-sync"
pkgver=1.32.0
pkgrel=1
pkgdesc="Integrates Limine boot entries with Snapper snapshots."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-25.2.4/graalvm-community-jdk-25i2-25.0.4_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-25.2.4/graalvm-community-jdk-25i2-25.0.4_linux-aarch64_bin.tar.gz")
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
conflicts=('limine-snapper-cli' 'limine-snapper-sync-git')
sha256sums=('6bcc1d3ace58030204260a9a4d40d500c4822416be1b1c6edd153d1df0796b3d')
sha256sums_x86_64=('3f4a89de8eaa96f2ed677f09957c7e872cd8467aad3537f8b5394c1b8c4b942e')
sha256sums_aarch64=('22286f7ecd21b9aedb3226b9bf797469e1bd3eefc491e12ef3dd49b452d230b7')

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
