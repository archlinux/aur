# Maintainer: Nikos Fytilis ( n-fit at live.com )
# $Id: PKGBUILD 191856 2016-10-10 11:09:38Z arcanis $
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: graysky
# Contributor: Tomasz Żok <tomasz dot zok at gmail dot com>

_pkgbase=pymol
pkgname=pymol2-mgtools2
pkgver=1.8.4.0
pkgrel=1
pkgdesc="Molecular visualization system on an Open Source foundation"
arch=('i686' 'x86_64')
url="http://pymol.org/"
license=('custom')
depends=('glew' 'glut' 'libgl' 'libxml2' 'python2-pmw-mgltools2' 'mgltools2')
makedepends=('desktop-file-utils' 'gendesk')
source=("http://downloads.sourceforge.net/project/pymol/pymol/1.8/pymol-v${pkgver}.tar.bz2"
        ${_pkgbase}.png::"https://c.fsdn.com/allura/p/pymol/icon"
        "${_pkgbase}-38899.patch"
        "apbstools_tcltk8.6.patch"
        'pymol.sh')
md5sums=('85451c40abc0a359a5ed91abd363b2c2'
         '0e9df23150d39cbcb8f79c38ce2a52e5'
         '1f8152c4604ba2939b24e25a022937ca'
         '138550367b74fd62a7c7bc48d339eb2d'
         'a6d59e509c823517550d313ca09c86dc')
#changelog=ChangeLog

prepare() {
  # create desktop file
  gendesk -f -n --pkgname "${_pkgbase}" --pkgdesc "${pkgdesc}" \
          --name="PyMOL Molecular Graphics System" \
          --categories="Science;Chemistry"

  # suppress non-zero exit code that breaks makepkg
  sed -i '/sys.exit/ s,2,0,' "${srcdir}/pymol/setup.py"
  # change python to python2
  find "${_pkgbase}" -name '*.py' -type f -exec \
       sed -i 's|env python|env pythonsh-mg|g' {} \;
  find "${_pkgbase}/test" -type f -exec \
       sed -i 's|bin/python|bin/pythonsh-mg|g' {} \;
  # fix FS#38899
  patch -p0 -i "${_pkgbase}-38899.patch"
  mv "${srcdir}/${_pkgbase}/modules/web" "${srcdir}/${_pkgbase}/modules/pymolweb"
  # fix FS#39526
  cd "${srcdir}/${_pkgbase}"
  patch -p0 -i "${srcdir}/apbstools_tcltk8.6.patch"
}

build() {
  cd "${srcdir}/${_pkgbase}"
  # required c++11
  export CPPFLAGS="$CPPFLAGS -std=c++11"
  pythonsh-mg setup.py build
}

package() {
  cd "${srcdir}/${_pkgbase}"
  pythonsh-mg setup.py install --prefix=/opt/mgltools2 --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
  install -Dm644 "${srcdir}/pymol.desktop" "${pkgdir}/usr/share/applications/pymol.desktop"
  install -Dm644 "${srcdir}/pymol.png" "${pkgdir}/usr/share/pixmaps/pymol.png"
  install -Dm755 "${srcdir}/pymol.sh" "${pkgdir}/usr/bin/pymol"
}

# vim:set ts=2 sw=2 et:
