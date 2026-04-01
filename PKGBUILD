# Maintainer: Dunky <braxtinmoss13@gmail.com>

pkgname=rofi-file-browser-extended
pkgver=1.3.1
pkgrel=1
pkgdesc="Use rofi to quickly open files"
arch=('x86_64')
url='https://github.com/marvinkreis/rofi-file-browser-extended'
license=('MIT')
depends=('rofi')
makedepends=('cmake' 'glib2' 'cairo')
provides=('rofi-file-browser-extended')
conflicts=('rofi-file-browser-extended-git')
replaces=('rofi-file_browser-extended')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/marvinkreis/rofi-file-browser-extended/archive/refs/tags/$pkgver.tar.gz"
    "fix-icon-fn-ptr.patch::https://github.com/marvinkreis/rofi-file-browser-extended/pull/49.patch"
)
sha256sums=(
    '9e010e671533dd747e6e7ae4ed290b6e2829e758ca073381fa8a8fe53e004660'
    '71ed730523afbc16cc5b7f47098100596591f50b3118b0f61e315dca45cf9ea5'
)

prepare() {
    cd "$pkgname-$pkgver"
    # Fix incompatible function pointer types (upstream PR #49, unmerged)
    patch -p1 < ../fix-icon-fn-ptr.patch
}

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$pkgname-$pkgver/README.md" \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
