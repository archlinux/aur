pkgname=zephyrusbling-git
pkgver=r19.a0c47d1
pkgrel=1
arch=("x86_64")
depends=("asus-nb-ctrl-git" "cli11" "fmt" "glm" "microsoft-gsl" "sdbus-cpp")
makedepends=("boost" "cmake")
source=(
    "${pkgname%-git}::git+https://github.com/Meumeu/ZephyrusBling.git"
    "zephyrusblingd.service"
)
sha256sums=(
    "SKIP"
    "d8e35ca01c148680414b65b7cd809054d945033779e187409f04f39889febbbe"
)

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    
    mkdir -p build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
    make
}

package() {
    install -d -m0755 "${pkgdir}/usr/lib/systemd/user"
    cp zephyrusblingd.service "${pkgdir}/usr/lib/systemd/user"
    cd "${srcdir}/${pkgname%-git}/build"
    make install DESTDIR="${pkgdir}"
}
