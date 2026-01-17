# Maintainer: RocketDev <ma2014119@outlook.com>

_pkgbase='xdia'
pkgname=('python-pyxdia')
pkgver=0.1.0
pkgrel=1
pkgdesc='Utility to extract useful program info from a PDB file in an easily parsed format.'
arch=('x86_64')
url="https://github.com/mborgerson/$_pkgbase"
license=('MIT AND LGPL-2.1-only')
depends=(
    'glibc'
    'icu'
    'python'
)
makedepends=(
    'cmake'
    'python-build'
    'python-setuptools'
    'python-installer'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
)
source=(
    "$_pkgbase.tar.gz::$url/archive/v$pkgver.tar.gz"
    "$_pkgbase.zip::$url/releases/download/v$pkgver/$_pkgbase.zip"
    'fix-cmake.patch'
    'fix-pyproject.patch'
)
b2sums=('41741a2946b16dad9899f59ccf4b4b23eda90f325771ad0a5257480c3aa275d70b46fcad5d5ec6b3b09543259aae78006a241186293805e66bf33134c34bdd3e'
        '51cb11eec07b592dee31340c2e68aec7e04df467d1f0037163af8a6083031b75d8682a1216c1989eda7700d808af78dab03ad4882a4fe2e2df40fe953835ffaa'
        '1f276e302b748d6964f9664b9098a2b7857196b364059197cfbe4d26849a0ac72eb2228d7111a1e27febacb34e5ee9a77c5379d070b2937e6852d036c84833f1'
        '5ee60a95721982fb6439fd7ef95d4916b1571b1cc8a9b384d3a383236c7377105e2177e4d00038de0fbe808b501088370b62bdd4f225a15887f5b234ca335cfa')


prepare() {
    cd "$_pkgbase-$pkgver"
    patch -p1 -i ../fix-cmake.patch
    patch -p1 -i ../fix-pyproject.patch
    echo "Moving $_pkgbase.exe"
    mkdir -p pyxdia/pyxdia/bin
    mv ../$_pkgbase.exe pyxdia/pyxdia/bin
}

build() {
    # binary part
    local cmake_opts=(
        -B build
        -S "$_pkgbase-$pkgver"
        -DCMAKE_BUILD_TYPE=None
        -Wno-dev
    )
    export LDFLAGS="$LDFLAGS -Wl,-z,common-page-size=65536,-z,max-page-size=65536" # from CMakeLists
    cmake "${cmake_opts[@]}"
    make -C build

    # python part
    mv build/src/xdialdr "$_pkgbase-$pkgver/pyxdia/pyxdia/bin"
    cd "$_pkgbase-$pkgver/pyxdia"
    mv ../lib/msdia140.dll pyxdia/bin
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgbase-$pkgver/pyxdia/tests"
    python -m venv --system-site-packages .venv
    .venv/bin/python -m installer ../dist/*.whl
    PDB_TEST_FILES="$srcdir/$_pkgbase-$pkgver/tests" .venv/bin/python -m pytest .
}

package() {
    cd "$_pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" pyxdia/dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" pyxdia/LICENSE.txt
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" src/xdia/xdia.LICENSE.txt
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" src/xdia-loader/xdialdr.LICENSE.txt
}
