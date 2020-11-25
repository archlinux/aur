# Maintainer: ActiveState Software Inc.
# Contributor: Mikhail f. Shiryaev <mr<dot>felixoid<at>gmail<dot>com>
pkgbase=komodo-pydbgp
pkgname=(python-pydbgp python2-pydbgp)
_srcrel=91869
_srcver=12.0.1
pkgver=${_srcver}.${_srcrel}
pkgrel=2
pkgdesc="The Komodo IDE Python Remote Debugging component"
arch=('x86_64')
url="http://code.activestate.com/komodo/remotedebugging/"
license=('MIT')
depends=()
makedepends=('python' 'python2')
source=("http://downloads.activestate.com/Komodo/releases/${_srcver}/remotedebugging/Komodo-PythonRemoteDebugging-${_srcver}-${_srcrel}-linux-${arch[*]}.tar.gz")
sha256sums=(217f13e51ea37e28714ef29c4a35c72e3c8fdf562610f8366702b103ffca2bf9)

build() {
  rm -rf "${srcdir}/source"
  cp -r "$srcdir/Komodo-PythonRemoteDebugging-${_srcver}-${_srcrel}-linux-${arch[*]}" "${srcdir}/source"
  cd "$srcdir/source"
  cp pydbgpproxy pydbgpproxy2
  mv pydbgp pydbgp2
  mv py3_dbgp pydbgp
  sed -i '1s:/usr/bin/env python:/usr/bin/env python2:' pydbgp2
  sed -i '1s:/usr/bin/env python:/usr/bin/env python2:' pydbgpproxy2
}

package_python-pydbgp() {
  depends=(python)
  # Terrible hack to get site-packages of current python
  local site_dir=$(python -c 'import site; print(site.getsitepackages()[0])')
  cd "$srcdir/source"
  mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/${site_dir}"
  cp pydbgp "${pkgdir}/usr/bin/"
  cp pydbgpproxy "${pkgdir}/usr/bin/"
  cp -r python3lib/dbgp  "${pkgdir}/${site_dir}"
}

package_python2-pydbgp() {
  depends=(python2)
  # Terrible hack to get site-packages of current python
  local site_dir=$(python2 -c 'import site; print(site.getsitepackages()[0])')
  cd "$srcdir/source"
  mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}/${site_dir}"
  cp pydbgp2 "${pkgdir}/usr/bin/"
  cp pydbgpproxy2 "${pkgdir}/usr/bin/"
  cp -r pythonlib/dbgp  "${pkgdir}/${site_dir}"
}
