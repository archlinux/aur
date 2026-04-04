pkgname=gwyddion
pkgver=2.70
pkgrel=1
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
sha256sums=('942f4e041945a850bc32d05193a115ac8a5118a6f841afa6d4dea510f9913f59')

prepare() {
  cd "$pkgname-$pkgver"

  # Make sure core_perl is available
  export PATH="/usr/bin/core_perl:$PATH"

  # Generate the missing manpage so install doesn't fail
  (
    cd perl
    pod2man Gwyddion/dump.pm Gwyddion::dump.3pm
  )

  # Also remove the broken install target just in case
  sed -i '/install-data-local:/,+3d' perl/Makefile
}

build() {
  cd "$pkgname-$pkgver"

  # Ensure compiler can find unzip.h from minizip
  export CPPFLAGS="-I/usr/include/minizip"
  export CFLAGS="-I/usr/include/minizip $CFLAGS"

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --libexecdir=/usr/lib \
              --with-minizip \
              PYTHON=python2
  make PYTHON=python2
}

package() {
  cd "$pkgname-$pkgver"

  # Again ensure pod2man is in PATH when installing
  export PATH="/usr/bin/core_perl:$PATH"

  make DESTDIR="$pkgdir" GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 \
       PYTHON=python2 install
}
