# Maintainer: Zesko
pkgname="limine-dracut-support-git"
pkgver=r422.97abea7
pkgrel=1
pkgdesc="Install kernel for the Limine bootloader."
arch=('x86_64')
url="https://gitlab.com/Zesko/limine-entry-tool"
source=(git+$url.git)
license=("GPL3")
provides=('limine-entry-tool')
_java_version=17
depends=(
	'bash'
	'grep'
	'tar'
	'java-runtime-headless>='${_java_version}
	'limine'
	'dracut'
	'efibootmgr')
optdepends=(
	'kernel-modules-hook: Safely keeps kernel on upgrade failure'
	'sbctl: Signs UEFI boot files for Secure Boot when enabled'
	'journalctl-desktop-notification: Sends desktop notifications when errors occur'
)
makedepends=('git' 'java-environment=21' 'maven')
sha256sums=('SKIP')
backup=(etc/limine-entry-tool.conf)
conflicts=('limine-entry-tool')

pkgver() {
	cd "$srcdir"/limine-entry-tool
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	unset JAVA_HOME JAVA_OPTS JDK_JAVA_OPTIONS JAVA_TOOL_OPTIONS
	local java_version

	if ! command -v javac >/dev/null 2>&1; then
		echo "Error: JDK not found. You are running with a JRE only." >&2
		echo "Please install a JDK (e.g. 'jdk21-openjdk') and set it with:" >&2
		echo "  sudo archlinux-java set java-21-openjdk"
		return 1
	fi

	java_version=$(javac -version 2>&1 | awk '{print $2}' | cut -d'.' -f1)

	if [[ -z "$java_version" ]]; then
		echo "Error: Unable to determine the installed JDK version." >&2
		return 1
	fi

	if [[ "$java_version" -lt ${_java_version} ]]; then
		echo "Error: JDK ${_java_version} or newer is required." >&2
		echo "Check with: 'archlinux-java status'" >&2
		echo "Please install a newer JDK (e.g. 'jdk21-openjdk') and set it with:" >&2
		echo "  sudo archlinux-java set java-21-openjdk"
		return 1
	fi
}

build() {
	cd "$srcdir"/limine-entry-tool
	mvn clean package

}

package() {
	cd "$srcdir"/limine-entry-tool
	src_path="install/arch-linux/${pkgname%-git}"
	install -dm 755 $src_path/usr/share/java/
	install -dm 755 $src_path/usr/share/limine-entry-tool.d/
	install -dm 755 $src_path/etc/limine-entry-tool.d/
	install -Dm 644 target/limine-entry-tool.jar $src_path/usr/share/java/
	install -dm 755 $src_path/usr/share/doc/${pkgname%-git}/
	cp -r README.md CHANGELOG.md $src_path/usr/share/doc/${pkgname%-git}/
	cp -r $src_path/usr $src_path/etc "$pkgdir"
}
