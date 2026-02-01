# Maintainer: Zesko
pkgname="limine-dracut-support-git"
_pkgname="limine-entry-tool"
pkgver=r548.6827169
pkgrel=1
pkgdesc="Install kernels for the Limine bootloader."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zesko/limine-entry-tool"
source=("${_pkgname}::git+${url}.git")
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
	'dracut'
	'efibootmgr')
optdepends=(
	'kernel-modules-hook: Safely keeps kernel on upgrade failure'
	'sbctl: Signs UEFI boot files for Secure Boot when enabled'
	'journalctl-desktop-notification: Sends desktop notifications when errors occur'
)
makedepends=('git' 'gradle')
sha256sums=('SKIP')
sha256sums_x86_64=('e0be791c8fda4d03b6b0a0cb824fef3149736170057b3a515252b44419606af0')
sha256sums_aarch64=('e0e18106fa1d8628d8ba21f548865211d7c8608a3423f7b25cb2aa4eef9abf10')
backup=(etc/limine-entry-tool.conf)
conflicts=('limine-entry-tool')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
	JAVA_HOME="$srcdir/${_graalvm_version}" gradle clean nativeCompile
}

package() {
	cd "$srcdir/${_pkgname}"
	src_path="install/arch-linux/${pkgname%-git}"
	install -dm 755 "$src_path/usr/share/limine-entry-tool.d/"
	install -dm 755 "$src_path/etc/limine-entry-tool.d/"
	install -Dm 755 build/native/nativeCompile/limine-entry-tool "$src_path/usr/lib/limine/"
	install -dm 755 "$src_path/usr/share/doc/${pkgname%-git}/"
	cp -r README.md CHANGELOG.md "$src_path/usr/share/doc/${pkgname%-git}/"
	cp -r "$src_path/usr" "$src_path/etc" "$pkgdir"
}
