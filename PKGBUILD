# Maintainer: Zesko
pkgname="limine-entry-tool"
pkgver=1.16.4
pkgrel=1
pkgdesc="Install kernel for the Limine bootloader."
arch=('any')
url="https://gitlab.com/Zesko/limine-entry-tool"
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
license=("GPL3")
provides=('limine-entry-tool')
_java_version=17
depends=(
    'bash'
    'grep'
    'java-environment>='${_java_version}
    'limine'
    'efibootmgr')
makedepends=('git' 'maven')
backup=(etc/limine-entry-tool.conf)
conflicts=('limine-dracut-support' 'limine-dracut-support-git' 'limine-entry-tool-git')
sha256sums=('94bd24e94cfae4fb89a7f872c3fe8ac9dc0c2cc70afdf89f562d45444ad8d87b')

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
        echo "Error: Java version $java_version is older than the required ${_java_version}."
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
    src_path="install/arch-linux/${pkgname}"
    install -dm 755 $src_path/usr/share/java/
    install -Dm 644 target/limine-entry-tool.jar $src_path/usr/share/java/
    install -dm 755 $src_path/usr/share/doc/${pkgname}/
    cp -r README.md CHANGELOG.md $src_path/usr/share/doc/${pkgname}/
    cp -r $src_path/usr $src_path/etc "$pkgdir"
}
