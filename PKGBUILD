# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=python-opentimestamps-git
pkgver=r108.a8e9909
pkgrel=1
pkgdesc="Python3 library for working with the OpenTimestamps protocol"
arch=(any)
url="https://github.com/opentimestamps/python-opentimestamps"
license=('LGPL3')
depends=('python-python-bitcoinlib'
         'python-git')
source=(git+https://github.com/opentimestamps/python-opentimestamps)
md5sums=('SKIP')
_python_site=$(python -c 'import site; print(site.getsitepackages()[0]);')

pkgver() {
  cd ${pkgbase%-git}
  ( set -o pipefail
    git describe --long --tags | sed 's/^opentimestamps-client-v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd ${pkgbase%-git}
  install -dm755 "${pkgdir}/${_python_site}"
  cp -a opentimestamps "${pkgdir}/${_python_site}"
  python -m compileall "${pkgdir}/${_python_site}/opentimestamps"
  python -O -m compileall "${pkgdir}/${_python_site}/opentimestamps"
}
