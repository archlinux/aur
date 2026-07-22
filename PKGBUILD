# Maintainer: Imam Wahyu Widodo <https://github.com/hajilok>
pkgname=clevo-indicator-dual
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux dual-fan control (CPU + GPU) for Clevo-based laptops and Axioo rebrands. Fork of clevo-indicator that drives BOTH fans instead of only the CPU fan."
arch=('x86_64')
url="https://github.com/hajilok/clevo-axioo-dual-fan-linux"
license=('GPL2')
depends=(
    'glib2'
    'gtk3'
    'libayatana-appindicator'
)
makedepends=(
    'base-devel'
    'git'
    'pkgconf'
)
optdepends=(
    'breeze-icons: provides the tray icons (temperature-warm/normal/cold)'
)
install=clevo-indicator-dual.install
source=(
    "${pkgname}::git+${url}.git#tag=v${pkgver}"
    "https://raw.githubusercontent.com/hajilok/clevo-axioo-dual-fan-linux/v${pkgver}/arch-build-fix.patch"
)
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "${pkgname}"
    # Apply fix for Ayatana API + Breeze icon names — see patch header for details
    patch -p1 -i "${srcdir}/arch-build-fix.patch"
}

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    # Install to /usr/bin (Arch convention; upstream Makefile hard-codes /usr/local/bin
    # which is NOT in $PATH on a default Arch install). Set setuid root so the
    # binary can access EC IO ports; the launcher detects root and self-escalates
    # the GUI portion to the desktop user.
    install -Dm4750 -g wheel -t "${pkgdir}/usr/bin/" "bin/clevo-indicator-dual"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}