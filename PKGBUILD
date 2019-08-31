# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=cpu-g-bzr
_pkgname=cpug
pkgver=r13
pkgrel=2
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
        'archlinux_logo.patch'
        'archlinux.png')
sha256sums=('SKIP'
            'dbe89f2fd631880dc2fd6239fc035fe16b91543a5a80acc57c2ec407d8e00a34'
            'f68ad58db224e87f193cae84cd2a8e41fa164c9a38156d2638a2f08a8a621158'
            '5badb15ab15f5b004c510f17622edb0a6c781b6f8dc8638e14e8d30f14d17c57')

pkgver() {
  cd "${_pkgname}"
  echo "r$(bzr revno)"
}

prepare() {
  cd "${_pkgname}"
  patch -p0 -i "${srcdir}/cpu-g_desktop.patch"
  # Add Arch Linux logo
  patch -p0 -i "${srcdir}/archlinux_logo.patch"
  install -m 644 -t "gfx/logos/distro_logo/" "${srcdir}/archlinux.png"
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
