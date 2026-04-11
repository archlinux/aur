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
pkgver=3.2.3.r206.84c2c54bdf
pkgrel=1
pkgdesc="GNU Image Manipulation Program"
arch=('i686' 'x86_64')
url="https://www.gimp.org"
license=('GPL' 'LGPL')
depends=(
	'libxmu'
	'lcms2>=2.8'
	'libwmf>=0.2.8'
	'icu'
	'enchant'
	'libgexiv2>=0.14.0'
	'librsvg>=2.40.6'
	'desktop-file-utils'
	'libexif>=0.6.15'
	'libart-lgpl>=2.3.19'
	'dbus-glib'
	'gtk-doc>=1.0'
	'poppler-glib>=0.69.0'
	'poppler-data>=0.4.9'
	'openexr>=1.6.1'
	'libmypaint>=1.5.0'
	'mypaint-brushes>=2.0'
	'babl-git>=0.1.118'
	'gegl-git>=0.4.66'
	'cairo>=1.14.0'
	'appstream>=0.16.1'
	'gobject-introspection>=1.32.0'
	)
makedepends+=('git' 'intltool>=0.40.1'
             'alsa-lib>=1.0.0' 'libxslt' 'glib-networking'
             'alsa-lib' 'curl' 'ghostscript' 'libxpm' 'webkit2gtk-4.1'
             'libheif' 'libwebp' 'libmng' 'iso-codes' 'aalib' 'zlib'
             'gjs' 'python-gobject' 'python-packaging' 'luajit' 'meson'
             'glib2-devel'
             'libbacktrace' 'gi-docgen' 'cfitsio'
             'python-cairo' 'xdg-utils' 'bash-completion' 'vala'
             )
checkdepends=('xorg-server-xvfb')
optdepends=('gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support'
            'libxpm: XPM support'
            'webkit2gtk-4.1: HTML renderer and web content engine'
            'libheif: HEIF support'
            'libwebp: WebP support'
            'libmng: MNG support'
            'iso-codes: Language support'
            'aalib: ASCII art support'
            'zlib: Compression routines'
            'gjs: JavaScript scripting support'
            'luajit: LUA scripting support'
            'cfitsio: for FITS support'
            'gvfs: for HTTP/S support (and many other schemes)'
            'xdg-utils: xdg-email required for sending support email'
            )
source=('git+https://gitlab.gnome.org/GNOME/gimp.git'
        "gimp-data::git+https://gitlab.gnome.org/GNOME/gimp-data"
        'linux.gpl')
sha512sums=('SKIP'
            'SKIP'
            '6f33d57f242fa8ce04b65e06a712bd54677306a45b22cb853fbe348089cd4673bd4ed91073074fe067166fe8951c370f8bbbc386783e3ed5170d52e9062666fe')

pkgver() {
# shellcheck disable=SC2183,SC2046
  printf "%s.r%s.%s" \
    $(grep -zoP "(?s)^project\(.*?version: '\K.*?(?=(\+git)?',)" ${_pkgname}/meson.build|sed 's/-/./g'|tr -d '\0') \
    "$(git -C $_pkgname rev-list "$(git -C $_pkgname describe --abbrev=0)"..HEAD --count)" \
    "$(git -C $_pkgname log --pretty=format:'%h' -n 1)"
}

prepare() {
  git -C "$srcdir/gimp" config submodule.gimp-data.url "$srcdir/gimp-data"
  git -C "$srcdir/gimp" -c protocol.file.allow=always submodule update --init
}

build() {
  meson "${srcdir}/${_pkgname}"\
        "${srcdir}/build"\
        --prefix=/usr \
        -Dbug-report-url='https://github.com/bartoszek/AUR-gimp-git/issues'
  export NINJA_STATUS="[%p | %f<%r<%u | %cbps ] "
# shellcheck disable=SC2046 # allow MAKEFLAGS to split when passing multiple flags.
  ninja $(grep -oP -- '-+[A-z]+ ?[0-9]*'<<<"${MAKEFLAGS:--j1}") -C "${srcdir}/build"
}

check() {
  ninja -C "${srcdir}/build" test || true
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
  install -Dm 644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/2.99/palettes/Linux.gpl"
}
