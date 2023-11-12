pkgname=tuxclocker-git
_pkgname=tuxclocker
pkgver=1.3.0+rc.1+6+gae13f1a
pkgrel=1
pkgdesc="A hardware controlling and monitoring program for GPUs and CPUs"
arch=('x86_64')
url="https://github.com/Lurkki14/tuxclocker"
license=('GPL3')
depends=('boost-libs' 'libdrm' 'qt5-base' 'qt5-charts')
makedepends=('boost' 'git' 'meson' 'qt5-tools')
optdepends=('libxnvctrl: XNVCtrl' 'nvidia-utils: nvidia-ml')
source=(
            "git+https://github.com/Lurkki14/tuxclocker.git#branch=master" 
            'tuxclocker.desktop'
            'tuxclockerd.service'
        )
sha256sums=(
            
            'SKIP'
            '36036dbb5c4f87e43b50245368fe6c851c2e9112d69b35ce18d16682251d2993'
            '8653298ae35ecefae135ceb3d518d87d9ff3d2b56a0b456327085fa6f9a38b4d'
        )

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/$_pkgname"

    meson build --prefix=/usr -Dplugins=true -Ddaemon=true

    meson compile -C build
}

package() {
    pushd "$srcdir/$_pkgname"
    
    meson install -C build --destdir "$pkgdir"
 
    popd

    install -Dm644 "$srcdir/$_pkgname/src/$_pkgname-qt/resources/$_pkgname-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

    install -Dm644 "tuxclocker.desktop" -t "$pkgdir/usr/share/applications/"

    install -Dm644 "tuxclockerd.service" "$pkgdir/usr/lib/systemd/system/tuxclockerd.service"

    echo
    echo
    echo -----------------------------------------------------------------------------------------------
    echo 'Please do not forget to enable and start systemd service "systemctl enable --now tuxclockerd"'
    echo -----------------------------------------------------------------------------------------------
    echo
    echo
}
