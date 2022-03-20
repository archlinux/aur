pkgname=jcef-jetbrains-git
pkgdesc="A simple framework for embedding Chromium-based browsers into Java-based applications. (Used for JetBrainsRuntime)"
pkgver=r511.316db13
pkgrel=1
arch=('x86_64')
url="https://github.com/JetBrains/jcef"
license=('BSD')
makedepends=('java-environment=11' 'cmake' 'git' 'ninja')
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
    sed -i "s/4.46/5.4/g" tools/buildtools/download_from_google_storage.py
    mkdir jcef_build && cd jcef_build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
    cd ../jb/tools/linux
    JDK_11=/usr/lib/jvm/$(ls /usr/lib/jvm | grep 11 | head -n 1) ./build.sh all
}

package() {
    cd jcef
    mkdir -p $pkgdir/usr/lib/jcef-jetbrains
    tar xvf jcef_linux_x64.tar.gz -C $pkgdir/usr/lib/jcef-jetbrains
    install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/jcef-jetbrains/LICENSE
}

