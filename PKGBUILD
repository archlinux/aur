#Maintainer: pigt <pay2630@gmail.com>
pkgname="injection-git"
pkgver=0.9.1
pkgrel=1
pkgdesc="A Python-based ASCII programming-puzzle game."
arch=('i686' 'x86_64')
url="https://schilcote.itch.io/injection"
license=('MIT')
conflicts=('injection')
depends=('python-pygame' 'python-pyperclip' 'python-rsa' 'python-numpy' 'cython' 'python-cx_freeze' 'tk' 'python-dill')
makedepends=('unzip' 'mercurial' 'python-pip')

#Hack!.
#We use git for source code and itch.io for assets.
#Once bug has been fix on itch.io's version we will remmove this hack.
_assetsurl="https://schilcote.itch.io/injection/file/204814?after_download_lightbox=true"
#copy this line from 'after school''s PKGFILE :). Retrieve link
_assetsfileurl=$(curl -s -XPOST "${_assetsurl}" | grep -Po '"url":.*?[^\\]",' | cut -c8- | rev |cut -c3- | rev | sed 's/\\\//\//g')

source=('INJECTION::git+https://gitlab.com/pigt/INJECTION.git#branch=linux' "assets-zip::${_assetsfileurl}" injection )
md5sums=('SKIP'
         '0de9c43a1ddf0cba99c1c1487cbd0aa2'
         '7fe31301e96a3aab3bc06cbef74474c2')

prepare() {
	#Copy assets.
	cp -r "INJECTION_${pkgver}_src/music/" "INJECTION"
}

build() {
	cd "INJECTION"
	#Build custom pip dependency.
	mkdir injectionenv
	pip install --root $(pwd)/injectionenv pymsgbox pygcurse
	export PYTHONPATH=$PYTHONPATH:$(pwd)/injectionenv/usr/lib/python3.5/site-packages
	#Build fx
	python setup.py build_ext
	cp build/lib*/* ./
	#clean
	rm -r build
}

package() {
	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/usr/bin
	cp -r "INJECTION" $pkgdir/usr/lib/$pkgname
	install -m755 $srcdir/injection $pkgdir/usr/lib/$pkgname/injection
	ln -s /usr/lib/$pkgname/injection $pkgdir/usr/bin/injection
	install -D -m644 $srcdir/INJECTION/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
