# Maintainer: Dario Bosch <LastnameFirstname at gmail dot com>

pkgname=mrtrix3
pkgver=r6677.fce21191
pkgrel=1
pkgdesc="tools for diffusion MRI analyses, data conversion and a viewer (mrview)"
arch=('x86_64')
url="https://github.com/MRtrix3/${pkgname}"
license=('MPL2')

depends=(
         # 'zlib' # already installed as dependency of python
         # 'qt5-base' # already installed as dependency of qt5-svg
         'qt5-svg'
         'python'
        )

optdepends=(
            'libtiff'
            'fftw'
           )

makedepends=(
          'gcc'
          'git'
          'eigen'
)

provides=('mrtrix3')
conflicts=('mrtrix3')

source=("${pkgname}-git::git+https://github.com/MRtrix3/${pkgname}#commit=$(cut -d'.' -f2 <<< ${pkgver})")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}-git"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	# Set CPU architecture to the building system's architecture
	export ARCH=native
	cd "${pkgname}-git"
	./configure
	./build
}

package() {
  	cd "${pkgname}-git"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib"
  	cp -R ./bin/* "$pkgdir/usr/bin"
	cp -R ./lib/* "$pkgdir/usr/lib"
	chmod -R 755 "$pkgdir/usr/bin"
	chmod -R 755 "$pkgdir/usr/lib"
}
