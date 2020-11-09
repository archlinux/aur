# Maintainer: Nathan Rijksen <nathanr+aur@activestate.com>
# Contributor: max-k <max-k@post.com>
# Based on https://aur.archlinux.org/packages/komodo-edit (by max-k)

if [ $(uname -m) = "x86_64" ] ; then
_arch="x86_64"
else
_arch="x86"
fi

_major="12.0.1"
_minor=91869

pkgname="komodo-ide"
_bigname="Komodo-IDE"
pkgver="${_major}_${_minor}"
pkgrel=1
pkgdesc="Code smarter and faster with the leading IDE for today's major web languages, including Python, PHP, Node.js, Perl, Go and Ruby.  - XUL based"
arch=(i686 x86_64)
url="http://www.activestate.com/komodo-ide"
license=('custom')
depends=('dbus-glib' 'glibc>=2.4' 'libjpeg-turbo' 'gcc-libs' 'gtk2')
optdepends=('xterm: can be used for running certain commands')
#options=('!strip')

source=('_install.py.patch' 'activestate.py.patch')
_srcbase="http://downloads.activestate.com/Komodo/releases"
source_i686=("${_srcbase}/${_major}/${_bigname}-${_major}-${_minor}-linux-x86.tar.gz")
source_x86_64=("${_srcbase}/${_major}/${_bigname}-${_major}-${_minor}-linux-x86_64.tar.gz")

sha256sums=('beb35ae529bffd998784bc1e51468bf5bf64e5d8f84e3eb2c4af07c8807b101a'
            '7f6efb3d3b8959b9a85aa7056094932686b3aea60880a06a559cf12e1f2e6231')
sha256sums_i686=('d00eaaec20eed86a6d7592bc47aba69934bedb1481a590fb72d20944b50e1c5d')
sha256sums_x86_64=('5c2735e9a323ffe290425e5066dd6f72f11e5d58d732411e6648a685725e055a')

prepare() {
  cd ${srcdir}/${_bigname}-${_major}-${_minor}-linux-${_arch}
  sed -i "s/__VERSION__/${_major}-${_minor}/" ${srcdir}/_install.py.patch
  sed -i "s/__VERSION__/${_major}-${_minor}/" ${srcdir}/activestate.py.patch
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
  _dfile=${pkgdir}/opt/${pkgname}/share/desktop/${pkgname}-${_major:0:2}.desktop
  sed -i "s#${pkgdir}##" ${_dfile}
  install -Dm644 ${_dfile} ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -d ${pkgdir}/usr/bin
  if [ -e ${pkgdir}/usr/bin/komodo ]
  then
    echo "${pkgdir}/usr/bin/komodo already exists, skipping symlink"
  else
    ln -sf /opt/${pkgname}/bin/komodo ${pkgdir}/usr/bin/komodo
  fi
}
