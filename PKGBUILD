# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.9.0
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
sha256sums=('6f678156797becc4f1537a19aadcc48ed7a54e1ff3cbf591d1233f8a2d82e242'
            'SKIP'
            '7db8188ca1afd8655fd79b606428e403baefdec13484d4807ace4b992bed6807'
            '5ec7cf7f5e0a4e0278563cb05e6a446c3a26ca82cd2e2a6c129d5d8cc35828e5'
            'f14740304f43c336bdf7e1d78991717b504331f48c577d2c512ae276981c8f1e'
            '649bfef25ae14d9cc44818ad466f1bcfab56b890acfbdbddd5f8a546cbfecebb'
            'd54044d69ee002d891e554149d350462618329477d0e1900528c34973bcb315e'
            '634e552757df946f997f0f682802828f6540b5eff9eb60965714e4c9a8c3a3f5'
            'b3d7197f92d7e02e73b2f06a0b7770164f5052d38afa36843099468dd5eafafa'
            'bd8ae40ec5e3214fab8a92861a1e07ba92c89aebd2ecfbe59f2649a92150d1fb'
            '9dee7840ac3231adbd5c23c57a09a289e3cc3fe4a24fcb2c56e78ab2c86f86cd'
            '101e8ba35a6493359667a3c119e6f792bde16e77c04642127e7dd81bc2d56d41'
            '0b38005851833200cf31a4bc99a4bac40a560db14bf32f4c4ebcfe77f635e06b'
            'f1236857310a8362abb8fc55e67a7013b61f03d593a89acf6ceae86cefc4ec37'
            '5da915726aba84add16f5c509dc1be343db66f70a294b411759353b0ffaef0c2'
            '8bb8c1aab143185a05b91cacaf600e147fcee55fc1abe67af0e1d6fed0b6e99f'
            'bd6c8a319845ec161106b85859ab42b22ded1f6515676449a00bb3cc776acb43'
            'bc4398d29b3a49e617cb7d9acd7a045c2a8c248c2065c96fd38ecc59e1a6d86f')

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
