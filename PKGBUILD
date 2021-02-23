# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Radioactiveman <thomas-lange2@gmx.de>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: William Rea <sillywilly@gmail.com>

# Set to 1 to use Meson build system
_use_meson=0

pkgname=audacious-plugins-libopenmpt-git
pkgver=4.1.r11.g9446cf0b9
pkgrel=1
pkgdesc='Plugins for Audacious (with libopenpt) (git version)'
arch=(i686 x86_64)
url=https://audacious-media-player.org
license=(BSD GPL)
provides=("${pkgname%-libopenmpt-git}")
conflicts=("${pkgname%-libopenmpt-git}")
depends=(audacious-git alsa-lib curl dbus-glib faad2 ffmpeg flac fluidsynth
        jack lame libcdio-paranoia libcue libmms libmodplug
        libmtp libpulse libnotify libsamplerate libsidplayfp
        libvorbis lirc mpg123 neon wavpack libbs2b libopenmpt qt5-x11extras)
makedepends=(glib2 python git)
source=(git+https://github.com/audacious-media-player/"${pkgname%-libopenmpt-git}".git)
md5sums=('SKIP')

if [ "$_use_meson" = 1 ]; then
    makedepends+=('meson')
fi

pkgver() {
    git -C "${pkgname%-libopenmpt-git}" describe --long --tags | sed 's/^audacious-plugins-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-libopenmpt-git}"
    if [ "$_use_meson" = 1 ]; then
        arch-meson build
        meson compile -C build
    else
        autoreconf
        ./configure --prefix=/usr
        make
    fi
}

package() {
    cd "${pkgname%-libopenmpt-git}"

    if [ "$_use_meson" = 1 ]; then
        DESTDIR="$pkgdir" meson install -C build
    else
        make DESTDIR="$pkgdir" install
    fi

    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
