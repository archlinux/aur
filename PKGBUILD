# Maintainer: Goldbro233 <bowensun_06@outlook.com>

pkgname=picoforge-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Desktop tool for configuring and managing Pico FIDO security keys (prebuilt binary)'
arch=('x86_64')
url='https://github.com/librekeys/picoforge'
license=('AGPL-3.0-only')
# PC/SC and GPUI's dynamically loaded Wayland/Vulkan backends use host libraries.
depends=('glibc' 'libgcc' 'pcsclite' 'ccid' 'libxcb' 'util-linux-libs'
         'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme')
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
}

package() {
    # Preserve $ORIGIN/../lib so the upstream binary finds its bundled libraries.
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
