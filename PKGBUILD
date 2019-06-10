# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Gabor Nyekhelyi (n0gabor) <n0gabor@vipmail.hu>

pkgname=pitivi-git
pkgver=0.999.0.r575.g3c719067
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
checkdepends=('gst-validate' 'zbar' 'lilv' 'libkate' 'fluidsynth' 'qt5-base'
              'qt5-declarative' 'qt5-x11extras' 'gst-libav' 'xorg-server-xvfb')
provides=('pitivi')
conflicts=('pitivi')
BUILDENV=('!check')
source=('git+https://gitlab.gnome.org/GNOME/pitivi.git'
        'pitivi-git-fix-locale-on-tests.patch')
sha256sums=('SKIP'
            '1ad918e9b87ee7a3f1465f5d444fa7b8e2373dad4d3c72a72af0f0364612f6f7')

prepare() {
    cd pitivi
    
    # fix locale on tests
    patch -Np1 -i "${srcdir}/pitivi-git-fix-locale-on-tests.patch"
}

pkgver() {
    cd pitivi
    
    local _version
    local _revision
    local _shorthash
    
    _version="$(git tag | grep '[[0-9]*\.]*[0-9]*' | sort -r | head -n1)"
    _revision="$(git rev-list "${_version}..HEAD" --count)"
    _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd pitivi
    
    arch-meson . build
    
    ninja -C build
}

check() {
    cd pitivi
    
    xvfb-run gst-validate-launcher tests/ptv_testsuite.py
}

package() {
    cd pitivi
    
    DESTDIR="$pkgdir" ninja -C build install
}
