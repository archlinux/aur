# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Connor Behan <connor.behan@gmail.com>
# and patches from http://sources.gentoo.org/viewcvs.py/gentoo-x86/sci-visualization/grace/
# AUR Category: science

pkgname=grace-openmotif
pkgver=5.1.25
pkgrel=2
pkgdesc="2D plotting tool"
arch=(i686 x86_64)
url="http://plasma-gate.weizmann.ac.il/Grace/"
depends=('libjpeg' 'libpng' 'openmotif' 't1lib' 'zlib' 'netcdf' 'xbae' 'pdflib-lite' 'xdg-utils')
replaces=('grace')
conflicts=('grace')
provides=('grace')
license=('GPL')
# patches
# mkstemp.patch : move tmpnam to mkstemp (adapted from debian)
# netcdf_fftw2.patch : fix configure instead of aclocal.m4
# fortran.patch : fix for missing defines when fortran is disabled
# dlmodule.patch pdfdrv.patch : fix a leak and pdf driver (from freebsd)
source=(ftp://plasma-gate.weizmann.ac.il/pub/grace/src/grace5/grace-$pkgver.tar.gz \
        mkstemp.patch \
        netcdf_fftw2.patch \
        fortran.patch \
        dlmodule.patch \
        pdfdrv.patch \
	longer_formulas.patch \
	default_comment.patch \
	meaningful_timestamp.patch \
	handle_nans.patch \
        grace.png \
	grace-mimetypes \
        grace.desktop)


build() {
  cd "$srcdir"/grace-$pkgver
  grep -rl "'H', TRUE" src | xargs sed -i -e "s/'H', TRUE/'H', FALSE/g"

# patch -Np1 < ../netcdf_fftw2.patch
  patch -Np1 < ../mkstemp.patch
  patch -Np1 < ../fortran.patch
  patch -Np1 < ../dlmodule.patch
  patch -Np1 < ../pdfdrv.patch
  patch -Np1 < ../longer_formulas.patch
  patch -Np1 < ../default_comment.patch
  patch -Np1 < ../meaningful_timestamp.patch
  patch -Np1 < ../handle_nans.patch
  
  ./configure   --prefix=/usr --exec-prefix=/usr \
                --enable-grace-home=/usr/share/grace \
                --disable-xmhtml \
                --without-bundled-xbae \
                --without-bundled-t1lib \
                --with-fftw \
                --with-f77=/usr/bin/gfortran \
                --with-helpviewer="xdg-open %s" \
                --with-editor="xdg-open %s" \
                --with-printcmd="lpr"
#		--with-fftw-library=/usr/lib/libdfftw.a

  make
}

package() {
  cd "$srcdir"/grace-$pkgver
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr/share/grace && mv bin ../../

  # Desktop integration
  install -D -m644 "$srcdir/grace.png" \
          "$pkgdir/usr/share/pixmaps/grace.png"

  install -D -m644 "$srcdir/grace.desktop" \
          "$pkgdir/usr/share/applications/grace.desktop"

  install -D -m644 "$srcdir/grace-mimetypes" "$pkgdir/usr/share/mime/packages/grace.xml"
}

md5sums=('c0482b1f18b113192946a96f5ff35a4d' 'cc9183f093cfb4da3327e725ba574f4a' '28735e961bd0adf61810cda1932de034' '03702b4503676fb14dbb9afe003f0b8c' 'ca0dae0fde7ec34acbd73a2fae04e656' '7715ca2b98be6c9bc4e28ab30c9ee069' '35ed21fed6db617c053ca15deccaca8c' 'ecb013fe77b5aa4d6d8eeb009bff7213' '9ec0b3945719528bb7bcd948d5078080' 'abc9f5ebc490e7049c30208dc5fb9835' '0ccd7a766cb0c84934b60c264d1a1e41' '3beba5237f56a2ff28b6cd878865b25c' '3b84533b7d54b4705232f4dfa0923c58')
