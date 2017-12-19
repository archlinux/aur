# Maintainer: max-k <max-k@post.com>
# Contributor: max-k <max-k@post.com>

if [ $(uname -m) = "x86_64" ] ; then
_arch="x86_64"
else
_arch="x86"
fi

_major="11.0.1"
_minor=18119

pkgname="komodo-edit"
_bigname="Komodo-Edit"
pkgver="${_major}_${_minor}"
pkgrel=2
pkgdesc="Free & Open-Source counterpart of ActiveState Komodo IDE - XUL based"
arch=(i686 x86_64)
url="http://www.activestate.com/komodo-edit"
license=('MPL')
depends=('dbus-glib' 'glibc>=2.4' 'libjpeg-turbo' 'gcc-libs' 'gtk2')
optdepends=('xterm: can be used by komodo-toolbox')
conflicts=('komodoedit')
options=('!strip')

source=('_install.py.patch' 'activestate.py.patch')
_srcbase="http://downloads.activestate.com/Komodo/releases"
source_i686=("${_srcbase}/${_major}/${_bigname}-${_major}-${_minor}-linux-x86.tar.gz")
source_x86_64=("${_srcbase}/${_major}/${_bigname}-${_major}-${_minor}-linux-x86_64.tar.gz")

sha256sums=('98177ee92e13036baa0a4f61ef398c0e23ab5d250cf7aa1b1c5a557efaaec3a8'
            'c68d7e94955e0f7b32cf3863136891d6441d9dd3a6346481b911d2c250cf32e9')
sha256sums_i686=('237a52dcdb6b5b922e6baf430758a25b780dc5a12695fd870236c2a29e8a9a6c')
sha256sums_x86_64=('18fbb2c38fc09485122854badf7f65852ce56cbb0e5fdffda37c8f53d47a36d7')

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
