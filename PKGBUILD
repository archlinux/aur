# Maintainer:  jopejoe1 <johannes@joens.email>

_pkgname=cubiomes-viewer
pkgname=$_pkgname-git
pkgver=2.3.3.r3.g15b90aa
pkgrel=1
pkgdesc="An efficient graphical Minecraft seed finder and map viewer"
arch=("x86_64")
url="https://github.com/Cubitect/cubiomes-viewer"
license=('GPL3')
depends=("qt5-base")
makedepends=("gendesk" "qt5-tools")
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git"
        "git+https://github.com/Cubitect/cubiomes.git")
sha256sums=("SKIP"
            "SKIP")

pkgver() {
	cd $_pkgname
	echo $(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.cubiomes "$srcdir/cubiomes"
  git submodule update
}

build() {
    mkdir -p $_pkgname/build
    cd $_pkgname/build
    qmake CONFIG+=without_network ..
    make
}

package() {
    install -Dm755 "$_pkgname/build/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname/rc/icons/map.png" "${pkgdir}/usr/share/pixmaps/com.github.cubitect.cubiomes-viewer.png"
    install -Dm644 "$_pkgname/etc/com.github.cubitect.cubiomes-viewer.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$_pkgname/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
