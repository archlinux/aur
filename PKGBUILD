# Maintainer: Camille 'DrasLorus' Monière <draslorus@draslorus.fr>

pkgname=libmatio-cpp
pkgver=0.2.1
pkgrel=2
pkgdesc="A C++ wrapper of the matio library, with memory ownership handling."
arch=('x86_64')
url="https://github.com/ami-iit/matio-cpp"
license=('BSD')
groups=()
depends=('libmatio')
makedepends=('cmake')
checkdepends=('catch2>3.0.0')
provides=("$pkgname" "visit_struct")
conflicts=("$pkgname-git")
replaces=()
backup=()
options=()
install=
source=("libmatio-cpp-${pkgver}.tar.gz::https://github.com/ami-iit/matio-cpp/archive/v${pkgver}.tar.gz"
    "visit_struct.zip::https://github.com/ami-iit/visit_struct/archive/969fc563477906432a9fcc91addf2c1e13c56f4c.zip")
noextract=()
sha256sums=('a9144816e79f517b52593d2d934d6e727ff136495fee3b37d3eb6ebaf892b355'
            '3df656403aa1e2969a4c7b8606002014adcfb21123cca209e58c18f3e35d3422')

prepare() {
    cd "$srcdir"
    mv matio-cpp-"$pkgver" "$pkgname-$pkgver"
    mv visit_struct-969fc563477906432a9fcc91addf2c1e13c56f4c visit_struct
}

# Needed since Arch currently ship catch2 v2, catch2 v3 is only provided by catch2-git on the AUR
_enable_check() {
    _catch2_ver=$(pacman -Q catch2 | cut -d ' ' -f 2)
    printf -v versions "%s\n%s" "$_catch2_ver" "3.0.0"
    if [[ $versions = "$(sort -V <<< "$versions")" ]]; then
        echo OFF
    else
        echo ON
    fi
}

build() {
    cd "$srcdir/visit_struct"
    cmake -B build -S . -DCMAKE_BUILD_TYPE=None \
        -Wno-dev \
        -DCMAKE_INSTALL_PREFIX="$srcdir/.local/usr"
    cmake --build build -j
    cmake --build build -t install 
    
    cd "$srcdir/$pkgname-$pkgver"

    cmake -B build -S . -DCMAKE_BUILD_TYPE=None \
                -Wno-dev \
                -DCMAKE_GENERATOR="Unix Makefiles" \
                -DCMAKE_PREFIX_PATH="$srcdir/.local/usr" \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DBUILD_TESTING=$(_enable_check)
    cmake --build build -j
}

check() {
    cd "$pkgname-$pkgver/build"
    ctest
}

package() {
    cd "$srcdir/visit_struct/build"
    cmake .. -DCMAKE_INSTALL_PREFIX="/usr"
    make && make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/visit_struct/LICENSE" "$pkgdir/usr/share/licenses/visit_struct/LICENSE"
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
