# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

pkgname=libwacom-surface
pkgver=0.32
pkgrel=1
pkgdesc="Patched libwacom for Microsoft Surface devices"
arch=('x86_64')
url="https://github.com/geoffholden/libwacom"
license=('MIT')
depends=('glib2' 'systemd' 'libgudev')
makedepends=('git' 'libxml2')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF')
conflicts=('libwacom')
provides=("libwacom=${pkgver}")

source=(
    'mei-bus.patch'
    'surface-tablet-data.patch'
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.bz2"{,.sig}
)
sha256sums=(
    '1e5301bf93bf75352e559b89fbb84aca2d3edb5ec2951dd848546404f9d8fb7f'
    '32f7a27225af200430c2f3d5e497f9ee51bda5a4921647472879d62e890551ad'
    '6b9dab8bce0471b839c89d34a1b30839de2c24db03796fa8d572817830f85380'
    'SKIP'
)

prepare() {
    cd "libwacom-${pkgver}"
    patch -p0 -i "${srcdir}/mei-bus.patch"
    patch -Np0 -i "${srcdir}/surface-tablet-data.patch" || true
    # If the patched source has been cached this will fail to apply, ignore that with `|| true`
    # XXX: There must be a better option?
}

build() {
    cd "libwacom-${pkgver}"
    ./configure --prefix="/usr"
    make
}

check() {
    cd "libwacom-${pkgver}"
    make check
}

package() {
    cd "libwacom-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
    cd "tools"
    ./generate-udev-rules > "${pkgdir}/usr/lib/udev/rules.d/65-libwacom.rules"
}
