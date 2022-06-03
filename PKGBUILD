# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>
# Contributor: loathingkernel <loathingkernel _a_ gmail _d_ com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

_wine_commit=2c3c135b834de97dfc2450068b94bcb9502cf519
#_stag_commit=2fc92f8ba6e577b8baf69053aabe1c302f352197

pkgname=wine-ge-lol
_reponame=wine-ge-custom
_srctag=7.0-GE-2-LoL
pkgver=${_srctag//-/.}
pkgrel=2
pkgdesc="A compatibility layer for running League of Legends - GloriousEggroll branch"
arch=(x86_64)
url="https://github.com/GloriousEggroll/wine-ge-custom"
license=(LGPL)
source=($_reponame::git+https://github.com/GloriousEggroll/wine-ge-custom.git#tag=${_srctag}
        wine::git+https://github.com/GloriousEggroll/wine.git#commit=${_wine_commit}
        wine-wmclass.patch
        wine-isolate_home.patch
        futex.patch
        30-win32-aliases.conf)
#wine-staging::git+https://github.com/wine-staging/wine-staging.git#commit=${_stag_commit}
sha256sums=('SKIP'
            'SKIP'
            'c7137c57f4a5f60a1cf069a89659819f78123641ded52513dbc5bc879598f248'
            '3527f202b303100852a445a5030da3964e48c37bfe352d6b1f23ff35bcfcb8d9'
            '763e1762f668692f8aa7426d1337a5b48025fbe802a7856a9e67ef4b13f58f46'
            '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7')

depends=(
    attr             lib32-attr
    fontconfig       lib32-fontconfig
    lcms2            lib32-lcms2
    libxml2          lib32-libxml2
    libxcursor       lib32-libxcursor
    libxrandr        lib32-libxrandr
    libxdamage       lib32-libxdamage
    libxi            lib32-libxi
    gettext          lib32-gettext
    freetype2        lib32-freetype2
    glu              lib32-glu
    libsm            lib32-libsm
    gcc-libs         lib32-gcc-libs
    libpcap          lib32-libpcap
    faudio           lib32-faudio
    desktop-file-utils
)

makedepends=(autoconf bison perl fontforge flex mingw-w64-gcc
    git
    giflib                lib32-giflib
    libpng                lib32-libpng
    gnutls                lib32-gnutls
    libxinerama           lib32-libxinerama
    libxcomposite         lib32-libxcomposite
    libxmu                lib32-libxmu
    libxxf86vm            lib32-libxxf86vm
    libldap               lib32-libldap
    mpg123                lib32-mpg123
    openal                lib32-openal
    v4l-utils             lib32-v4l-utils
    alsa-lib              lib32-alsa-lib
    libxcomposite         lib32-libxcomposite
    mesa                  lib32-mesa
    mesa-libgl            lib32-mesa-libgl
    opencl-icd-loader     lib32-opencl-icd-loader
    libxslt               lib32-libxslt
    libpulse              lib32-libpulse
    libva                 lib32-libva
    gtk3                  lib32-gtk3
    gst-plugins-base-libs lib32-gst-plugins-base-libs
    vulkan-icd-loader     lib32-vulkan-icd-loader
    sdl2                  lib32-sdl2
    vkd3d                 lib32-vkd3d
    libcups               lib32-libcups
    sane
    libgphoto2
    gsm
    ffmpeg
    samba
    opencl-headers
)

optdepends=(
    giflib                lib32-giflib
    libpng                lib32-libpng
    libldap               lib32-libldap
    gnutls                lib32-gnutls
    mpg123                lib32-mpg123
    openal                lib32-openal
    v4l-utils             lib32-v4l-utils
    libpulse              lib32-libpulse
    alsa-plugins          lib32-alsa-plugins
    alsa-lib              lib32-alsa-lib
    libjpeg-turbo         lib32-libjpeg-turbo
    libxcomposite         lib32-libxcomposite
    libxinerama           lib32-libxinerama
    opencl-icd-loader     lib32-opencl-icd-loader
    libxslt               lib32-libxslt
    libva                 lib32-libva
    gtk3                  lib32-gtk3
    gst-plugins-base-libs lib32-gst-plugins-base-libs
    vulkan-icd-loader     lib32-vulkan-icd-loader
    sdl2                  lib32-sdl2
    vkd3d                 lib32-vkd3d
    sane
    libgphoto2
    gsm
    ffmpeg
    cups
    samba                 dosbox
)

prepare() {
    cd "$srcdir/$_reponame"
    rm -rf wine && cp -r "$srcdir"/wine wine
    #rm -rf wine-staging && cp -r "$srcdir"/wine-staging wine-staging
    #patches/protonprep-LoL.sh
    pushd wine
    patch -Np1 -i "$srcdir"/wine-wmclass.patch
    patch -Np1 -i "$srcdir"/wine-isolate_home.patch
    patch -Np1 -i "$srcdir"/futex.patch
    grep -rl 'OpenCL\/' | xargs sed -i 's,OpenCL/,CL/,g'
    dlls/winevulkan/make_vulkan
    tools/make_requests
    autoreconf -f
    popd

    # Get rid of old build dirs
    rm -rf "$srcdir"/$_reponame-{32,64}-build
    mkdir "$srcdir"/$_reponame-{32,64}-build
}

build() {
    cd "$srcdir"

    # Doesn't compile without remove these flags as of 4.10
    export CFLAGS="${CFLAGS/-fno-plt/}"
    export CXXFLAGS="${CXXFLAGS/-fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"
    # MingW Wine builds fail with relro
    export LDFLAGS="${LDFLAGS/,-z,relro/}"

    export CFLAGS="-O2 -march=nocona -pipe -mtune=core-avx2"
    export CXXFLAGS="-O2 -march=nocona -pipe -mtune=core-avx2"
    export LDFLAGS="-Wl,-O1,--sort-common,--as-needed"

    # Disable AVX instead of using 02, same as dxvk, the rest are from Proton
    export CFLAGS+=" -mno-avx -mno-avx2"
    export CXXFLAGS+=" -mno-avx -mno-avx2"
    export CFLAGS+=" -mfpmath=sse -fwrapv -fno-strict-aliasing -gdwarf-2 -gstrict-dwarf"
    export CXXFLAGS+=" -mfpmath=sse -fwrapv -fno-strict-aliasing -gdwarf-2 -gstrict-dwarf -std=c++17"

    export CROSSCFLAGS="$CFLAGS"
    export CROSSCXXFLAGS="$CXXFLAGS"
    export CROSSLDFLAGS="$LDFLAGS -Wl,--file-alignment,4096"

    msg2 "Building Wine-64..."

    cd "$srcdir/$_reponame-64-build"
    "$srcdir/$_reponame/wine/configure" \
        --prefix=/opt/wine-ge-lol \
        --libdir=/opt/wine-ge-lol/lib \
        --with-x \
        --with-faudio \
        --with-gstreamer \
        --with-mingw \
        --with-alsa \
        --without-oss \
        --disable-winemenubuilder \
        --disable-win16 \
        --disable-tests \
        --enable-win64 \
        --with-xattr

    make

    msg2 "Building Wine-32..."

    export CFLAGS+=" -mstackrealign"
    export CXXFLAGS+=" -mstackrealign"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
    cd "$srcdir/$_reponame-32-build"
    "$srcdir/$_reponame/wine/configure" \
        --prefix=/opt/wine-ge-lol \
        --libdir=/opt/wine-ge-lol/lib32 \
        --with-x \
        --with-faudio \
        --with-gstreamer \
        --with-mingw \
        --with-alsa \
        --without-oss \
        --disable-winemenubuilder \
        --disable-win16 \
        --disable-tests \
        --with-xattr \
        --with-wine64="$srcdir/$_reponame-64-build"

    make
}

package() {
    msg2 "Packaging Wine-32..."
    cd "$srcdir/$_reponame-32-build"
    make prefix="$pkgdir/opt/wine-ge-lol" \
        libdir="$pkgdir/opt/wine-ge-lol/lib32" \
        dlldir="$pkgdir/opt/wine-ge-lol/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "$srcdir/$_reponame-64-build"
    make prefix="$pkgdir/opt/wine-ge-lol" \
        libdir="$pkgdir/opt/wine-ge-lol/lib" \
        dlldir="$pkgdir/opt/wine-ge-lol/lib/wine" install

    # Font aliasing settings for Win32 applications
    install -d "$pkgdir"/usr/share/fontconfig/conf.{avail,default}
    install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/usr/share/fontconfig/conf.avail/30-wine-ge-lol-win32-aliases.conf"
    ln -s ../conf.avail/30-wine-ge-lol-win32-aliases.conf "$pkgdir/usr/share/fontconfig/conf.default/30-wine-ge-lol-win32-aliases.conf"

    i686-w64-mingw32-strip --strip-unneeded "$pkgdir"/opt/wine-ge-lol/lib32/wine/i386-windows/*.{dll,exe}
    x86_64-w64-mingw32-strip --strip-unneeded "$pkgdir"/opt/wine-ge-lol/lib/wine/x86_64-windows/*.{dll,exe}

    find "$pkgdir"/opt/wine-ge-lol/lib{,32}/wine -iname "*.a" -delete
    find "$pkgdir"/opt/wine-ge-lol/lib{,32}/wine -iname "*.def" -delete
}

# vim: set ts=4 sw=4 et:
