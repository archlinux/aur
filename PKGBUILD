# Maintainer: Goldbro233 <bowensun_06@outlook.com>
# SPDX-License-Identifier: 0BSD

pkgname=picoforge-bin
pkgver=0.9.0
pkgrel=3
pkgdesc='Desktop tool for configuring and managing Pico FIDO security keys (prebuilt binary)'
arch=('x86_64')
url='https://github.com/librekeys/picoforge'
# The SPDX header and local LICENSE cover packaging; this is the upstream app license.
license=('AGPL-3.0-only')
# Namcap cannot see these runtime requirements from the main ELF's DT_NEEDED:
# ccid supplies the PC/SC driver, while Wayland and Vulkan are loaded with dlopen().
# Keep these dependencies so PC/SC access and the supported GUI backends work by default.
depends=('glibc' 'libgcc' 'pcsclite' 'ccid' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
         'util-linux-libs' 'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme')
makedepends=('7zip')
optdepends=('vulkan-driver: Vulkan renderer for the graphical interface')
provides=("picoforge=$pkgver")
conflicts=('picoforge' 'picoforge-git')
options=('!strip' '!debug')
install=picoforge-bin.install

_appimage="picoforge_${pkgver}_glibc-2.28_x86-64.AppImage"
source=("$_appimage::$url/releases/download/v$pkgver/$_appimage"
        "picoforge-LICENSE::https://raw.githubusercontent.com/librekeys/picoforge/v$pkgver/LICENSE")
noextract=("$_appimage")
sha256sums=('81c12f129cf0e55bc932f94db9781204a25ab919d94e985ed16027014f66bff5'
            'd8a6cc31abc16b6748c7a21f21611f5a1ec33f67d22ca23d7da1c19b95496bee')

prepare() {
    # Extract once during packaging; installed programs do not need FUSE.
    7z x -y -oAppDir "$_appimage"
    # The AppImage's old libxkbcommon cannot parse newer system Compose keysyms
    # such as dead_hamza. Use Arch's keyboard libraries alongside its Compose data.
    # Remove both bundled libraries to avoid mixing versions; the dynamic loader
    # falls back to the system libraries when they are absent from $ORIGIN/../lib.
    rm -f AppDir/usr/lib/libxkbcommon.so* AppDir/usr/lib/libxkbcommon-x11.so*
}

package() {
    # Arch permits large self-contained applications under /opt/<pkgname>.
    # Namcap flags ELF files below /opt, but this package preserves the upstream
    # AppImage's relative $ORIGIN/../lib layout for its private libraries.
    # Keep the remaining upstream libraries: Namcap checks each ELF from /tmp,
    # losing this relative layout. Unused-link warnings, including glibc
    # compatibility libraries, alone do not prove a bundled file can be removed.
    install -dm755 "$pkgdir/opt/picoforge/usr"
    cp -a AppDir/usr/bin AppDir/usr/lib "$pkgdir/opt/picoforge/usr/"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/picoforge/usr/bin/picoforge "$pkgdir/usr/bin/picoforge"

    install -Dm644 AppDir/usr/share/applications/in.suyogtandel.picoforge.desktop \
        "$pkgdir/usr/share/applications/in.suyogtandel.picoforge.desktop"
    install -Dm644 AppDir/usr/share/icons/hicolor/scalable/apps/in.suyogtandel.picoforge.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/in.suyogtandel.picoforge.svg"
    install -Dm644 AppDir/usr/share/metainfo/in.suyogtandel.picoforge.metainfo.xml \
        "$pkgdir/usr/share/metainfo/in.suyogtandel.picoforge.metainfo.xml"
    install -Dm644 picoforge-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
