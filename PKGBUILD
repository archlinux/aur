# This PKGBUILD is maintained at https://github.com/winged/aur-packages
# Dog icon by ecuabron ( https://openclipart.org/detail/204954/dog )

# Contributor: Fabio Comuni <fabrixxm@kirgroup.com>
# Maintainer: David Vogt <dave at winged dot ch>

pkgname=pugdebug-git
_pkgname=pugdebug-git
pkgver=v1.0.0.r20.g00859c3
pkgrel=2
pkgdesc="PugDebug is a standalone debugging client for PHP applications that uses XDebug as the debugging engine"
arch=('any')
license=('GPL3')
url="http://pugdebug.com/"
depends=('python>=3.4' 'python-pyqt5' 'python-pygments')
conflicts=()
provides=('pugdebug')
make_depends=('git' 'python-setuptools')
source=("$pkgname::git://github.com/robertbasic/pugdebug.git" 
	setup.py 
	PugDebug.desktop 
	https://openclipart.org/image/256px/svg_to_png/204954/dog.png)

md5sums=('SKIP'
         '7556a53bc966e1fd2a51ac8d7f61220f'
         '0a6f0a35199b4b0eccbd5291b180e553'
         '4a382fe99a6d4e9fafc5a047af77402b')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}	

build() {
	cp "${srcdir}/setup.py" "${srcdir}/${_pkgname}/"
	sed -i "s|:version:|${pkgver}|" "${srcdir}/${_pkgname}/setup.py"
}

package() {
	install -D -m655 "${srcdir}/PugDebug.desktop" "$pkgdir/usr/share/applications/PugDebug.desktop"
	
	install -D -m655 ${srcdir}/dog.png "$pkgdir/usr/share/pixmaps/pugdebug.png"
	
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="${pkgdir}"
	
	sed -i 's|#! python|#!/usr/bin/env python3|' app.py
	install -TD app.py "${pkgdir}/usr/bin/pugdebug"
	
	install -D -m655 LICENSE "${pkgdir}/usr/share/pugdebug/LICENSE"
	install -D -m655 COPYING "${pkgdir}/usr/share/pugdebug/COPYING"
}
