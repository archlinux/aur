# Maintainer: moonshadow565 <moonshadow565@hotmail.com>

pkgname=wine-lol-staging
pkgver=7.14
pkgrel=1
pkgdesc='A compatibility layer for running Windows programs (staging branch) with LoL patches(abi.vsyscall32=0 version)'
arch=('x86_64')
url='https://www.wine-staging.com/'
license=('LGPL')
install=wine-lol-staging.install

options=('staticlibs' '!lto' '!strip')

source=("git+https://github.com/wine-staging/wine-staging.git#tag=v${pkgver}"
        "git+https://github.com/wine-mirror/wine.git#tag=wine-${pkgver}"
        "0002-LoL-6.17+-syscall-fix.patch"
        "0003-LoL-abi.vsyscall32-alternative_patch_by_using_a_fake_cs_segment.patch"
        "0004-LoL-broken-client-update-fix.patch"
        "0005-LoL-client-slow-start-fix.patch"
        "0006-LoL-abi-vsyscall32-disable-vDSO.patch"
        )

sha256sums=('SKIP'
            'SKIP'
            'c127907db75cd8575da27198c8f46aa19dd2a219324e7491761f206f3ce91601'
            'c2cb9265567dfe8c9f148e237910792cad7666d9d3cbf68d8717076030cddc92'
            '0c5b97c64fd4983119db8675f0686e26143898de1566c4da46d5df74cb98cfb2'
            '49dfbf7546c00958e2b426a61371eedf0119471e9998b354595d5c0ce6dab48b'
            'fe33c51d492de4685b515781ac157a5d02f8048a528404b4fd8319cfc7f5cf25'
            )

depends=(
    'attr'                  'lib32-attr'
    'fontconfig'            'lib32-fontconfig'
    'lcms2'                 'lib32-lcms2'
    'libxml2'               'lib32-libxml2'
    'libxcursor'            'lib32-libxcursor'
    'libxrandr'             'lib32-libxrandr'
    'libxdamage'            'lib32-libxdamage'
    'libxi'                 'lib32-libxi'
    'gettext'               'lib32-gettext'
    'freetype2'             'lib32-freetype2'
    'glu'                   'lib32-glu'
    'libsm'                 'lib32-libsm'
    'gcc-libs'              'lib32-gcc-libs'
    'libpcap'               'lib32-libpcap'
    'faudio'                'lib32-faudio'
    'desktop-file-utils'
)

makedepends=('git' 'autoconf' 'bison' 'perl' 'fontforge' 'flex' 'mingw-w64-gcc'
    'giflib'                'lib32-giflib'
    'libpng'                'lib32-libpng'
    'gnutls'                'lib32-gnutls'
    'libxinerama'           'lib32-libxinerama'
    'libxcomposite'         'lib32-libxcomposite'
    'libxmu'                'lib32-libxmu'
    'libxxf86vm'            'lib32-libxxf86vm'
    'libldap'               'lib32-libldap'
    'mpg123'                'lib32-mpg123'
    'openal'                'lib32-openal'
    'v4l-utils'             'lib32-v4l-utils'
    'alsa-lib'              'lib32-alsa-lib'
    'libxcomposite'         'lib32-libxcomposite'
    'mesa'                  'lib32-mesa'
    'libgl'                 'lib32-libgl'
    'opencl-icd-loader'     'lib32-opencl-icd-loader'
    'libxslt'               'lib32-libxslt'
    'libpulse'              'lib32-libpulse'
    'libva'                 'lib32-libva'
    'gtk3'                  'lib32-gtk3'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'vulkan-icd-loader'     'lib32-vulkan-icd-loader'
    'sdl2'                  'lib32-sdl2'
    'vkd3d'                 'lib32-vkd3d'
    'libcups'               'lib32-libcups'
    'sane'
    'libgphoto2'
    'gsm'
    'ffmpeg'
    'samba'
    'opencl-headers'
    'vulkan-headers'
)

