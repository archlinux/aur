pkgname=jcef-jetbrains-git
pkgdesc="A simple framework for embedding Chromium-based browsers into Java-based applications. (Used for JetBrainsRuntime)"
pkgver=r520.7bccdd9
pkgrel=1
arch=('x86_64')
url="https://github.com/JetBrains/jcef"
license=('BSD')
depends=('java-runtime' 'cef-jetbrains' 'libxcursor')
makedepends=('java-environment=11' 'cmake' 'git' 'ninja' 'python' 'ant')
source=("git+$url")
sha256sums=('SKIP')
provides=('jcef-jetbrains')
conflicts=('jcef-jetbrains')

pkgver() {
    cd jcef
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd jcef
    #sed -i "s/4.46/5.4/g" tools/buildtools/download_from_google_storage.py
    sed -i "s/^DownloadCEF.*$/set(CEF_ROOT \"\/usr\/lib\/cef-jetbrains\")/g" CMakeLists.txt
    mkdir -p jcef_build && cd jcef_build
    JAVA_HOME=/usr/lib/jvm/$(ls /usr/lib/jvm | grep 11 | head -n 1) cmake -DCMAKE_BUILD_TYPE=Release -DPROJECT_ARCH="x86_64" ..
    make
    cd ../jb/tools/linux
    JDK_11=/usr/lib/jvm/$(ls /usr/lib/jvm | grep 11 | head -n 1) ./build.sh all
}

package() {
    cd jcef
    mkdir -p $pkgdir/usr/lib/jcef-jetbrains
    tar xvf jcef_linux_x64.tar.gz -C $pkgdir/usr/lib/jcef-jetbrains --no-same-owner 
    rm -rf "${pkgdir}/usr/lib/jcef-jetbrains/swiftshader"
    find /usr/lib/cef-jetbrains/Release -maxdepth 1 -mindepth 1 -exec ln -sf {} "${pkgdir}/usr/lib/jcef-jetbrains/" \;
    install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/jcef-jetbrains/LICENSE
}

