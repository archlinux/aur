# Maintainer: Blake Dickie <gentro_silva@shaw.ca>
pkgname=pdfmasher
pkgver=0.7.4
pkgrel=2
pkgdesc="PDF to eBook Conversion Tool"
arch=(any)
url="http://www.hardcoded.net/pdfmasher/"
license=('GPL')
depends=('python' 'python-pyqt4' 'python-cssutils' 'python-lxml' 'python-markdown' 'python-cssselect')
makedepends=('git')
source=()
md5sums=()


build() {

	cd "$srcdir"
	msg "Connecting to Git server...."
	
	if [[ -d "$pkgname" ]]; then
		cd "$pkgname"
		git pull
		msg "The local files are updated."
	else
		git clone "https://github.com/hsoft/pdfmasher.git" "$pkgname"
		cd "$pkgname"
	fi
	
	msg "Git checkout done or server timeout"
	
	msg "Switching to Production Tag"
	# NOTE: The "-arch" suffix is temporary. Recent fixes have been made upstream to make Arch
	# packaging easier, but there wasn't a release with these changes yet, so I've made a special
	# "arch" tag in the upstream repo. After the next release, we can remove that suffix.
	git checkout "$pkgver"-arch

  source bootstrap.sh
  source env/bin/activate
		
	msg "Starting build..."
	python configure.py
	python build.py --clean
}

package() {
	cd "$srcdir/$pkgname"
	
	mkdir -p "${pkgdir}/usr/share/applications"
	cp debian/pdfmasher.desktop "${pkgdir}/usr/share/applications"
	
	python package.py --arch-pkg
	cd "build/pdfmasher-arch"
	
	mkdir -p "$pkgdir/usr/share/pdfmasher"
	cp -a * "$pkgdir/usr/share/pdfmasher/"
	install -dm755 "${pkgdir}/usr/share/pdfmasher"
	chmod a+x "$pkgdir/usr/share/pdfmasher/run.py"
	
	mkdir -p "$pkgdir/usr/bin"
	ln -s ../share/pdfmasher/run.py "$pkgdir/usr/bin/pdfmasher"
}

# vim:set ts=2 sw=2 et: 
