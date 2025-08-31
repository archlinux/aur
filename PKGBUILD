# Maintainer: Nlsdt <xsfx0313@proton.me>
# Maintainer: Li Hua <lihua@email.com>

# 包元数据
_pkgname=HybridFileXfer
# https://github.com/weixiansen574/HybridFileXfer
pkgname=hybridfilexfer-git
pkgver=r65.7de4351
pkgrel=2
pkgdesc='Multi-track Express Transfer: Simultaneously utilize all I/O channels (USB+WiFi) for maximum file transfer speed || 多轨快传：同时利用所有输入/输出通道 (USB+WiFi),实现最大文件传输速度'
# 多轨快传：同时利用所有输入/输出通道（USB+WiFi），实现最大文件传输速度
arch=('x86_64')
url='https://github.com/weixiansen574/HybridFileXfer'
license=('GPL-3.0-only')

# 依赖
depends=(
    'java-runtime>=8'
    'android-tools'
    'android-udev'
    'bash'
)
# 依赖 java1.8, adb 属于 android-tools
makedepends=(
    'jdk8-openjdk'
    'git'
)
# 编译依赖 **必须** 依赖 java 8 （为什么这么老？
provides=('hybridfilexfer')
conflicts=('hybridfilexfer')

# 资源获取
source=(
    "$_pkgname::git+https://github.com/weixiansen574/HybridFileXfer.git"
    'annotations.jar::https://repo1.maven.org/maven2/org/jetbrains/annotations/24.0.1/annotations-24.0.1.jar'
)
sha256sums=(
    'SKIP'
    '61666dbce7e42e6c85b43c04fcfb8293a21dcb55b3c80e869270ce42c01a6b35'
)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

# 准备
prepare() {
    mv annotations.jar "./$_pkgname/$_pkgname-PC/annotations.jar"
}

# 构建
build() {
    cd $_pkgname/$_pkgname-PC
    find src -name "*.java" > sources.txt
    echo '编译 classes | compile classes'
    mkdir -p build/classes
    /usr/lib/jvm/java-8-openjdk/bin/javac -cp annotations.jar -d build/classes @sources.txt
    echo '编译 classes 完成| compile classes done'
    echo '复制语言文件 | copy i18n files'
    cp ./src/messages_*.properties ./build/classes/
    echo '复制语言文件 完成| copy i18n files done'
    echo 'jar 打包 | packing jar'
    jar cvfm "$_pkgname.jar" ./src/META-INF/MANIFEST.MF -C build/classes .
    echo 'jar 打包 完成| packing jar done'
}

#安装
package() {

    install -dm755 "$pkgdir/usr/share/java/$_pkgname/"
    # 安装 jar 文件
    install -Dm644 "$_pkgname/$_pkgname-PC/$_pkgname.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
    install -dm755 "$pkgdir/usr/bin/"
    cat > "${_pkgname,,}" << EOF
#!/bin/bash
exec java -jar /usr/share/java/$_pkgname/$_pkgname.jar "\$@"
EOF
    install -Dm755 "${_pkgname,,}" "$pkgdir/usr/bin/$_pkgname"
}
