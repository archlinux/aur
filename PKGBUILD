# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgbase=fcitx5-lotus
pkgname=('fcitx5-lotus' 'fcitx5-lotus-openrc' 'fcitx5-lotus-runit')
pkgver=3.5.1
pkgrel=1
pkgdesc="Vietnamese input method for fcitx5"
arch=('x86_64')
url="https://github.com/LotusInputMethod/fcitx5-lotus"
license=('GPL-3.0-or-later')
makedepends=('cmake' 'go' 'extra-cmake-modules' 'gcc' 'git' 'libx11' 'python')
source=(
    "git+https://github.com/LotusInputMethod/fcitx5-lotus.git#tag=v$pkgver"
    'git+https://github.com/LotusInputMethod/bamboo-core.git'
)
sha256sums=(
    '7e6a9ba7aa196a5cbbc812fb09c97f98262cfa8797f8134d320572330320196b'
    'SKIP'
)

prepare() {
    cd "$srcdir/fcitx5-lotus"
    git submodule init
    git config submodule.bamboo/bamboo-core.url "$srcdir"/bamboo-core
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/fcitx5-lotus"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib . \
    -DINSTALL_OPENRC=ON \
    -DINSTALL_RUNIT=ON \
    -DRUNIT_SV_DIR=/etc/runit/sv
    make
}

prepare_staging() {
    if [ ! -d "$srcdir/staging" ]; then
        cd "$srcdir/fcitx5-lotus"
        make install DESTDIR="$srcdir/staging"
    fi
}

package_fcitx5-lotus() {
    provides=('fcitx5-lotus')
    conflicts=('fcitx5-lotus')
    depends=('acl' 'fcitx5' 'fcitx5-configtool' 'fcitx5-gtk' 'fcitx5-qt' 'libinput' 'hicolor-icon-theme' 'glibc' 'libstdc++' 'libgcc' 'libudev.so' 'python-qtpy' 'python-dbus')
    optdepends=(
        'fcitx5-lotus-openrc: OpenRC init script for fcitx5-lotus'
        'fcitx5-lotus-runit: Runit service for fcitx5-lotus'
    )
    install='fcitx5-lotus.install'
    prepare_staging
    cp -a "$srcdir/staging/usr" "$pkgdir/"
}

package_fcitx5-lotus-openrc() {
    depends=('fcitx5-lotus')
    pkgdesc="OpenRC init script for fcitx5-lotus"
    provides=('fcitx5-lotus-openrc')
    conflicts=('fcitx5-lotus-openrc')
    prepare_staging
    install -d "$pkgdir/etc/init.d"
    install -m755 "$srcdir/staging/etc/init.d/fcitx5-lotus" "$pkgdir/etc/init.d/"
}

package_fcitx5-lotus-runit() {
    depends=('fcitx5-lotus')
    pkgdesc="Runit service for fcitx5-lotus"
    provides=('fcitx5-lotus-runit')
    conflicts=('fcitx5-lotus-runit')
    prepare_staging
    install -d "$pkgdir/etc/runit/sv/fcitx5-lotus"
    install -m755 "$srcdir/staging/etc/runit/sv/fcitx5-lotus/run" "$pkgdir/etc/runit/sv/fcitx5-lotus/"
}
