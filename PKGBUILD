# Maintainer: loathingkernel <loathingkernel _a_ gmail _d_ com>

pkgname=proton-native
_pkgver=4.11-9
pkgver=${_pkgver//-/.}
_geckover=2.47
_monover=4.9.4
pkgrel=1
pkgdesc="Compatibility tool for Steam Play based on Wine and additional components. Monolithic distribution"
arch=(x86_64)
url="https://github.com/ValveSoftware/Proton"
license=('GPL')
depends=(
  fontconfig      lib32-fontconfig
  lcms2           lib32-lcms2
  libxml2         lib32-libxml2
  libxcursor      lib32-libxcursor
  libxrandr       lib32-libxrandr
  libxdamage      lib32-libxdamage
  libxi           lib32-libxi
  gettext         lib32-gettext
  freetype2       lib32-freetype2
  glu             lib32-glu
  libsm           lib32-libsm
  gcc-libs        lib32-gcc-libs
  libpcap         lib32-libpcap
  desktop-file-utils
  python
  steam-native-runtime
  wine_gecko=$_geckover
  wine-mono-bin=$_monover
  dxvk
  d9vk
)
makedepends=(autoconf ncurses bison perl fontforge flex
  'gcc>=4.5.0-2'
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
  libpulse              lib32-libpulse
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  mesa                  lib32-mesa
  mesa-libgl            lib32-mesa-libgl
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  vkd3d                 lib32-vkd3d
  sdl2                  lib32-sdl2
  libgphoto2
  sane
  gsm
  vulkan-headers
  samba
  opencl-headers
  git
  cmake
  afdko
  nasm
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
  ncurses               lib32-ncurses
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vkd3d                 lib32-vkd3d
  sdl2                  lib32-sdl2
  libgphoto2
  sane
  gsm
  cups
  samba           dosbox
)
makedepends=(${makedepends[@]} ${depends[@]})
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    proton::git+https://github.com/ValveSoftware/Proton.git#tag=proton-$_pkgver
    wine-valve::git+https://github.com/ValveSoftware/wine.git
    ffmpeg::git+https://git.ffmpeg.org/ffmpeg.git
    openvr::git+https://github.com/ValveSoftware/openvr.git
    liberation-fonts::git+https://github.com/liberationfonts/liberation-fonts.git
    FAudio::git+https://github.com/FNA-XNA/FAudio.git
    proton-unfuck_makefile.patch
    proton-disable_lock.patch
)
sha256sums=(
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    SKIP
    e9506ddf7edc5135a5e3568fea5bbf29af5948fbf45d2d89620a5a1f2b5dc6a4
    7418f1ceca081e1b68d933ea6dd5da0351c7cc26e41667e3b3bc49c030504782
)

prepare() {
    [ ! -d build ] && mkdir build

    cd proton
    for submodule in ffmpeg openvr FAudio fonts/liberation-fonts; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url ../"${submodule#*/}"
        git submodule update "${submodule}"
    done

    for submodule in wine; do
        git submodule init "${submodule}"
        git config submodule."${submodule}".url ../"${submodule#*/}"-valve
        git submodule update "${submodule}"
    done

    patch -p1 -i "$srcdir"/proton-unfuck_makefile.patch
    patch -p1 -i "$srcdir"/proton-disable_lock.patch
}

build() {
	cd build
    ../proton/configure.sh \
        --no-steam-runtime \
        --with-ffmpeg \
        --build-name="${pkgname%-git}"

    export CFLAGS="${CFLAGS/-O3/-O2}"
    export CFLAGS="${CFLAGS/ -fno-plt/}"
    export LDFLAGS="${LDFLAGS/,-z,now/}"

    SUBMAKE_JOBS="${MAKEFLAGS/-j/}" \
        WINEESYNC=0 \
        WINEFSYNC=0 \
        NO_DXVK=1 \
        SYSTEM_GECKO=1 \
        SYSTEM_MONO=1 \
        make -j1 dist
}

package() {
    cd build

    mkdir -p "$pkgdir/usr/share/steam/compatibilitytools.d"
    mv dist "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"

    find "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}" -type f -exec chmod 644 {} \;
    chmod 755 "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/{proton,dist/bin/{msidb,wine{,64},wine{,64}-preloader,wineserver}}

    ln -s /usr/share/wine/mono "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/share/wine/mono
    ln -s /usr/share/wine/gecko "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/share/wine/gecko

    for i in d3d10_1.dll d3d10core.dll d3d10.dll d3d11.dll dxgi.dll
    do
        ln -s "/usr/share/dxvk/x32/$i" \
            "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/lib/wine/dxvk/
        ln -s "/usr/share/dxvk/x64/$i" \
            "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/lib64/wine/dxvk/
    done

    for i in d3d9.dll
    do 
        ln -s "/usr/share/d9vk/x32/$i" \
            "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/lib/wine/dxvk/
        ln -s "/usr/share/d9vk/x64/$i" \
            "$pkgdir/usr/share/steam/compatibilitytools.d/${pkgname%-git}"/dist/lib64/wine/dxvk/
    done
}
