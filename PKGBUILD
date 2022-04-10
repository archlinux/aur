pkgname=cef-jetbrains-bin-git
pkgdesc="A simple framework for embedding Chromium-based browsers in other applications. (Used for JetBrainsRuntime)"
pkgver=98.3.31+gcfc070d+chromium+98.0.4758.102
pkgrel=1
arch=('x86_64')
url="https://github.com/JetBrains/cef"
license=('BSD')
depends=('at-spi2-atk' 'libxkbcommon' 'libxcomposite' 'mesa' 'libcups' 'pango' 'libxrandr' 'alsa-lib' 'nss')
#makedepends=('java-environment=11' 'cmake' 'git' 'ninja' 'python' 'ant')
makedepends=('unzip')
source=("https://github.com/JetBrains/jcef/raw/master/CMakeLists.txt"
"https://github.com/JetBrains/cef/raw/master/LICENSE.txt")
sha256sums=('SKIP' 'SKIP')
provides=('cef-jetbrains')
conflicts=('cef-jetbrains')

pkgver() {
    cd $srcdir
    cat CMakeLists.txt | grep "set(CEF_VERSION" | cut -d '"' -f 2 | sed "s/-/+/g"
}

prepare() {
    cd $srcdir
    echo "Downloading CEF binary..."
    url_version=$(cat CMakeLists.txt | grep "set(CEF_VERSION" | cut -d '"' -f 2 | sed "s/+/%2B/g")
    curl -L -o cef.zip https://cache-redirector.jetbrains.com/intellij-jbr/cef_binary_${url_version}_linux64_minimal.zip
}

package() {
    cd $srcdir
    zip_version=$(cat CMakeLists.txt | grep "set(CEF_VERSION" | cut -d '"' -f 2)
    mkdir -p $pkgdir/usr/lib
    unzip -d $pkgdir/usr/lib cef.zip
    mv $pkgdir/usr/lib/cef_binary_${zip_version}_linux64_minimal $pkgdir/usr/lib/cef-jetbrains
    mkdir -p $pkgdir/usr/share/licenses/cef-jetbrains
    install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/cef-jetbrains/LICENSE
}
