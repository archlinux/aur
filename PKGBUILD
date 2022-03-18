_pkgname=realcugan-ncnn-vulkan
pkgname=$_pkgname-git
pkgver=20220318.r0.gf1271a2
pkgrel=3
epoch=
pkgdesc="ncnn implementation of Real-CUGAN converter. Runs fast on Intel / AMD / Nvidia / Apple-Silicon with Vulkan API."
arch=('x86_64')
url="https://github.com/nihui/$_pkgname"
license=('MIT')
groups=()
depends=('vulkan-icd-loader' 'vulkan-driver')
makedepends=('git' 'cmake' 'ninja' 'glslang' 'vulkan-headers')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/nihui/$_pkgname" "model-path.patch")
noextract=()
md5sums=('SKIP' '8e1edd929f5ade6af986b0eda55b5fb5')
validpgpkeys=()

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    git submodule update --init --recursive
    git apply "$srcdir/model-path.patch"
}

build() {
    cd "$srcdir/$_pkgname"
    cmake -B build -S src -Wno-dev -DCMAKE_BUILD_TYPE='Release' -G Ninja
    cmake --build build
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 build/$_pkgname "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    cd models
    for f in */*; do 
        install -Dm644 "$f" ${pkgdir}/usr/share/${_pkgname}/"$f"
    done
}
