# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

pkgname='lib32-gst-plugins-bad'
_basename="${pkgname#lib32-}"
pkgver=1.18.5
pkgrel=2
pkgdesc='Multimedia graph framework - bad plugins (32-bit)'
arch=('x86_64')
url='https://gstreamer.freedesktop.org/'
license=('LGPL2.1')
depends=(
    "lib32-gst-plugins-base-libs>=${pkgver}"
    "lib32-gst-plugins-good>=${pkgver}"
    'lib32-aom'
    'lib32-bzip2'
    'lib32-chromaprint'
    'lib32-curl'
    'lib32-faac'
    'lib32-faad2'
    'lib32-fluidsynth'
    'lib32-lcms2'
    'lib32-libass'
    'lib32-libavtp'
    'lib32-libbs2b'
    'lib32-libdc1394'
    'lib32-libdca'
    'lib32-libde265'
    'lib32-libdrm'
    'lib32-libdvdnav'
    'lib32-libdvdread'
    'lib32-libfdk-aac'
    'lib32-libgme'
    'lib32-libgudev'
    'lib32-libkate'
    'lib32-liblrdf'
    'lib32-libmms'
    'lib32-libmodplug'
    'lib32-libmpcdec'
    'lib32-libnice'
    'lib32-libofa'
    'lib32-librsvg'
    'lib32-libsndfile'
    'lib32-libsrtp'
    'lib32-libusb'
    'lib32-libva'
    'lib32-libvdpau'
    'lib32-libwebp'
    'lib32-libx11'
    'lib32-libxcb'
    'lib32-libxkbcommon-x11'
    'lib32-libxml2'
    'lib32-lilv'
    'lib32-mjpegtools'
    'lib32-neon'
    'lib32-nettle'
    'lib32-openal'
    'lib32-openjpeg2'
    'lib32-openssl'
    'lib32-opus'
    'lib32-orc'
    'lib32-pango'
    'lib32-rtmpdump'
    'lib32-sbc'
    'lib32-soundtouch>=2.3.1'
    'lib32-spandsp'
    'lib32-srt'
    'lib32-vulkan-icd-loader'
    'lib32-wayland'
    'lib32-webrtc-audio-processing'
    'lib32-wildmidi'
    'lib32-x265'
    'lib32-zbar'
    'lib32-zvbi'
)
makedepends=(
    'git'
    'lib32-bluez-libs'
    'lib32-glu'
    'lib32-gtk3'
    'lib32-ladspa'
    'lib32-libexif'
    'lib32-lv2'
    'lib32-shaderc'
    'lib32-vulkan-validation-layers'
    'meson'
    'python'
    'vulkan-headers'
    'wayland-protocols'
)
checkdepends=('xorg-server-xvfb')
optdepends=('lib32-nvidia-utils: nvcodec plugin')
options=('!emptydirs')
_tarname="${_basename}-${pkgver}"
source=("${_tarname}.tar.xz::${url}src/${_basename}/${_tarname}.tar.xz"
        '1267.patch'
        'wpe-1.1.diff')
sha256sums=('a164923b94f0d08578a6fcaeaac6e0c05da788a46903a1086870e9ca45ad678e'
            '6b44a256d1ce3ed788d689a9abc5d8a2c4f992ce3c6c60f7a1efb4aa5cc3deb1'
            '841988d7dffaf98adeff046cfeed97505a66d268c156361ac29c2b7a112cf984')

prepare() {
    # Neon 0.32.x
    # https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1267
    patch -Np3 --directory="${_tarname}" --input='../1267.patch'

    # wpe-webkit-1.1 (libsoup3)
    patch -Np1 --directory="${_tarname}" --input='../wpe-1.1.diff'

    # configure
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export CFLAGS+=" ${LDFLAGS}"    # otherwise meson (or the project) ignores LDFLAGS
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson "${_tarname}" 'build' \
        --libdir='lib32' \
        --libexecdir='lib32' \
        -Dintrospection='disabled' \
        -Ddoc='disabled' \
        -Ddirectfb='disabled' \
        -Dflite='disabled' \
        -Dgsm='disabled' \
        -Diqa='disabled' \
        -Dmagicleap='disabled' \
        -Dmsdk='disabled' \
        -Dopencv='disabled' \
        -Dopenh264='disabled' \
        -Dopenmpt='disabled' \
        -Dopenni2='disabled' \
        -Dopensles='disabled' \
        -Dtinyalsa='disabled' \
        -Dvoaacenc='disabled' \
        -Dvoamrwbenc='disabled' \
        -Dwasapi2='disabled' \
        -Dwasapi='disabled' \
        -Dwpe='disabled' \
        -Dgobject-cast-checks='disabled' \
        -Dmicrodns='disabled' \
        -Dsvthevcenc='disabled' \
        -Dzxing='disabled' \
        -Dopenexr='disabled' \
        -Dpackage-name="Arch Linux ${pkgname} ${pkgver}-${pkgrel}" \
        -Dpackage-origin='https://www.archlinux.org/'
}

build() {
    meson compile -C 'build'
}

check() (
    mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
    export XDG_RUNTIME_DIR

    # elements_dtls test hangs sometimes
    xvfb-run -s '-nolisten local' \
        meson test -C 'build' --print-errorlogs || :
)

package() {
    # 64-bit lib not needed during build, only if package is installed, for shared header includes
    depends+=("${_basename}>=${pkgver}")

    meson install -C 'build' --destdir "${pkgdir}"

    rm -rf "${pkgdir}"/usr/{bin,include,share}
}