optdepends=(
    'giflib'                'lib32-giflib'
    'libpng'                'lib32-libpng'
    'libldap'               'lib32-libldap'
    'gnutls'                'lib32-gnutls'
    'mpg123'                'lib32-mpg123'
    'openal'                'lib32-openal'
    'v4l-utils'             'lib32-v4l-utils'
    'libpulse'              'lib32-libpulse'
    'alsa-plugins'          'lib32-alsa-plugins'
    'alsa-lib'              'lib32-alsa-lib'
    'libjpeg-turbo'         'lib32-libjpeg-turbo'
    'libxcomposite'         'lib32-libxcomposite'
    'libxinerama'           'lib32-libxinerama'
    'opencl-icd-loader'     'lib32-opencl-icd-loader'
    'libxslt'               'lib32-libxslt'
    'libva'                 'lib32-libva'
    'gtk3'                  'lib32-gtk3'
    'gst-plugins-base-libs' 'lib32-gst-plugins-base-libs'
    'vulkan-icd-loader'     'lib32-vulkan-icd-loader'
    'sdl2'                  'lib32-sdl2'
    'vkd3d'                 'lib32-vkd3d'
    'sane'
    'libgphoto2'
    'gsm'
    'ffmpeg'
    'cups'
    'samba'
    'dosbox'
)

prepare() {
    rm -rf build-32
    mkdir -p build-32
    
    # restore the wine tree to its git origin state, without wine-staging patches
    printf '%s\n' '  -> Cleaning wine source code tree...'
    git -C wine reset --hard HEAD  # restore tracked files
    git -C wine clean -xdf         # delete untracked files
    
    # change back to the wine upstream commit that this version of wine-staging is based in
    printf '%s\n' '  -> Changing wine HEAD to the wine-staging base commit...'
    git -C wine config --local advice.detachedHead false
    git -C wine checkout "$(wine-staging/patches/patchinstall.sh --upstream-commit)"
    
    # fix path of opencl headers
    sed 's|OpenCL/opencl.h|CL/opencl.h|g' -i wine/configure*
    
    # fix openldap 2.5+ detection
    sed 's/-lldap_r/-lldap/' -i wine/configure
    
    # apply all wine-staging patches
    printf '%s\n' '  -> Applying wine-staging patches...'
    wine-staging/patches/patchinstall.sh DESTDIR="${srcdir}/wine" --all

    cd "${srcdir}/wine"

    # Reverts syscall thunks so leagues stub.dll can hook them properly(?)
    printf 'Apply 0002-LoL-6.17+-syscall-fix\n'
    patch -Np1 < "${srcdir}/0002-LoL-6.17+-syscall-fix.patch"

    # Fakes cs segment, needs "sudo sysctl -w abi.vsyscall32=0"
    printf 'Apply 0003-LoL-abi.vsyscall32\n'
    patch -Np1 < "${srcdir}/0003-LoL-abi.vsyscall32-alternative_patch_by_using_a_fake_cs_segment.patch"

    # Something with resolving long paths and symlinks, might not be needed if you keep your install in sane place ???
    printf 'Apply 0004-LoL-broken-client-update-fix\n'
    patch -Np1 < "${srcdir}/0004-LoL-broken-client-update-fix.patch"

    # Hack for league to start in reasonable time
    printf 'Apply 0005-LoL-client-slow-start-fix.patch\n'
    patch -Np1 < "${srcdir}/0005-LoL-client-slow-start-fix.patch"

    # Disables vDSO in preelink, no need for "sudo sysctl -w abi.vsyscall32=0"
    printf 'Apply 0006-LoL-abi-vsyscall32-disable-vDSO.patch\n'
    patch -Np1 < "${srcdir}/0006-LoL-abi-vsyscall32-disable-vDSO.patch"
}

build() {
    # does not compile without remove these flags as of 4.10
    export CFLAGS="${CFLAGS/-fno-plt/} -m32"
    export LDFLAGS="${LDFLAGS/,-z,now/}"

    # build wine-staging 32-bit
    printf '%s\n' '  -> Building wine-staging-32...'
    cd "${srcdir}/build-32"
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
    ../wine/configure \
        --prefix='/opt/wine-lol-staging' \
        --libdir='/opt/wine-lol-staging/lib32' \
        --with-x \
        --with-gstreamer \
        --with-xattr \
        --with-mingw \
        --disable-tests \
        --disable-winemenubuilder \
        --disable-win16
    make -j`nproc`
}

package() {
    # package wine-staging 32-bit
    printf '%s\n' '  -> Packaging wine-staging-32...'
    cd build-32
    make prefix="${pkgdir}/opt/wine-lol-staging" \
         libdir="${pkgdir}/opt/wine-lol-staging/lib32" \
         dlldir="${pkgdir}/opt/wine-lol-staging/lib32/wine" \
         install

    find "$pkgdir"/opt/wine-lol-staging/lib32/wine -iname "*.a" -delete
    find "$pkgdir"/opt/wine-lol-staging/lib32/wine -iname "*.def" -delete
}
