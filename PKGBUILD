# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=pipewire-git-unbiased
pkgname=(pipewire-git-unbiased pipewire-docs-git-unbiased pipewire-jack-git-unbiased pipewire-pulse-git-unbiased pipewire-alsa-git-unbiased
    gst-plugin-pipewire-git-unbiased)
pkgver=0.3.16.r43.ga65d4d04
pkgrel=1
pkgdesc='Server and user space API to deal with multimedia pipelines (git, without personal preferences)'
url=https://pipewire.org
license=(LGPL2.1)
arch=(x86_64)
makedepends=(git meson doxygen graphviz xmltoman valgrind jack2 libpulse
            alsa-lib gst-plugins-base sbc rtkit vulkan-icd-loader dbus
            libsndfile bluez-libs vulkan-headers)
source=(git+https://gitlab.freedesktop.org/pipewire/pipewire.git)
md5sums=('SKIP')

pkgver() {
    git -C ${pkgbase%-git-unbiased} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson ${pkgbase%-git-unbiased} build \
        -D docs=true \
        -D udevrulesdir=/usr/lib/udev/rules.d
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

_pick() {
    local p="$1" f d
    shift
    for f; do
        d="$srcdir/$p/${f#$pkgdir/}"
        mkdir -p "$(dirname "$d")"
        mv "$f" "$d"
        rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
    done
}

_ver=${pkgver:0:3}

package_pipewire-git-unbiased() {
    depends=(sbc rtkit vulkan-icd-loader bluez-libs alsa-card-profiles
        libdbus-1.so libsndfile.so libudev.so libasound.so libsystemd.so
        libglib-2.0.so libgobject-2.0.so)
    optdepends=('pipewire-docs: Documentation'
        'pipewire-jack: JACK support'
        'pipewire-pulse: PulseAudio support')
    provides=(pipewire libpipewire-$_ver.so)
    conflicts=(pipewire)
    backup=(etc/pipewire/pipewire.conf)
    install=pipewire.install

    DESTDIR="$pkgdir" meson install -C build

    cd "$pkgdir"

    mkdir -p etc/alsa/conf.d
    ln -st etc/alsa/conf.d /usr/share/alsa/alsa.conf.d/50-pipewire.conf

    _pick docs usr/share/doc

    _pick jack usr/bin/pw-jack usr/lib/pipewire-$_ver/jack
    _pick jack usr/lib/spa-0.2/jack
    _pick jack usr/share/man/man1/pw-jack.1

    _pick gst usr/lib/gstreamer-1.0

    # Use alsa-card-profiles built with Pulseaudio
    rm -rv "$pkgdir"/usr/share/alsa-card-profile
}

package_pipewire-docs-git-unbiased() {
    pkgdesc+=' (documentation) (git, without personal preferences)'
    provides=(pipewire-docs)
    conflicts=(pipewire-docs)
    mv docs/* "$pkgdir"
}

package_pipewire-jack-git-unbiased() {
    pkgdesc+=' (JACK support) (git, without personal preferences)'
    depends=(pipewire libpipewire-$_ver.so libjack.so)
    provides=(pipewire-jack)
    conflicts=(pipewire-jack)
    mv jack/* "$pkgdir"
}

package_pipewire-pulse-git-unbiased() {
    pkgdesc+=' (PulseAudio replacement) (git, without personal preferences)'
    depends=(pipewire libpulse)
    provides=(pipewire-pulse pulseaudio pulseaudio-bluetooth)
    conflicts=(pipewire-pulse pulseaudio) # Sockets conflict
    install=pipewire-pulse.install
}

package_pipewire-alsa-git-unbiased() {
    pkgdesc='ALSA Configuration for PipeWire (git, without personal preferences)'
    depends=(pipewire libpipewire-$_ver.so)
    provides=(pipewire-alsa pulseaudio-alsa)
    conflicts=(pipewire-alsa)

    mkdir -p "$pkgdir/etc/alsa/conf.d"
    ln -st "$pkgdir/etc/alsa/conf.d" /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf
}

package_gst-plugin-pipewire-git-unbiased() {
    pkgdesc='Multimedia graph framework - pipewire plugin (git, without personal preferences)'
    depends=(pipewire libpipewire-$_ver.so gst-plugins-base-libs)
    provides=(gst-plugin-pipewire)
    conflicts=(gst-plugin-pipewire)
    mv gst/* "$pkgdir"
}
