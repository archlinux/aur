# Maintainer: Zesko
pkgname="limine-snapper-sync"
pkgver=1.12.0
pkgrel=1
pkgdesc="The tool syncs Limine snapshot entries with Snapper snapshots."
arch=("any")
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
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
    'limine-dracut-support: It automates kernel installation/removal and Limine boot entry management.'
    'limine-mkinitcpio-hook: It automates kernel installation/removal and Limine boot entry management.'
    'snap-pac: triggers Snapper to create snapshots during system updates.'
    'rsync: Alternative method for restoring snapshots.'
    'journalctl-desktop-notification: Sends desktop notifications for errors, including detected hardware issues.'
    'b3sum: Fast Blake3 hash function to prevent duplication.'
)
makedepends=('git' 'maven')
backup=(etc/limine-snapper-sync.conf)
conflicts=('limine-snapper-sync-git')
sha256sums=('a587fdeafa3b493056135930a1d82c14f89d8d36279f3fd1dffec0e384768bdd')

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
        echo "Error: Java version $java_version is older than the required ${_java_version}." >&2
        echo "Please check with: 'archlinux-java status'"
        echo "If java ${_java_version} or a newer version is installed, run 'archlinux-java set java-${_java_version}-openjdk' or a newer version."
        return 1
    fi
}

build() {
    unset JAVA_HOME JAVA_OPTS JDK_JAVA_OPTIONS JAVA_TOOL_OPTIONS
    if check_java_version; then
        cd "$srcdir/${pkgname}-${pkgver}"
        mvn clean package
    else
        return 1
    fi
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    src_path="install/arch-linux/"
    install -dm 755 $src_path/usr/share/java/
    install -Dm 644 target/limine-snapper-sync.jar $src_path/usr/share/java/
    install -dm 755 $src_path/usr/share/doc/limine-snapper-sync/
    cp -r README.md CHANGELOG.md screenshots $src_path/usr/share/doc/limine-snapper-sync/
    cp -r $src_path/usr $src_path/etc "$pkgdir"
}
