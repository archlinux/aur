# Maintainer: BinaryInk <hqxjlmnxs at mozmail dot com>
# Maintainer: Lucky.Luke <luckyluke.arch at proton dot me>
# Contributor: Maximilian Luz <luzmaximilian at gmail dot com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.18.0
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
sha256sums=('7dbb9ab37df9df47ae2fdbb644916c986728291749bcd5ad8bcaa26f1e15f002'
            'SKIP'
            'f39b7c90c0d842fee9440a9946e9da8fd31a29ac516a271b252599dfaddb1bf1'
            'ce8a9be4f6f85c40e08b8aeeb90565883f27f3826d769a4a5d8a48fbe3f8a294'
            '7ff7ae7bd4338daf5df4034f650f10260800909a3e5bb571ea5b5c1f93340aee'
            '2d211e85f367d24b28a34dab2d670e267d1b3bdf7d9f21e4feda94dceee52284'
            'ea27734a08e11e18e73f891305d61acbec12c194aef65993f6b589fef162dbc4'
            'c6e65eb87d4a70ead5ee610d3582e5303aa11f8be0e7eab23d6625f4ed945de8'
            '144d34d4fb73f208c7a4104eb8db46bf93b3947bb52e1eec3df78f7b9cfa485f'
            '339fe7961ceca74ecd29965e3864573c2a8e9a02f06d415a6be3f8fbca82aa85'
            '960ca7768676f6a6c3adca0c8aad822ab748099b6743fe079a268a6e6aab394a'
            '52ef275e18dd37b3948102362973748d1256d908cdca0d45d611efb59d86ac00'
            'bf8d8b22e3e7c2c62b36940770b94396c739f948978f7595e9c4dc2597ced852'
            '712c5f8b4abe5e4f70c29634a78ed771063072d60737b56a5d110d428c182d2a'
            '46f80957c5852e9cb515d4a6ac0ab1af3e464558f0339f1704a82b470388b86a'
            'e95a670143b3c2948740ab477003b4330df9e327818218cef096ad835d6aaca9'
            'dbc960044fec3b5b225af093cfc69e1d096bce08727033547c8e86c9a36d6be9'
            '3f90d745ea11aae7d187ba0c998229322666c41978857dcd82fe174e08b123e8')

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
