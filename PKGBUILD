# Maintainer: sTiKyt <stikyt@proton.me>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=KDiskMark
pkgname=kdiskmark-git
pkgver=3.3.0.r2.ge78d3c7
pkgrel=1
pkgdesc="HDD and SSD benchmark tool with a very friendly graphical user interface"
arch=('x86_64')
url="https://github.com/JonMagon/KDiskMark"
license=('GPL-3.0-or-later')
depends=('fio' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'polkit-qt6' 'qt6-base')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'qt6-tools')
provides=('kdiskmark')
conflicts=('kdiskmark')
source=(
    "$_pkgname::git+$url.git"
    "singleapplication::git+https://github.com/itay-grudev/SingleApplication.git"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --exclude '*-standalone' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    git submodule init
    git config submodule."src/singleapplication".url "$srcdir/singleapplication"
    git -c protocol.file.allow=always submodule update
}

build() {
    cmake -B build -S "$_pkgname" \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_LIBEXECDIR='lib' \
        -Wno-dev
    make -C build
}

package() {
    make DESTDIR="$pkgdir" -C build install

    # License
    install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
