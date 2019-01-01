# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Gabor Nyekhelyi (n0gabor) <n0gabor@vipmail.hu>

pkgname=pitivi-git
_srcname=pitivi
pkgver=0.999.0.r437.gbb236284
pkgrel=1
pkgdesc='Editor for audio/video projects using the GStreamer framework (git version)'
arch=('x86_64')
url='http://www.pitivi.org/'
license=('LGPL')
depends=('gsound' 'gst-editing-services' 'gst-plugins-bad' 'gst-plugins-good' 'gst-python'
         'gst-transcoder' 'gst-validate' 'gtk3' 'libnotify' 'python-cairo' 'python-gobject'
         'python-matplotlib' 'python-numpy' 'gdk-pixbuf2' 'libpeas')
optdepends=('frei0r-plugins: additional video effects, clip transformation feature'
            'gst-libav: additional multimedia codecs'
            'gst-plugins-ugly: additional multimedia codecs')
makedepends=('git' 'gettext' 'itstool' 'meson')
provides=('pitivi')
conflicts=('pitivi')
source=('git+https://gitlab.gnome.org/GNOME/pitivi.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_srcname"
    
    local _version
    local _revision
    local _shorthash
    
    _version="$(git tag | grep '[[0-9]*\.]*[0-9]*' | sort -r | head -n1)"
    _revision="$(git rev-list "${_version}..HEAD" --count)"
    _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd "$_srcname"
    
    arch-meson . build
    
    ninja -C build
}

package() {
    cd "$_srcname"
    
    DESTDIR="$pkgdir" ninja -C build install
}
