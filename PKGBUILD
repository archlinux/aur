# Maintainer: max-k <max-k@post.com>
# Contributor: max-k <max-k@post.com>

if [ $(uname -m) = "x86_64" ] ; then
_arch="x86_64"
else
_arch="x86"
fi

_major="10.1.1"
_minor=17414

pkgname="komodo-edit"
_bigname="Komodo-Edit"
pkgver="${_major}_${_minor}"
pkgrel=1
pkgdesc="Free & Open-Source counterpart of ActiveState Komodo IDE - XUL based"
arch=(i686 x86_64)
url="http://www.activestate.com/komodo-edit"
license=('MPL')
depends=('dbus-glib' 'glibc>=2.4' 'libjpeg-turbo' 'gcc-libs' 'gtk2')
optdepends=('xterm: can be used by komodo-toolbox')
conflicts=('komodoedit')
options=('!strip')

source=('_install.py.patch' 'activestate.py.patch')
source_i686=("http://downloads.activestate.com/Komodo/releases/${_major}/${_bigname}-${_major}-${_minor}-linux-x86.tar.gz")
source_x86_64=("http://downloads.activestate.com/Komodo/releases/${_major}/${_bigname}-${_major}-${_minor}-linux-x86_64.tar.gz")

sha256sums=('98177ee92e13036baa0a4f61ef398c0e23ab5d250cf7aa1b1c5a557efaaec3a8'
            'c68d7e94955e0f7b32cf3863136891d6441d9dd3a6346481b911d2c250cf32e9')
sha256sums_i686=('323d5cdf3d2c01f4f880ee03218cbb49681a7871e4e54a0ecd68f4151628d1db')
sha256sums_x86_64=('05a6e1683b9734079fd9a106c37640977b54a79937fd6e37f900b383f9434b91')

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
  ln -sf /opt/komodo-edit/bin/komodo ${pkgdir}/usr/bin/komodo
}
