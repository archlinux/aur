#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Iru Cai <mytbk920423@gmail.com>
# Contributor: Alexander Hunziker <alex.hunziker@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=gimp-git
_pkgname=${pkgname%-git}
provides=(gimp)
conflicts=(gimp)
epoch=2
pkgver=2.99.1.r5001.fa5e345fda
pkgrel=1
pkgdesc="GNU Image Manipulation Program"
arch=('i686' 'x86_64')
url="https://www.gimp.org"
license=('GPL' 'LGPL')
depends=(
	'lcms2>=2.8'
	'libwmf>=0.2.8'
	'icu'
	'enchant'
	'libgexiv2>=0.10.6'
	'librsvg>=2.40.6'
	'desktop-file-utils'
	'libexif>=0.6.15'
	'libart-lgpl>=2.3.19'
	'dbus-glib'
	'gtk-doc>=1.0'
	'poppler-glib>=0.69.0'
	'poppler-data>=0.4.9'
	'openexr>=1.6.1'
	'mypaint-brushes1>=1.3.0'
	'babl>=0.1.74'
	'gegl>=0.4.24'
	'cairo>=1.14.0'
	'appstream-glib>=0.7.7'
	'gobject-introspection>=1.32.0'
	)
makedepends=('git' 'intltool>=0.40.1'
             'alsa-lib>=1.0.0' 'libxslt' 'glib-networking'
             'alsa-lib' 'curl' 'ghostscript' 'libxpm' 'webkit2gtk'
             'libheif' 'libwebp' 'libmng' 'iso-codes' 'aalib' 'zlib'
             'gjs' 'python-gobject' 'luajit' 'meson' 'xorg-server-xvfb'
             )
checkdepends=('xorg-server-xvfb')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support'
            'libxpm: XPM support'
            'webkit2gtk: HTML renderer and web content engine'
            'libheif: HEIF support'
            'libwebp: WebP support'
            'libmng: MNG support'
            'iso-codes: Language support'
            'aalib: ASCII art support'
            'zlib: Compression routines'
            'gjs: JavaScript scripting support'
            'luajit: LUA scripting support'
            )
source=('git+https://gitlab.gnome.org/GNOME/gimp.git'
        'linux.gpl')
sha512sums=('SKIP'
            '6f33d57f242fa8ce04b65e06a712bd54677306a45b22cb853fbe348089cd4673bd4ed91073074fe067166fe8951c370f8bbbc386783e3ed5170d52e9062666fe')

pkgver() {
# shellcheck disable=SC2183,SC2046
  printf "%s.%s.%s.r%s.%s" \
    $(grep -oP 'gimp_(major|minor|micro)_version\], \[\K[0-9]{1,2}' ${_pkgname}/configure.ac) \
    "$(git -C $_pkgname rev-list "$(git -C $_pkgname describe --abbrev=0)"..HEAD --count)" \
    "$(git -C $_pkgname log --pretty=format:'%h' -n 1)"
}

prepare() {
  export CFLAGS CXXFLAGS LDFLAGS
  meson "${srcdir}/${_pkgname}"\
        "${srcdir}/build"\
        --prefix=/usr
}

build() {
  export NINJA_STATUS="[%p | %f<%r<%u | %cbps ] "
  ninja -C "${srcdir}/build"
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
  install -Dm 644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/2.99/palettes/Linux.gpl"
}
