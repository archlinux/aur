pkgname=jcef-jetbrains-git
pkgdesc="A simple framework for embedding Chromium-based browsers into Java-based applications. (Used for JetBrainsRuntime)"
pkgver=r608.e238cf9
pkgrel=1
arch=('x86_64')
url="https://github.com/JetBrains/jcef"
license=('BSD')
depends=('java-runtime' 'libxcursor' 'at-spi2-atk' 'libxkbcommon' 'libxcomposite' 'mesa' 'libcups' 'pango' 'libxrandr' 'alsa-lib' 'nss')
makedepends=('java-environment=17' 'cmake' 'git' 'ninja' 'python' 'ant' 'unzip')
source=("git+$url.git#branch=dev")
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
    #sed -i "s/^DownloadCEF.*$/set(CEF_ROOT \"\/opt\/cef\")/g" CMakeLists.txt
    cd jb/tools/linux
    JAVA_HOME=/usr/lib/jvm/$(ls /usr/lib/jvm | grep 17 | head -n 1) ./build.sh all
}

package() {
    cd jcef
    mkdir -p $pkgdir/usr/lib/jcef-jetbrains
    tar xvf jcef_linux_x64.tar.gz -C $pkgdir/usr/lib/jcef-jetbrains --no-same-owner 
    #rm -rf "${pkgdir}/usr/lib/jcef-jetbrains/swiftshader"
    #find /opt/cef/Release -maxdepth 1 -mindepth 1 -exec ln -sf {} "${pkgdir}/usr/lib/jcef-jetbrains/" \;
    install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/jcef-jetbrains/LICENSE
}

