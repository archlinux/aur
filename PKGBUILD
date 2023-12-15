pkgname=libfprint-fpcmoh-git
_pkgname=libfprint
pkgrel=1
pkgver=1.94.6
pkgdesc="libfprint with proprietary FPC match on host device 10a5:9800 driver"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(libgusb pixman nss systemd-libs)
makedepends=(git meson gtk-doc gobject-introspection systemd patchelf)
provides=("libfprint=$pkgver" libfprint-2.so libfpcbep.so)
conflicts=(libfprint)
groups=(fprint)
source=(
    "git+https://gitlab.freedesktop.org/libfprint/libfprint.git#tag=v1.94.6"
    "fpcbep.zip::https://download.lenovo.com/pccbbs/mobiles/r1slm01w.zip"
    "https://gitlab.freedesktop.org/libfprint/libfprint/-/merge_requests/396.patch")
sha256sums=(
    'SKIP'
    'c7290f2a70d48f7bdd09bee985534d3511ec00d091887b07f81cf1e08f74c145'
    'SKIP')

#pkgver() {
#    cd $_pkgname
#    git describe --tags | sed 's/^V_\|^v//;s/_/./g;s/-/.r/;s/-/./'
#}

prepare() {
    libfpcbep_path=$(find . -name 'libfpcbep.so')
    cp -f $libfpcbep_path $_pkgname
    cd $_pkgname
    git apply $srcdir/396.patch
    # patch meson.build
    # use '+' as sed delimiter 
    sed -ibak "s+find_library[(]'fpcbep', required: true[)]+find_library('fpcbep', required: true, dirs: \'$(pwd)\')+g" ./meson.build
}

# We do not perform any checks here as the python scripts can be buggy

build() {
    arch-meson $_pkgname build
    meson compile -C build
}


package() {
    DESTDIR="$pkgdir" meson install -C build
    install -D $srcdir/$_pkgname/libfpcbep.so $pkgdir/usr/lib/libfpcbep.so
    install -Dm644 $srcdir/FPC_driver_linux_libfprint/install_libfprint/lib/udev/rules.d/60-libfprint-2-device-fpc.rules \
        $pkgdir/usr/lib/udev/rules.d/60-libfprint-2-device-fpc.rules
    cd $pkgdir/usr/lib
    libfpcbep_needed=$(ldd libfprint-2.so | grep libfpcbep | sed 's/[(].*[)]//g')
    patchelf --replace-needed $libfpcbep_needed libfpcbep.so libfprint-2.so
}
