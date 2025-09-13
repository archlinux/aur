# Maintainer: Ali Khaleghi <apps.khaleghi@gmail.com>
pkgname=sysmedic-ui
pkgver=0.0.2
pkgrel=1
pkgdesc="Cross-platform desktop application for monitoring multiple Linux servers running SysMedic daemon"
arch=('x86_64')
url="https://github.com/ahur-system/sysmedic-desktop-client"
license=('MIT')
depends=('gtk3' 'glib2' 'libgee' 'json-glib' 'libsoup')
makedepends=('meson' 'ninja' 'vala' 'git')
optdepends=(
    'systemd: for daemon integration'
    'openssh: for SSH server connections'
    'openssl: for secure connections'
)
conflicts=('sysmedic-ui-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ahur-system/sysmedic-desktop-client/archive/v${pkgver}.tar.gz")
sha256sums=('477a0fa78df3c7c2c01b717ea91746d430a26f0ac2e8c4ed9a27cb5366447d9f')

prepare() {
    cd "sysmedic-desktop-client-${pkgver}"
}

build() {
    cd "sysmedic-desktop-client-${pkgver}"

    arch-meson build \
        --prefix=/usr \
        --buildtype=release \
        --wrap-mode=nofallback

    meson compile -C build
}

check() {
    cd "sysmedic-desktop-client-${pkgver}"

    # Run any tests if available
    # meson test -C build --print-errorlogs
}

package() {
    cd "sysmedic-desktop-client-${pkgver}"

    meson install -C build --destdir="${pkgdir}"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
