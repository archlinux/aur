# Maintainer: Zesko
_pkgname="limine-entry-tool"
pkgname="limine-mkinitcpio-hook"
pkgver=1.29.0
pkgrel=1
_extver="-${pkgrel}"
pkgdesc="Install kernels for the Limine bootloader."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zesko/limine-entry-tool"
source=("$url/-/archive/${pkgver}${_extver}/$_pkgname-${pkgver}${_extver}.tar.gz")
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-25.0.2/graalvm-community-jdk-25.0.2_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-25.0.2/graalvm-community-jdk-25.0.2_linux-aarch64_bin.tar.gz")
license=("GPL3")
provides=('limine-entry-tool')
options=(!debug !strip)
_graalvm_version=java-25-graalvm-ce
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
sha256sums=('03e041631aa1275f0a03ecae0ada6f1bb3fa69e5b428e5b68f7240da68b6b4f4')
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
	cd "$srcdir/${_pkgname}-${pkgver}${_extver}"
	JAVA_HOME="$srcdir/${_graalvm_version}" gradle clean nativeCompile
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}${_extver}"
	src_path="install/arch-linux/${pkgname}"
	install -dm 755 "$src_path/usr/share/limine-entry-tool.d/"
	install -dm 755 "$src_path/etc/limine-entry-tool.d/"
	install -Dm 755 build/native/nativeCompile/limine-entry-tool "$src_path/usr/lib/limine/"
	install -dm 755 "$src_path/usr/share/doc/${pkgname}/"
	cp -r README.md CHANGELOG.md "$src_path/usr/share/doc/${pkgname}/"
	cp -r "$src_path/usr" "$src_path/etc" "$pkgdir"
}
