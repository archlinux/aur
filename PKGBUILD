pkgname=jcef-jetbrains-git
pkgdesc="A simple framework for embedding Chromium-based browsers into Java-based applications. (Used for JetBrainsRuntime)"
pkgver=144.0.15.api1.21.r1207.5b93e5b9
pkgrel=2
arch=('x86_64')
url="https://github.com/JetBrains/jcef"
license=('BSD')
depends=('java-runtime' 'libxcursor' 'at-spi2-atk' 'libxkbcommon' 'libxcomposite' 'mesa' 'libcups' 'pango' 'libxrandr' 'alsa-lib' 'nss' 'libxdamage')
makedepends=('jdk21-openjdk' 'cmake' 'git' 'ninja' 'python' 'ant' 'unzip' 'zip')
source=("git+$url.git#branch=dev"
        'vcpkg-add-thrift-gcc15-fix.patch')
sha256sums=('SKIP'
            '5787d11d112401addafb396286bf9a577ed601f15e5e84728b92db7fbb13d54d')
provides=('jcef-jetbrains')
conflicts=('jcef-jetbrains')

pkgver() {
    cd jcef
    ver=$(cat build.xml | grep \"jcef.version\" | cut -d \" -f 4 | sed -e "s/\(.*\)-.*-chromium-.*-api-\(.*\)/\1.api\2/g" -e 's/-${jcefBranch}-${buildNumber}//')
    count=$(git rev-list --count HEAD)
    sha=$(git rev-parse --short HEAD)
    echo "$ver.r$count.$sha"
}

prepare() {
    # Temp fix for vcpkg thrift's failure to build with gcc 15
    # https://github.com/microsoft/vcpkg/issues/47928
    # https://github.com/apache/thrift/pull/3078

    cd $srcdir/jcef
    git submodule deinit -f .
    git submodule update --init --recursive
    patch -p1 --dir=third_party/vcpkg < "$srcdir/vcpkg-add-thrift-gcc15-fix.patch"
}

build() {
    cd $srcdir/jcef
    export CFLAGS=${CFLAGS/-Wp,-D_FORTIFY_SOURCE=3/}
    export CXXFLAGS=${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=3/}
    sed -i "s/make -j4/make/g" ./jb/tools/linux/build_native.sh
    JAVA_HOME=/usr/lib/jvm/java-21-openjdk ./jb/tools/linux/build.sh all
}

package() {
    cd $srcdir/jcef
    mkdir -p $pkgdir/usr/lib/jcef-jetbrains
    tar -xvf jcef_linux_x64.tar.gz -C $pkgdir/usr/lib/jcef-jetbrains --no-same-owner
    install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/jcef-jetbrains/LICENSE
}
