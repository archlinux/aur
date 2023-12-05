pkgname=tuxclocker-git
_pkgname=tuxclocker
pkgver=1.4.0.r603.a742cc1
pkgrel=3
pkgdesc="A hardware controlling and monitoring program for GPUs and CPUs"
arch=('x86_64')
url="https://github.com/Lurkki14/tuxclocker"
install="${pkgname}.install"
license=('GPL3')
provides=('tuxclocker-qt' 'tuxclockerd')
depends=('boost-libs' 'libdrm' 'qt5-base' 'qt5-charts')
makedepends=('boost' 'git' 'meson' 'qt5-tools')
optdepends=(
            'libxnvctrl: NVIDIA support'
            'nvidia-utils: NVIDIA support'
            'libx: AMD & NVIDIA support on X11'
            'libdrm: AMD support'
            'python-hwdata: Prettier AMD GPU names'
        )

conflicts=('tuxclocker')

source=(
            "git+https://github.com/Lurkki14/tuxclocker.git#branch=master" 
            'tuxclocker.desktop'
            'tuxclockerd.service'
            'tuxclockerd-dbus.service'
            'tuxclocker.env'
        )
sha256sums=(
            
            'SKIP'
            'bedbd8bedbbb1235790d882d5e51eb2af21f27b64b62eafa0e38222f54b560a0'
            'b39fb7ee38605d9626740f930bd0b58f15901655fba15ce0f5c8a5f4005637e8'
            '4928c76f4cee4f4bc435031f12620f99aa76b72fa459e809e30d58979e326a1e'
            'a5f194cce493e305da8592b630223d04a25e57c8c4e5a44ed47030f893270dde'
        )

pkgver() {
    cd "$srcdir/$_pkgname"
    # git describe --tags | sed 's/-/+/g'
    printf "%s.r%s.%s" "$(git describe --tags | cut -d'-' -f1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

    install -Dm644 "$srcdir/$_pkgname/dev/dbusconf.conf" "$pkgdir/etc/${_pkgname}-dbusconf.conf"

    install -Dm644 "$srcdir/$_pkgname/src/$_pkgname-qt/resources/$_pkgname-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

    install -Dm644 "tuxclocker.desktop" -t "$pkgdir/usr/share/applications/"

    install -Dm644 "tuxclockerd-dbus.service" "$pkgdir/usr/lib/systemd/system/tuxclockerd-dbus.service"

    install -Dm644 "tuxclockerd.service" "$pkgdir/usr/lib/systemd/system/tuxclockerd.service"

    install -Dm655 "tuxclocker.env" "$pkgdir/etc/"
}