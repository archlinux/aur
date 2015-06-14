# Maintainer: max-k <max-k@post.com>
# Contributor: max-k <max-k@post.com>

if [ $(uname -m) = "x86_64" ] ; then
_arch="x86_64"
else
_arch="x86"
fi

_major="9.1.0"
_minor=15798

pkgname="komodo-edit"
_bigname="Komodo-Edit"
pkgver="${_major}_${_minor}"
pkgrel=2
pkgdesc="Free & Open-Source counterpart of ActiveState Komodo IDE - XUL based"
arch=(i686 x86_64)
url="http://www.activestate.com/komodo-edit"
license=('MPL')
depends=('dbus-glib' 'glibc>=2.4' 'libjpeg>=6.2' 'gcc-libs' 'gtk2')
optdepends=('xterm: can be used by komodo-toolbox')
conflicts=('komodoedit' 'komodoedit-nightly' 'komodoedit-beta')
options=('!strip')

source=("http://downloads.activestate.com/Komodo/releases/${_major}/${_bigname}-${_major}-${_minor}-linux-${_arch}.tar.gz"
	"_install.py.patch" "activestate.py.patch")

if [ $_arch == "x86_64" ] ; then
 md5sums=('1843095021f103574fd2ab2ae831cdd9')
 sha256sums=('14a3e2220ec7bcdbc3422c423d90d06140043cefad7f52411c452dd774d3281f')
else
 md5sums=('b808e0e3df90401e5d10525368db1c6c')
 sha256sums=('27854d1cf60fc92bf36f2c780ca998918b0f76eb386f53206528737fae305c98')
fi
md5sums[1]='3f68d40c80d1baba291c3cd57d18f6c9'
sha256sums[1]='98177ee92e13036baa0a4f61ef398c0e23ab5d250cf7aa1b1c5a557efaaec3a8'
md5sums[2]='ac74c1495058f1b7429f03d95fcde75c'
sha256sums[2]='c68d7e94955e0f7b32cf3863136891d6441d9dd3a6346481b911d2c250cf32e9'

prepare() {
  cd ${srcdir}/${_bigname}-${_major}-${_minor}-linux-${_arch}
  sed -i "s/__VERSION__/${_major}-${minor}/" ${srcdir}/_install.py.patch
  sed -i "s/__VERSION__/${_major}-${minor}/" ${srcdir}/activestate.py.patch
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
  _dfile=${pkgdir}/opt/${pkgname}/share/desktop/${pkgname}-${_major:0:1}.desktop
  sed -i "s#${pkgdir}##" ${_dfile}
  install -Dm644 ${_dfile} ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -d ${pkgdir}/usr/bin
  ln -sf /opt/komodo-edit/bin/komodo ${pkgdir}/usr/bin/komodo
}
