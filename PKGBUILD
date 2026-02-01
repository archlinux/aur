# Maintainer: Zesko
pkgname="limine-snapper-sync-git"
pkgver=r575.4665d73
pkgrel=1
pkgdesc="Automatically syncs Limine snapshot entries with Snapper snapshots."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=("${pkgname%-git}::git+${url}.git")
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
sha256sums=('SKIP')
sha256sums_x86_64=('e0be791c8fda4d03b6b0a0cb824fef3149736170057b3a515252b44419606af0')
sha256sums_aarch64=('e0e18106fa1d8628d8ba21f548865211d7c8608a3423f7b25cb2aa4eef9abf10')
backup=(etc/limine-snapper-sync.conf)
conflicts=('limine-snapper-sync')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	[[ -d "${_graalvm_version}" ]] && rm -rf "${_graalvm_version}"
	mv graalvm-community-openjdk-*/ "${_graalvm_version}"
	if ! command -v "${_graalvm_version}"/bin/javac >/dev/null 2>&1; then
		echo "Error: "${_graalvm_version}"/bin/javac not found." >&2
		return 1
	fi
}

build() {
	cd "$srcdir/${pkgname%-git}"
	JAVA_HOME="$srcdir/${_graalvm_version}" gradle clean nativeCompile
}

package() {
	cd "$srcdir/${pkgname%-git}"
	src_path="install/arch-linux/"
	install -Dm 755 "build/native/nativeCompile/limine-snapper-sync" "$src_path/usr/lib/limine/"
	install -dm 755 $src_path/usr/share/doc/${pkgname%-git}/
	cp -r README.md CHANGELOG.md "$src_path/usr/share/doc/${pkgname%-git}/"
	cp -r "$src_path/usr" "$src_path/etc" "$pkgdir"
}
