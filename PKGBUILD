pkgname=zephyrusbling-git
pkgver=r24.80956bf
pkgrel=1
pkgdesc="A utility to display images on the LEDs on the back of the Zephyrus G14 laptop"
url="https://github.com/Meumeu/ZephyrusBling"
arch=("x86_64")
depends=("asusctl" "cli11" "fmt" "glm" "microsoft-gsl" "sdbus-cpp")
makedepends=("boost" "cmake")
source=(
    "${pkgname%-git}::git+https://github.com/Meumeu/ZephyrusBling.git"
    "zephyrusblingd.service"
)
sha256sums=(
    "SKIP"
    "fa16762e0cd11ff6e53d3a0de4e57745ac32e8dea819cd9df9d93e7e4aca30b5"
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
