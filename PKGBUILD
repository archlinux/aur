# Maintainer: Zesko
pkgname="limine-dracut-support-git"
_pkgname="limine-entry-tool"
pkgver=r651.0f3c62e
pkgrel=1
pkgdesc="Install kernels for the Limine bootloader."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zesko/limine-entry-tool"
source=("${_pkgname}::git+${url}.git")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-25.4.4.1.1/graalvm-community-jdk-25i4-25.0.4.1.1_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-25.4.4.1.1/graalvm-community-jdk-25i4-25.0.4.1.1_linux-aarch64_bin.tar.gz")
license=("GPL3")
provides=('limine-entry-tool')
options=(!debug !strip)
_graalvm_version=graalvm_ce_jdk25
depends=(
	'bash'
	'grep'
	'tar'
	'limine'
	'dracut'
	'efibootmgr')
optdepends=(
	'kernel-modules-hook: Safely keeps kernel on upgrade failure'
	'sbctl: Signs UEFI boot files for Secure Boot when enabled'
	'journalctl-desktop-notification: Sends desktop notifications when errors occur'
)
makedepends=('git' 'gradle')
sha256sums=('SKIP')
sha256sums_x86_64=('05ccbbe783210b6886ff7b08fcd0b061c5dce4852b05db87284fc0e24abb08e2')
sha256sums_aarch64=('e5f5e2f59643cf96765c741dc00b206f86c69c8c1bf843fe26050c871e0e2dbc')
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
	cp -a "$src/limine-dracut-support/etc" "$src/limine-dracut-support/usr" "$pkgdir/"
	install -Dm 755 "build/native/nativeCompile/limine-entry-tool" "$pkgdir/usr/lib/limine/"

	# limine hook symlinks
	ln -sf /usr/bin/limine-reset-enroll "$pkgdir/etc/boot/hooks/pre.d/10-limine-reset-enroll"
	ln -sf /usr/bin/limine-enroll-config "$pkgdir/etc/boot/hooks/post.d/90-limine-enroll-config"
}
