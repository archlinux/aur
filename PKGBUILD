# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgbase=fcitx5-lotus-git
pkgname=('fcitx5-lotus-git' 'fcitx5-lotus-openrc-git' 'fcitx5-lotus-runit-git')
pkgver=3.2.0.r731.g9825dc7
pkgrel=1
pkgdesc="Vietnamese input method for fcitx5"
arch=('x86_64')
url="https://github.com/LotusInputMethod/fcitx5-lotus"
license=('GPL-3.0-or-later')
makedepends=('cmake' 'go' 'extra-cmake-modules' 'gcc' 'git' 'libx11' 'python')
source=(
    'git+https://github.com/LotusInputMethod/fcitx5-lotus.git#branch=dev'
    'git+https://github.com/LotusInputMethod/bamboo-core.git'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/fcitx5-lotus"
    local version=$(grep "^project(fcitx5-lotus VERSION" CMakeLists.txt | \
    sed 's/.*VERSION \([0-9.]*\).*/\1/')
    
    local count=$(git rev-list --count HEAD)
    local hash=$(git rev-parse --short HEAD)
    
    echo "${version}.r${count}.g${hash}"
}

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

package_fcitx5-lotus-git() {
    provides=('fcitx5-lotus')
    conflicts=('fcitx5-lotus')
    depends=('acl' 'fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'libstdc++' 'libgcc' 'python-qtpy' 'python-dbus' 'libudev.so')
    optdepends=(
        'fcitx5-lotus-openrc-git: OpenRC init script for fcitx5-lotus'
        'fcitx5-lotus-runit-git: Runit service for fcitx5-lotus'
    )
    install='fcitx5-lotus.install'
    prepare_staging
    cp -a "$srcdir/staging/usr" "$pkgdir/"
}

package_fcitx5-lotus-openrc-git() {
    depends=('fcitx5-lotus-git')
    pkgdesc="OpenRC init script for fcitx5-lotus"
    provides=('fcitx5-lotus-openrc')
    conflicts=('fcitx5-lotus-openrc')
    prepare_staging
    install -d "$pkgdir/etc/init.d"
    install -m755 "$srcdir/staging/etc/init.d/fcitx5-lotus" "$pkgdir/etc/init.d/"
}

package_fcitx5-lotus-runit-git() {
    depends=('fcitx5-lotus-git')
    pkgdesc="Runit service for fcitx5-lotus"
    provides=('fcitx5-lotus-runit')
    conflicts=('fcitx5-lotus-runit')
    prepare_staging
    install -d "$pkgdir/etc/runit/sv/fcitx5-lotus"
    install -m755 "$srcdir/staging/etc/runit/sv/fcitx5-lotus/run" "$pkgdir/etc/runit/sv/fcitx5-lotus/"
}
