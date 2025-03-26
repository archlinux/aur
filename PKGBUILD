# Maintainer: Zesko
pkgname="limine-snapper-sync-git"
pkgver=r279.7ef1f29
pkgrel=1
pkgdesc="The tool syncs Snapper snapshots with Limine bootloader"
arch=("any")
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=(git+$url.git)
license=("GPL3")
_java_version=17
depends=(
    'bash'
    'java-environment>='${_java_version}
    'limine'
    'snapper'
    'btrfs-progs'
    'inotify-tools'
    'libnotify')
optdepends=(
    'limine-dracut-support: Automates kernel installation/removal and Limine boot entry management.'
    'snap-pac: triggers Snapper to create snapshots during system updates.'
    'rsync: Alternative method for restoring snapshots.'
    'journalctl-desktop-notification: Sends desktop notifications for errors, including detected hardware issues.'
    'b3sum: Fast Blake3 hash function to prevent duplication.'
)
makedepends=('git' 'maven')
sha1sums=('SKIP')
backup=(etc/limine-snapper-sync.conf)
conflicts=('limine-snapper-sync')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check_java_version() {
    local java_version
    java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' | cut -d'.' -f1)

    if [[ -z "$java_version" ]]; then
        echo "Error: Java version ${_java_version} is not installed or not set." >&2
        echo "Please check with: 'archlinux-java status'"
        echo "If java ${_java_version} or a newer version is installed, run 'archlinux-java set java-${_java_version}-openjdk' or a newer version."
        return 1
    fi

    if [[ "$java_version" -lt ${_java_version} ]]; then
        echo "Error: Java version $java_version is older than the required  ${_java_version}."
        echo "Please check with: 'archlinux-java status'"
        echo "If java ${_java_version} or a newer version is installed, run 'archlinux-java set java-${_java_version}-openjdk' or  a newer version."
        return 1
    fi
}

build() {
    unset JAVA_HOME
    unset JAVA_OPTS
    unset JDK_JAVA_OPTIONS
    unset JAVA_TOOL_OPTIONS
    if check_java_version; then
        cd "$srcdir/${pkgname%-git}"
        mvn clean package
    else
        return 1
    fi
}

package() {
    cd "$srcdir/${pkgname%-git}"
    src_path="install/arch-linux/"
    install -dm 755 $src_path/usr/share/java/
    install -Dm 644 target/limine-snapper-sync.jar $src_path/usr/share/java/
    install -dm 755 $src_path/usr/share/doc/${pkgname%-git}/
    cp -r README.md CHANGELOG.md screenshots $src_path/usr/share/doc/${pkgname%-git}/
    cp -r $src_path/usr $src_path/etc "$pkgdir"
}
