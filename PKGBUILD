# Maintainer: Nathan Rijksen <nathanr+aur@activestate.com>
# Contributor: max-k <max-k@post.com>
# Based on https://aur.archlinux.org/packages/komodo-edit (by max-k)

if [ $(uname -m) = "x86_64" ] ; then
_arch="x86_64"
else
_arch="x86"
fi

pkgname="komodo-ide-nightly"
_bigname="Komodo-IDE"
_body=$(curl -s http://downloads.activestate.com/Komodo/nightly/komodoide/latest/ | grep -ioE "Komodo-IDE-.{6,7}-.{5}-linux-x86_64.tar.gz")
_major=$(echo $_body | sed -n 's/.*\([0-9.]\{6,7\}\).*/\1/p')
_minor=$(echo $_body | sed -n 's/.*\([0-9]\{5\}\).*/\1/p')
pkgver="${_major}_${_minor}"
pkgrel=1
pkgdesc="Code smarter and faster with the leading IDE for today's major web languages, including Python, PHP, Node.js, Perl, Go and Ruby.  - XUL based"
arch=(i686 x86_64)
url="http://www.activestate.com/komodo-ide"
license=('custom')
depends=('dbus-glib' 'glibc>=2.4' 'libjpeg-turbo' 'gcc-libs' 'gtk2')
optdepends=('xterm: can be used for running certain commands')
options=('!strip')

source=('_install.py.patch' 'activestate.py.patch')
_srcbase="http://downloads.activestate.com/Komodo/nightly/komodoide/latest/link/"
source_i686=("${_srcbase}/Komodo-IDE-linux-x86.tar.gz")
source_x86_64=("${_srcbase}/Komodo-IDE-linux-x86_64.tar.gz")

sha256sums=('SKIP'
            'SKIP')
sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')

prepare() {
  cd ${srcdir}/${_bigname}-${_major}-${_minor}-linux-${_arch}
  if [ $_arch == "x86_64" ] ; then
    sed -i "s/__ARCH__/x86_64/" ${srcdir}/_install.py.patch
    sed -i "s/__ARCH__/x86_64/" ${srcdir}/activestate.py.patch
  else
    sed -i "s/__ARCH__/x86/" ${srcdir}/_install.py.patch
    sed -i "s/__ARCH__/x86/" ${srcdir}/activestate.py.patch
  fi
  patch -p0 -i ${srcdir}/_install.py.patch support/_install.py
  patch -p0 -i ${srcdir}/activestate.py.patch INSTALLDIR/lib/python/lib/python*.*/activestate.py
}

build() {
  echo "" > /dev/null
}

package() {
  cd ${srcdir}/${_bigname}-${_major}-${_minor}-linux-${_arch}
  ./install.sh -v -s -I ${pkgdir}/opt/${pkgname} --dest-dir /opt/${pkgname} 2>&1 > /dev/null
  _dfile=${pkgdir}/opt/${pkgname}/share/desktop/komodo-ide-${_major:0:2}-nightly.desktop
  sed -i "s#${pkgdir}##" ${_dfile}
  install -Dm644 ${_dfile} ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -d ${pkgdir}/usr/bin
  ln -sf /opt/${pkgname}/bin/komodo ${pkgdir}/usr/bin/komodo
}
