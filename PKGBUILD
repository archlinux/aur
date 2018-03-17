# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=heekscnc-git
pkgver=1155.bec9dfa
pkgrel=1
pkgdesc="CAM add-on for HeeksCAD"
arch=('x86_64')
url="http://heeks.net"
license=('custom:BSD3')
depends=('heekscad-git')
makedepends=('cmake')
source=('git://github.com/Heeks/heekscnc.git' grbl.py)
provides=('heekscnc')
conflicts=('heekscnc')
md5sums=('SKIP'
         '05033d96056948b45059df301216a42d')

pkgver() {
  cd "${srcdir}/heekscnc"
  #echo $(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/heekscnc"

  # add grbl support
  cp ../grbl.py nc/.
  echo '<Machine post="grbl" reader="iso_read" suffix=".ngc" description="GRBL"/>' >> nc/machines.xml

  # fix hardcoded call to python
  sed -i 's,Execute(wxString(_T("python \\"")) + path + wxString(_T("backplot\.py\\" \\"")) + m_program->m_machine\.reader + wxString(_T("\\" \\"")) + m_filename + wxString(_T("\\"")) );,Execute(wxString(_T("python2 \\"")) + path + wxString(_T("backplot\.py\\" \\"")) + m_program->m_machine\.reader + wxString(_T("\\" \\"")) + m_filename + wxString(_T("\\"")) );,g' src/PythonStuff.cpp
  sed -i 's,wxString post_path = wxString(_T("python ")) + path.GetFullPath();,wxString post_path = wxString(_T("python2 ")) + path.GetFullPath();,g' src/PythonStuff.cpp
}

build() {
  msg "Starting build..."
  cd "${srcdir}/heekscnc"
  mkdir -p build
  cd build
  export OCE_DIR="/opt/oce/lib/oce-0.18"
  cmake -DwxWidgets_CONFIG_EXECUTABLE="/usr/bin/wx-config" -DPYTHON_EXECUTABLE="/usr/bin/python2" -DPYTHON_LIBRARY="/usr/lib/libpython2.7.so" -DPYTHON_INCLUDE_DIR="/usr/include/python2.7" -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd "$srcdir/heekscnc/build"
  make DESTDIR="$pkgdir/" install

  mkdir -p "${pkgdir}/usr/share/licenses"
  cp "${srcdir}/heekscnc/COPYING" "${pkgdir}/usr/share/licenses/$pkgname"
}
