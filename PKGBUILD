# Maintainer: telans <telans@protonmail.com>
# Co-Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="samrewritten-git"
_pkgname="SamRewritten"
pkgver=r135.cbc9583
pkgrel=1
pkgdesc="A Steam Achievement Manager For Linux."
arch=("any")
url="https://github.com/PaulCombal/SamRewritten"
license=("GPL3")
depends=("steam" "yajl" "gtkmm3" "glibc" "curl")
optdepends=("zenity: error messages with style"
            "valgrind: for automated dev script"
            "massif-visualizer: for automated dev script")
makedepends=("git" "make" "gcc>=9.0")
source=("git+https://github.com/PaulCombal/SamRewritten.git")
sha256sums=("SKIP")

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgname}
    make
}

package() {
    install -dm755 "${pkgdir}/usr/lib/"
    # Only copy required files. (Except for Glade files, as more may be added in the future.)
    cp -r --parents ${_pkgname}/{LICENSE,README.MD,bin/{launch.sh,libsteam_api.so,samrewritten},glade/*.glade,assets/icon_256.png} ${pkgdir}/usr/lib/
    install -Dm644 ${_pkgname}/assets/icon_256.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/samrewritten.png
    install -Dm644 ${_pkgname}/assets/icon_64.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/samrewritten.png
    # Executable
    install -dm755 ${pkgdir}/usr/bin
    ln -s /usr/lib/${_pkgname}/bin/launch.sh ${pkgdir}/usr/bin/samrewritten
    # Desktop Entry
    install -Dm644 ${_pkgname}/package/samrewritten.desktop ${pkgdir}/usr/share/applications/samrewritten.desktop
}