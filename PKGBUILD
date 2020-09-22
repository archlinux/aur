# Maintainer: Vincent von Schelm <aur at vncnt dot eu>

pkgname=('infrared-git')
pkgName=('Infrared-git')
pkgver=0.3.r7.gec411b9
pkgrel=1
pkgdesc="A generic C++/Python hybrid library for efficient (fixed-parameter tractable) Boltzmann sampling."
arch=('x86_64')
url="https://github.com/s-will/Infrared/"
license=('GPL3')
groups=('viennarna-package')
depends=('htd'
         'boost-libs'
         'python-rna')
makedepends=('git'
             'boost'
             'doxygen')
provides=('libinfrared.so' 'libhtdwrap.so' 'redprint.py')
conflicts=('infrared')
source=("Infrared::git+${url}#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "${pkgName%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgName%-git}"
	#sed -ie '/PYTHON_VERSION/s/3.6/3.8/g' configure.ac
	autoreconf -i
}

build() {
  cd "${pkgName%-git}"
	./configure --with-htd=/usr --with-boost-python --prefix=/usr
	make
	make doxygen-doc
}

check() {
  cd "${pkgName%-git}"
	
}

package() {
	cd "${pkgName%-git}"
	make DESTDIR="$pkgdir" install
	
	# symlink to python site-packages
	local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
	mkdir -p "${pkgdir}${site_packages}" 
	ln -st "${pkgdir}${site_packages}" /usr/lib/libhtdwrap.so /usr/lib/libinfrared.so
}
