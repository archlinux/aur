# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='loco-3d'
_pkgname='crocoddyl'
pkgname=("$_pkgname" "$_pkgname-docs")
pkgver=3.2.1
pkgrel=1
pkgdesc="optimal control library for robot control under contact sequence"
arch=('i686' 'x86_64')
url="https://github.com/$_org/$_pkgname"
license=('BSD-2-Clause')
depends=('pinocchio' 'eigenpy' 'example-robot-data' 'python-scipy' 'coin-or-ipopt')
optdepends=('doxygen')
makedepends=('cmake' 'eigen' 'jrl-cmakemodules')
checkdepends=('jupyter-nbformat' 'jupyter-nbconvert')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig} 0001-fix-Eigen5-build-issue.patch)
sha256sums=('c02fdd4549d035dbc734f30438f91b0ec0e86ab81853871c7ee3f97da9dce19a'
            'SKIP'
            '7af0614e2d144f0c775bc723601bb9af2b4d14248cb6b375fc95406393afb753')
validpgpkeys=(
    '9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28'  # https://github.com/nim65s.gpg
    'F182CC432A4752C7A3E4FE02001EB2069D785C81'  # https://github.com/proyan.gpg
)

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/0001-fix-Eigen5-build-issue.patch"
}

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build "build-$pkgver" -j 2
}

# TODO
# The following tests FAILED:
# 	 9 - test_constraints (Failed)
# 	16 - test_contact_costs (Failed)
# 	21 - test_diff_actions (Failed)
# 	22 - test_problem (Failed)
# 	26 - test_boxqp (Failed)
# 	38 - notebook-02_optimizing_a_cartpole_swingup (Failed)
# check() {
#     cmake --build "build-$pkgver" -t test
# }

package_crocoddyl() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/share/doc
    sed -i '/Boost COMPONENTS/s/python3//' "$pkgdir/usr/lib/cmake/crocoddyl/crocoddylConfig.cmake"
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_crocoddyl-docs() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    rm -rf $pkgdir/usr/{lib,include,share/ament_index,"share/$_pkgname"}
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
