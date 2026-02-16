# Maintainer: Anthony Habibe <bb@hab.rip>
pkgname=bb-auth-git
pkgver=r43.fc40397
pkgrel=1
pkgdesc="Unified polkit, keyring, and pinentry authentication daemon"
arch=('x86_64')
url="https://github.com/anthonyhab/bb-auth"
license=('BSD-3-Clause')
depends=(
    'qt6-base'
    'polkit-qt6'
    'polkit'
    'gcr-4'
    'json-glib'
)
makedepends=(
    'git'
    'cmake'
)
optdepends=(
    'gnome-keyring: GNOME Keyring integration'
    'fprintd: Fingerprint authentication support'
    'libfido2: FIDO2 device support'
)
provides=('bb-auth')
conflicts=('bb-auth')
replaces=('noctalia-auth-git' 'noctalia-polkit-git' 'noctalia-unofficial-auth-agent-git')
source=("${pkgname}::git+https://github.com/anthonyhab/bb-auth.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
    cd "$pkgname"
    ctest --test-dir build --output-on-failure
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
