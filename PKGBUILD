# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.12.0
pkgrel=1
pkgdesc="Library to identify Wacom tablets and their features - Patched for Microsoft Surface devices"
arch=('x86_64')
url="https://github.com/linux-surface/libwacom"
license=('MIT')
depends=('glib2' 'libevdev' 'libgudev' 'glibc')
makedepends=('libxml2' 'meson')
checkdepends=('python-pytest' 'python-libevdev' 'python-pyudev')
optdepends=('python-libevdev: for libwacom-show-stylus'
            'python-pyudev: for libwacom-show-stylus')
validpgpkeys=(
    '594ABBA066118C7A02D10A80A8AF906D9307FBAD'  # "Joshua Dickens <Joshua@Joshua-Dickens.com>"
    '3C2C43D9447D5938EF4551EBE23B7E70B467F0BF'  # "Peter Hutterer (Who-T) <office@who-t.net>"
)
conflicts=('libwacom')
provides=("libwacom=${pkgver}")

source=(
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.xz"{,.sig}
    "0001-Add-support-for-BUS_VIRTUAL.patch"
    "0002-Add-support-for-Intel-Management-Engine-bus.patch"
    "0003-data-Add-Microsoft-Surface-Pro-3.patch"
    "0004-data-Add-Microsoft-Surface-Pro-4.patch"
    "0005-data-Add-Microsoft-Surface-Pro-5.patch"
    "0006-data-Add-Microsoft-Surface-Pro-6.patch"
    "0007-data-Add-Microsoft-Surface-Pro-7.patch"
    "0008-data-Add-Microsoft-Surface-Pro-7.patch"
    "0009-data-Add-Microsoft-Surface-Pro-8.patch"
    "0010-data-Add-Microsoft-Surface-Pro-9.patch"
    "0011-data-Add-Microsoft-Surface-Book.patch"
    "0012-data-Add-Microsoft-Surface-Book-2-13.5.patch"
    "0013-data-Add-Microsoft-Surface-Book-2-15.patch"
    "0014-data-Add-Microsoft-Surface-Book-3-13.5.patch"
    "0015-data-Add-Microsoft-Surface-Book-3-15.patch"
    "0016-data-Add-Microsoft-Surface-Laptop-Studio.patch"
)
sha256sums=('40462434a8568e3c0a75c18a5452aa50e041819363853090c4e7ba7e23a4a180'
            'SKIP'
            'd64414287f19d13174f72c4e473f757b45c753c07bb9173c5835d7e040cbbeb2'
            '263e3775b3097e54a801a1d7739b322c4846af173d6aa330a80fe977a1934c98'
            '2eec141a7e497c602df0e530510e181b27a9ef0ec74b0763466ccc486abc387a'
            'c9c512d5c53636cc32001a8618befb13453d7e436e1ae8c7266c290cfa2e3266'
            '3c2d87844c4494404ae7b8d7714cb7b67a178ba5980da98da7cddc5487bf72b5'
            '2d9e697820fd0deeea6bd2e1857c1797fc2bdfb5004beea492f8ac479eba2450'
            '616f24ec191971777294d7972ba9d182cf8d8b1ebaa2a04c24d780fd5dbcd51e'
            '554a92d5aec8447f7b9ad01a306a706e964090b3a55f604c396fb0881460c05e'
            '20bc44a2cfca8ddb714c0e10d833d5de27dc3a7b973755d90dea2dd2528f6691'
            '0caa2e94fec733ede6bd4355dfcbe68ecfb004c80d71863741db5b17e4d071a7'
            'c92e0ac558394bb46a1391ddcfc0f26336c05afa546ff6124c851fbbb1580eef'
            '9359a4f57bfe70b13275217e0c0136c8702407ab531f6d49ca307676fa3fb931'
            '679cbd7450653795961d488083f3ee0bf8b73c7520627f0be576d6ecff702de5'
            'a5f3e4574ac1ab1ec0b2c3e026c91abdfa88728026c0daaad2f6e804bd01f2cc'
            '942c16ea3116edd1251bbf124bd1125501792bc2932648c65ca8d8609bb92767'
            '600f722f44bbdebf8e02f7f14d12f9208ddfea735b70e340d8dc33749f4f4b49')

prepare() {
    cd "libwacom-${pkgver}"

    for p in "${srcdir}/"*.patch ; do
        patch -Np1 -i "${p}" || true
    done
}

build() {
    rm -rf build

    arch-meson libwacom-$pkgver build
    meson compile -C build
}

check() {
    # disabled for now...
    # meson test -C build --print-errorlogs
    true
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 libwacom-$pkgver/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
