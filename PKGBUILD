pkgname=gwyddion
pkgver=2.71
pkgrel=2
pkgdesc="A data visualization and processing tool for scanning probe miscroscopy (SPM, i.e. AFM, STM, MFM, SNOM/NSOM, ...) and profilometry, useful also for general image and 2D data analysis"
url="https://gwyddion.net/"
license=("GPL")
arch=('i686' 'x86_64')
depends=(gtkglext fftw pygtk minizip)
makedepends=('pkgconf' 'minizip')
optdepends=('libxml2: import of SPML and APE DAX data files'
            'zlib: import of SPML data files and import of gzip-compressed data from other file formats (Createc, NRRD, RHK SM4 PRM metadata)'
            'perl: development of plug-in'
            'ruby: development of plug-in'
            'fpc: development of plug-in'
            'gtksourceview2: Pygwy console syntax highlighting'
            'bzip2: import of bzip2-compressed data from NRRD'
            'libpng: export of height fields to 16bit greyscale PNG images and import from 16bit PNG images'
            'libwebp: WebP format support for the image export'
            'libzip: import of APE DAX, NanoObserver, NanoScanTech, OpenGPS and Sensofar PLUX data files'
            'cfitsio: import of Flexible Image Transport System (FITS) files'
            'openexr: import and export of OpenEXR HDR images'
            'hdf5: import of Ergo data files')
source=(https://downloads.sourceforge.net/sourceforge/gwyddion/$pkgname-$pkgver.tar.xz)
sha256sums=('2df721befccbe4d5ee2ba564b32e69341f8ce1de637e2045838a09a2d46b5dba')

build() {
  cd "$pkgname-$pkgver"

  # Ensure compiler can find unzip.h from minizip
  export CPPFLAGS="-I/usr/include/minizip ${CPPFLAGS}"
  export CFLAGS="-I/usr/include/minizip ${CFLAGS}"

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --libexecdir=/usr/lib --with-minizip \
              PYTHON=python2
  make PYTHON=python2
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 \
       PYTHON=python2 install
}
