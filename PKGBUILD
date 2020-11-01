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
    "4c12badf4fe881c9a38e234f1c48d5e9c1f410bee5e5da281408459c7ac511d6"
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
