# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Contributor: Astro Benzene <universebenzene at sina dot com>
# Contributor: seiuneko <chfsefefgesfen foxmail>
# Retain the 2019 release and compile its private FreeType compatibility fix.
pkgname=wps-office-2019-freetype
_pkgname=wps-office
pkgver=11.1.0.11723
pkgrel=1
_ftver=2.13.3
pkgdesc='WPS Office 2019 English edition with a private FreeType compatibility fix'
arch=('x86_64')
url='https://www.wps.com/office/linux/'
license=('LicenseRef-WPS-EULA' 'FTL OR GPL-2.0-or-later')
depends=('fontconfig' 'libxrender' 'desktop-file-utils' 'shared-mime-info'
         'xdg-utils' 'glu' 'sdl2-compat' 'libxml2-legacy' 'libpulse'
         'hicolor-icon-theme' 'libxss' 'sqlite' 'libtool' 'libxslt'
         'libjpeg-turbo' 'libtiff5' 'glibc' 'gcc-libs' 'zlib' 'bzip2'
         'libpng' 'harfbuzz' 'brotli' 'libxrandr' 'libxkbcommon' 'qrencode'
         'nspr' 'libxv' 'libxdamage' 'libxkbcommon-x11' 'libice' 'nss'
         'gtk3' 'libsm' 'libxcomposite' 'libxtst' 'qt5-base' 'gdk-pixbuf2'
         'at-spi2-core' 'libcups')
makedepends=('cmake' 'ninja' 'patchelf')
optdepends=('ttf-wps-fonts: optional symbol and equation fonts; install separately'
            'cups: printing support'
            'pango: complex text layout support')
provides=("wps-office=$pkgver")
conflicts=('wps-office' 'kingsoft-office' 'wps-office-2019' 'freetype2-wps')
options=('!strip' '!debug' '!lto' '!emptydirs')
source=("https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/${pkgver##*.}/wps-office_${pkgver}.XA_amd64.deb"
        "https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${_ftver}.tar.xz"
        '0000-WPS-compatiblity.patch'
        '0001-Enable-table-validation-modules.patch'
        '0002-Enable-subpixel-rendering.patch'
        '0003-Enable-long-PCF-family-names.patch'
        'fix-wps-python-parse.patch')
noextract=("wps-office_${pkgver}.XA_amd64.deb")
sha256sums=('fe6326210f69d94efdbf2728914d293036be391b93a614f58cd0e1ff1d4923b3'
            '0550350666d427c74daeb85d5ac7bb353acba5f76956395995311a9c6f063289'
            '14a55a5dd406239ff2ef733074d348e0f7977c34e7a4b73012b7047818e3c003'
            'd279a9d4b2c146722dbc03f9a33009846efe8bbbe3ada52beb4a1aa4d4dfaa38'
            '8d3fb537411674a23bcc46af3aa0c3d284fd05d3b8c93b5ad4da95116960dd2c'
            'abb8685a9cd0d8b525e3c0e8986dbec0340059b65683b62f06c95485211dcda6'
            'a1a16615260e516d2be82d9d2d8a797cef1a419d0c56513ffb6e5f0497f2d643')

prepare() {
    mkdir -p "$srcdir/wps"
    bsdtar -xOf "$srcdir/wps-office_${pkgver}.XA_amd64.deb" data.tar.xz |
        bsdtar -xpf - -C "$srcdir/wps"
    cd "$srcdir/wps"
    patch -Np1 -i "$srcdir/fix-wps-python-parse.patch"
    sed -i 's|/opt/kingsoft/wps-office|/usr/lib|g' usr/bin/*

    cd "$srcdir/freetype-$_ftver"
    for _patch in 0000-WPS-compatiblity.patch \
                  0001-Enable-table-validation-modules.patch \
                  0002-Enable-subpixel-rendering.patch \
                  0003-Enable-long-PCF-family-names.patch; do
        patch -Np1 -i "$srcdir/$_patch"
    done
}

build() {
    cmake -S "$srcdir/freetype-$_ftver" -B "$srcdir/freetype-build" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON \
        -DFT_REQUIRE_ZLIB=ON -DFT_REQUIRE_BZIP2=ON \
        -DFT_REQUIRE_PNG=ON -DFT_REQUIRE_HARFBUZZ=ON \
        -DFT_REQUIRE_BROTLI=ON
    cmake --build "$srcdir/freetype-build" --parallel 8
}

check() {
    test -f "$srcdir/freetype-build/libfreetype.so.6"
    readelf -d "$srcdir/freetype-build/libfreetype.so.6" |
        grep -q 'Library soname: \[libfreetype.so.6\]'
    grep -q 'metrics->x_scale / 24' "$srcdir/freetype-$_ftver/src/base/ftsynth.c"
}

package() {
    cd "$srcdir/wps"
    install -d "$pkgdir/usr/lib"
    cp -a --no-preserve=ownership opt/kingsoft/wps-office/office6 "$pkgdir/usr/lib/"
    # Remove upstream build-machine search paths, retaining all useful RPATHs.
    patchelf --remove-rpath "$pkgdir/usr/lib/office6/libodbccr.so.2.0.0"
    patchelf --remove-rpath "$pkgdir/usr/lib/office6/libopencv_world.so.4.4.0"
    # Use system libstdc++ and JPEG, as in the original AUR recipe.
    rm -f "$pkgdir"/usr/lib/office6/libstdc++.so* \
          "$pkgdir"/usr/lib/office6/libjpeg.so*
    install -Dm644 "$srcdir/freetype-build/libfreetype.so.6" \
        "$pkgdir/usr/lib/office6/libfreetype.so.6"

    install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    install -m755 usr/bin/* "$pkgdir/usr/bin/"
    cp -a --no-preserve=ownership usr/share/applications/. "$pkgdir/usr/share/applications/"
    for _dir in icons desktop-directories; do
        if [[ -d usr/share/$_dir ]]; then
            install -d "$pkgdir/usr/share/$_dir"
            cp -a --no-preserve=ownership "usr/share/$_dir/." "$pkgdir/usr/share/$_dir/"
        fi
    done
    # Desktop launchers use these icons in the applications context.
    for _icon in "$pkgdir"/usr/share/icons/hicolor/*/mimetypes/wps-office2019*.png; do
        [[ -f $_icon ]] || continue
        _appsdir="${_icon%/mimetypes/*}/apps"
        install -d "$_appsdir"
        ln -s "../mimetypes/${_icon##*/}" "$_appsdir/${_icon##*/}"
    done
    # Preserve upstream fonts; do not bundle any additional font packages.
    install -Dm644 -t "$pkgdir/usr/share/fonts/wps-office" usr/share/fonts/wps-office/*
    install -Dm644 etc/xdg/menus/applications-merged/wps-office.menu \
        "$pkgdir/etc/xdg/menus/applications-merged/wps-office.menu"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
        opt/kingsoft/wps-office/office6/mui/default/*.html
    install -Dm644 "$srcdir/freetype-$_ftver/docs/FTL.TXT" \
        "$pkgdir/usr/share/licenses/$pkgname/FTL.TXT"
    install -Dm644 "$srcdir/freetype-$_ftver/docs/GPLv2.TXT" \
        "$pkgdir/usr/share/licenses/$pkgname/GPLv2.TXT"
}
