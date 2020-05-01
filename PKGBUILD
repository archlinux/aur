# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Gabor Nyekhelyi (n0gabor) <n0gabor@vipmail.hu>

pkgname=pitivi-git
pkgver=0.999.0.r881.g7739e04c
pkgrel=1
pkgdesc='Editor for audio/video projects using the GStreamer framework (git version)'
arch=('x86_64')
url='http://www.pitivi.org/'
license=('LGPL')
depends=('gsound' 'gst-editing-services' 'gst-plugins-bad' 'gst-plugins-good' 'gst-python'
         'gst-transcoder' 'gtk3' 'libnotify' 'python-cairo' 'python-gobject'
         'python-matplotlib' 'python-numpy' 'gdk-pixbuf2' 'libpeas')
optdepends=('frei0r-plugins: for additional video effects, clip transformation feature'
            'gst-libav: for additional multimedia codecs'
            'gst-plugins-ugly: for additional multimedia codecs')
makedepends=('git' 'gettext' 'itstool' 'meson' 'appstream-glib')
checkdepends=('gst-validate' 'gst-plugin-gtk' 'zbar' 'lilv' 'libkate' 'fluidsynth'
              'qt5-base' 'qt5-declarative' 'qt5-x11extras' 'gst-libav' 'xorg-server-xvfb')
provides=('pitivi')
conflicts=('pitivi')
BUILDENV+=('!check')
source=('git+https://gitlab.gnome.org/GNOME/pitivi.git')
sha256sums=('SKIP')

pkgver() {
    local _version
    local _revision
    local _shorthash
    _version="$(git -C pitivi tag | grep '[[0-9]*\.]*[0-9]*' | sort -r | head -n1)"
    _revision="$(git -C pitivi rev-list "${_version}..HEAD" --count)"
    _shorthash="$(git -C pitivi rev-parse --short HEAD)"
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    arch-meson pitivi/build pitivi
    ninja -C pitivi/build
}

check() {
    cd pitivi
    xvfb-run gst-validate-launcher tests/ptv_testsuite.py
}

package() {
    DESTDIR="$pkgdir" ninja -C pitivi/build install
}
