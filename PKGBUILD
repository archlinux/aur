# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=lib32-pipewire-git
_pkgbase=pipewire
pkgname=(lib32-pipewire-git lib32-pipewire-jack-git lib32-gst-plugin-pipewire-git)
pkgver=0.3.23.r131.g529f4d31
pkgrel=1
pkgdesc='Low-latency audio/video router and processor (git) (32 bit client libraries)'
url=https://pipewire.org
license=(LGPL2.1)
arch=(x86_64)
makedepends=(git meson valgrind jack2 lib32-jack2 libpulse lib32-libpulse
             alsa-lib lib32-alsa-lib gst-plugins-base lib32-gst-plugins-base
             rtkit dbus lib32-dbus libsndfile lib32-libsndfile)
source=(git+https://gitlab.freedesktop.org/pipewire/pipewire.git)
md5sums=('SKIP')

pkgver() {
    git -C ${_pkgbase} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    arch-meson ${_pkgbase} build \
        --libdir /usr/lib32 \
        -D docs=disabled \
        -D man=disabled \
        -D systemd-system-service=disabled \
        -D tests=disabled \
        -D audiotestsrc=disabled \
        -D bluez5=disabled \
        -D bluez5-codec-aptx=disabled \
        -D bluez5-codec-ldac=disabled \
        -D bluez5-codec-aac=disabled \
        -D ffmpeg=disabled \
        -D jack=disabled \
        -D libcamera=disabled \
        -D sdl2=disabled \
        -D jack=disabled \
        -D videotestsrc=disabled \
        -D volume=disabled \
        -D vulkan=disabled \
        -D udevrulesdir=/usr/lib/udev/rules.d
    meson compile -C build
}

_pick() {
    local f d
    for f; do
        d="${pkgdir}/${f#$srcdir/install/}"
        mkdir -p "$(dirname "$d")"
        mv "$f" "$d"
        rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
    done
}

_ver=${pkgver:0:3}
_spaver="0.2"

package_lib32-pipewire-git() {
    depends=(rtkit lib32-dbus lib32-libsndfile lib32-libudev0-shim
        lib32-alsa-lib lib32-systemd)
    optdepends=('lib32-pipewire-jack: JACK support')
    provides=(lib32-pipewire)
    conflicts=(lib32-pipewire)

    DESTDIR="$srcdir/install" meson install -C build

    cd "$pkgdir"

    _pick "$srcdir"/install/usr/lib32/libpipewire-${_ver}.so*
    _pick "$srcdir"/install/usr/lib32/pipewire-${_ver}/libpipewire-module-*.so
    _pick "$srcdir"/install/usr/lib32/pkgconfig
    _pick "$srcdir"/install/usr/lib32/spa-${_spaver}
}

package_lib32-pipewire-jack-git() {
    pkgdesc+=' (JACK support) (git) (32 bit)'
    depends=(lib32-pipewire lib32-pipewire-git=$pkgver lib32-jack2)
    provides=(lib32-pipewire-jack)
    conflicts=(lib32-pipewire-jack)
    _pick "$srcdir"/install/usr/lib32/pipewire-${_ver}/jack
}

package_lib32-gst-plugin-pipewire-git() {
    pkgdesc='Multimedia graph framework - pipewire plugin (git) (32 bit)'
    depends=(lib32-pipewire lib32-pipewire-git=$pkgver lib32-gst-plugins-base-libs)
    provides=(lib32-gst-plugin-pipewire)
    conflicts=(lib32-gst-plugin-pipewire)
    _pick "$srcdir"/install/usr/lib32/gstreamer-1.0
}
