# Maintainer: Tetsumi <tetsumi@vmail.me>
# Contributor: Edwin Marshall <emarshall85@gmail.com>

pkgname=python-sfml-git
pkgver=20150820
pkgrel=1
pkgdesc="The unofficial Python binding for SFML"
arch=('i686' 'x86_64')
url="http://python-sfml.org"
license=('LGPL')
depends=('sfml' 'python')
conflicts=('python-sfml2-git' 'python-sfml')
provides=('python-sfml')
makedepends=('cython' 'git')
source=()
md5sums=() 
_gitroot='https://github.com/Sonkun/python-sfml.git'
_gitname='python-sfml'

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	python setup.py build_ext
}

package() {
	cd "$srcdir/$_gitname-build"
	python setup.py install --root="${pkgdir}" --prefix=/usr

	# Copying the License file
	install -D -m644 "$srcdir/$_gitname-build/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
