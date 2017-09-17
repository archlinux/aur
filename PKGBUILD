# Maintainer: Stefan Swerk <stefan_aur@swerk.priv.at>
pkgname=python2-pynntp-git
_reponame="pynntp"
pkgver=0.8.4.r4.g991a763
pkgrel=1
pkgdesc="Python NNTP library"
arch=('any')
url="https://github.com/greenbender/${_reponame}"
license=('GPL')
depends=('python2' 'python2-dateutil')
makedepends=(git)
provides=('python2-pynntp')
conflicts=('python2-pynntp')
options=(!emptydirs)
source=("${_reponame}"::"git+https://github.com/greenbender/${_reponame}")
sha512sums=('SKIP')

pkgver() {
  cd "$_reponame"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_reponame"

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd "$_reponame"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
