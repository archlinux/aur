# Maintainer: Zesko
pkgname="limine-mkinitcpio-hook-git"
_pkgname="limine-entry-tool"
pkgver=r682.5e6be0c
pkgrel=1
pkgdesc="Install kernels for the Limine bootloader."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zesko/limine-entry-tool"
source=("${_pkgname}::git+${url}.git")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-25.6.5.1/graalvm-community-jdk-25i6-25.0.5.1_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-25.6.5.1/graalvm-community-jdk-25i6-25.0.5.1_linux-aarch64_bin.tar.gz")
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
sha256sums=('SKIP')
sha256sums_x86_64=('d792848db26f1602f0a5cf2cd9279d9a652d32ab450d891ce616c9ca67e359d0')
sha256sums_aarch64=('d8e6edf0009bb5d70c6a670eb030d36aa804795427306434c0f7f63c01435307')
backup=(etc/limine-entry-tool.conf)
conflicts=('limine-entry-tool')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	[[ -d "${_graalvm_version}" ]] && rm -rf "${_graalvm_version}"
	mv graalvm-community-*/ "${_graalvm_version}"
	if ! command -v "${_graalvm_version}"/bin/javac >/dev/null 2>&1; then
		echo "Error: ${_graalvm_version}/bin/javac not found." >&2
		return 1
	fi
}

build() {
	cd "$srcdir/${_pkgname}"
	export GRAALVM_HOME="$srcdir/${_graalvm_version}"
	export JAVA_HOME="${GRAALVM_HOME}"
	export NATIVE_IMAGE_OPTIONS="-march=compatibility --future-defaults=all"
	#export NATIVE_IMAGE_OPTIONS="-march=native"
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
