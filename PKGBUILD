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
makedepends=('git' 'maven')
sha256sums=('SKIP')
backup=(etc/limine-entry-tool.conf)
conflicts=('limine-dracut-support' 'limine-entry-tool')

pkgver() {
    cd "$srcdir"/limine-entry-tool
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_check_java_version() {
    local java_version
    java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' | cut -d'.' -f1)

    if [[ -z "$java_version" ]]; then
        echo "Error: Java version ${_java_version} is not installed or not set." >&2
        echo "Please check with: 'archlinux-java status'"
        echo "If java ${_java_version} or a newer version is installed, run 'archlinux-java set java-${_java_version}-openjdk' or a newer version."
        return 1
    fi

    if [[ "$java_version" -lt ${_java_version} ]]; then
        echo "Error: Java version $java_version is older than the required ${_java_version}."
        echo "Please check with: 'archlinux-java status'"
        echo "If java ${_java_version} or a newer version is installed, run 'archlinux-java set java-${_java_version}-openjdk' or a newer version."
        return 1
    fi
}

build() {
    unset JAVA_HOME JAVA_OPTS JDK_JAVA_OPTIONS JAVA_TOOL_OPTIONS
    if _check_java_version; then
        cd "$srcdir"/limine-entry-tool
        mvn clean package
    else
        return 1
    fi
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
