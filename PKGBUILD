# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: Hugo Doria <hugodoria@gmail.com>

pkgname=listen
pkgver=0.6.5
pkgrel=14
pkgdesc="Music player and management for GNOME"
arch=('i686' 'x86_64')
url="https://launchpad.net/listen"
license=('GPL2')
depends=('python2-egg' 'python2-libgnome' 'mutagen' 'desktop-file-utils'
         'gnome-icon-theme' 'gstreamer0.10-python' 'pyxdg'
         'pywebkitgtk' 'python2-pyinotify' 'gstreamer0.10-good-plugins' 'dbus-python')
makedepends=('intltool' 'docbook2x' 'docbook-xml')
optdepends=('python2-musicbrainz2: musicbrainz & cd support'
            'libgpod: iPod support'
            'python-daap: DAAP support'
            'tunepimp: tagging support')
install=listen.install
source=("https://launchpad.net/listen/0.6/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('23a4d33ef3251c529ac9a78d992557a2498fa05b825e76c9ab4bad431ed6c61a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  chmod +x mmkeys/setup.py

  # Fix command name
  sed -i 's/docbook2x-man/docbook2man/' Makefile

  # Point Python scripts to the python2 binary
  sed -i -e 's/python -/python2 -/' \
         -e 's/PYTHON  = python$/\02/' \
    Makefile
  sed -i 's/env python$/env python2/' mmkeys/setup.py
  sed -i 's|/usr/bin/python|/usr/bin/python2|' src/listen

  make CHECK_DEPENDS=0 PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
