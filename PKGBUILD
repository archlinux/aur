# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

_pkgname=EonTimer
pkgname=eontimer-git
pkgver=r55.d53e42a
pkgrel=1
pkgdesc='A Pokemon RNG timer'
arch=(x86_64)
url='https://github.com/dylmeadows/EonTimer'
license=('MIT')
depends=(
    'qt5-base'
    'sfml'
)
makedepends=(
    'git'
    'python'
    'python-qtsass'
)
conflicts=('eontimer')
provides=('eontimer')

source=("$pkgname-$pkgver::git+https://github.com/dylmeadows/EonTimer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname-$pkgver"
  # Technically, version 3.0 is in development at the time of writing, but the
  # earlier 2.*-tags are not reachable anymore.  Since `git describe` won't
  # work, we fall back to counting revisions.  This is forward compatible with
  # future versions `v3.*.*`.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $pkgname-$pkgver
    python3 -m qtsass -o resources/styles resources/styles
}

build() {
    cmake \
        -B build \
        -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_PREFIX=$(kf5-config --prefix) \
        -Wno-dev

    make -C build
}

package() {
    install -Dm755 build/EonTimer "${pkgdir}/usr/bin/eontimer"
    install -Dm644 "$pkgname-$pkgver/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
