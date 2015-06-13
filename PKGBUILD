# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=cpu-g-bzr
_pkgname=cpug
pkgver=r13
pkgrel=1
epoch=1
pkgdesc="An application that shows useful information about your CPU, Motherboard and some general information about your system."
url="http://cpug.sourceforge.net/"
license=('GPL3')
arch=('any')
depends=('python' 'pygtk' 'pciutils' 'hicolor-icon-theme')
optdepends=('mesa-demos: get information about the graphic driver and OpenGL support')
makedepends=('bzr')
provides=('cpu-g')
conflicts=('cpu-g')
source=('bzr+lp:/cpug'
        'cpu-g_desktop.patch'
        'xorg_version.patch')
sha256sums=('SKIP'
            'dbe89f2fd631880dc2fd6239fc035fe16b91543a5a80acc57c2ec407d8e00a34'
            '6a3af8148005bb255591681fc8a32568c07eee705012116f8a80a356130fcc42')
install="${pkgname}.install"

pkgver() {
  cd "${_pkgname}"
  echo "r$(bzr revno)"
}

prepare() {
  cd "${_pkgname}"
  patch -p0 -i "${srcdir}/cpu-g_desktop.patch"
  patch -p0 -i "${srcdir}/xorg_version.patch"
}

package() {
  cd "${_pkgname}"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr

  # Create further directories (setup.py is not complete enough)
  install -d "${pkgdir}/usr/share/man/man1"

  # Copying files
  cp -r "gfx" "${pkgdir}/usr/share/${_pkgname}"

  # Copying icons
  for _size in 48 128
  do
    install -m 755 -d "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps"
    install -m 644 "icon-${_size}.png" "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/cpu-g.png"
  done
  # Remove pixmaps folder
  rm -rf "${pkgdir}/usr/share/pixmaps"

  # Compress and install the man page
  gzip -cf9 "doc/cpu-g.1" > "doc/cpu-g.1.gz"
  install -Dm644 "doc/cpu-g.1.gz" "${pkgdir}/usr/share/man/man1/"
  [ -e "doc/cpu-g.1.gz" ] && rm "doc/cpu-g.1.gz"
 
  # Rename the main script
  mv "${pkgdir}/usr/bin/cpu-g.py" "${pkgdir}/usr/bin/cpu-g"
}
