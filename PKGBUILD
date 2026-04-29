# Maintainer: Zesko
_pkgname="limine-entry-tool"
pkgname="limine-mkinitcpio-hook"
_pkgver=1.36.0
_extver=""
pkgver="${_pkgver}${_extver}"
pkgrel=1
pkgdesc="Install kernels for the Limine bootloader."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zesko/limine-entry-tool"
source=("${_pkgname}::git+${url}.git#tag=${pkgver}")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-25.0.2/graalvm-community-jdk-25.0.2_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-25.0.2/graalvm-community-jdk-25.0.2_linux-aarch64_bin.tar.gz")
license=("GPL3")
provides=('limine-entry-tool')
options=(!debug !strip)
_graalvm_version=graalvm_ce_jdk25
depends=(
	'bash'
	'grep'
	'tar'
	'limine'
	'mkinitcpio'
	'efibootmgr')
optdepends=(
	'kernel-modules-hook: Safely keeps kernel on upgrade failure'
	'sbctl: Signs UEFI boot files for Secure Boot when enabled'
	'journalctl-desktop-notification: Sends desktop notifications when errors occur'
)
makedepends=('git' 'gradle')
backup=(etc/limine-entry-tool.conf)
conflicts=('limine-entry-tool')
sha256sums=('e389e36765acc9185499f764c6105ca02b11531d8665a67487816a24b518fecb')
sha256sums_x86_64=('e0be791c8fda4d03b6b0a0cb824fef3149736170057b3a515252b44419606af0')
sha256sums_aarch64=('b4580d9f223d0a4b3a1757e58b18ff4c1db950e67e105fc5cb741457d2384a71')

prepare() {
	[[ -d "${_graalvm_version}" ]] && rm -rf "${_graalvm_version}"
	mv graalvm-community-openjdk-*/ "${_graalvm_version}"
	if ! command -v "${_graalvm_version}"/bin/javac >/dev/null 2>&1; then
		echo "Error: ${_graalvm_version}/bin/javac not found." >&2
		return 1
	fi
}

build() {
	cd "$srcdir/${_pkgname}"
	export GRAALVM_HOME="$srcdir/${_graalvm_version}"
	export JAVA_HOME="${GRAALVM_HOME}"
	export NATIVE_IMAGE_OPTIONS="-march=compatibility"
	/usr/bin/gradle clean nativeCompile -Dorg.gradle.java.home="${JAVA_HOME}"
}

package() {
	cd "$srcdir/${_pkgname}"
	local src="install/arch-linux"

	# directories
	install -dm 755 \
		"$pkgdir/usr/share/doc/limine-entry-tool" \
		"$pkgdir/etc/boot/hooks/pre.d" \
		"$pkgdir/etc/boot/hooks/post.d" \
		"$pkgdir/usr/lib/limine"

	# docs
	install -Dm 644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/limine-entry-tool/"

	# files
	cp -a "$src/limine-entry-tool/etc" "$src/limine-entry-tool/usr" "$pkgdir/"
	cp -a "$src/limine-mkinitcpio-hook/etc" "$src/limine-mkinitcpio-hook/usr" "$pkgdir/"
	install -Dm 755 "build/native/nativeCompile/limine-entry-tool" "$pkgdir/usr/lib/limine/"

	# limine hook symlinks
	ln -sf /usr/bin/limine-reset-enroll "$pkgdir/etc/boot/hooks/pre.d/10-limine-reset-enroll"
	ln -sf /usr/bin/limine-enroll-config "$pkgdir/etc/boot/hooks/post.d/90-limine-enroll-config"
}
