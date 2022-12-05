# Maintainer: otaj
#
# Thanks to Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com> for
# his PKGBUILD that served as a base for this one

_pkgbase="visdom"
pkgname=python-visdom-git
pkgver=0.2.3.r24.g56f72f7
pkgrel=1
arch=(any)
url='https://github.com/facebookresearch/visdom'
pkgdesc='Visualization tool for Pytorch by Facebook'
license=(Apache)
depends=('python-websocket-client' 'python-numpy' 'python-scipy' 'python-requests' 'python-tornado' 'python-pyzmq' 'python-six' 'python-jsonpatch' 'python-pillow' 'python-networkx')
makedepends=(
  'git'
  'python-setuptools'
)
options=(!emptydirs)
source=("git+https://github.com/facebookresearch/visdom.git" "visdom.conf" "visdom.group.conf")
provides=('python-visdom')
conflicts=('python-visdom')
install='visdom.install'
sha256sums=('SKIP'
            '3df45ac54962cac4425bcd6ff9f118d851e0fe2dbc9cfd54089d8ae46e9fecbf'
            'd71fbfa6bb3feecfb1997a459da196f8a2f0f50b33428043921803d97db5562c')

pkgver() {
  cd "${_pkgbase}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//g'
}

package() {
  cd "${srcdir}/${_pkgbase}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${srcdir}/${_pkgbase}.group.conf" "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.group.conf"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  sed -i "s;{site};$site_packages;g" "${srcdir}/${_pkgbase}.conf"
  install -Dm 644 "${srcdir}/${_pkgbase}.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
}
