# Maintainer:  Liam Timms <timms5000@gmail.com>
# Co-Maintainer: Adam Schadler <ajschadler12 g-mail>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: martin <martin pipegrep.co.uk>
pkgname=afni
pkgver=25.2.09
pkgrel=1
pkgdesc="An open-source environment for processing and displaying functional MRI data"
arch=("x86_64")
url="http://afni.nimh.nih.gov"
license=(custom)
depends=("r" "tcsh" "python" "gcc-libs" "gsl" "libxpm" "glu" "openmotif" "libjpeg-turbo" "libxmu" "libxft" "freeglut" "xorg-server-xvfb")
optdepends=('r-afex' 'r-phia' 'r-snow' 'r-lmertest' 'r-paran' 'r-psych' 'r-brms' 'r-corrplot' 'r-metafor')
source=("$pkgname-$pkgver.tar.gz::https://github.com/afni/afni/archive/AFNI_$pkgver.tar.gz"
        "Makefile.patch"
        "afni.csh"
        "afni.sh")
sha256sums=('ff6aacf8a4f2b0b60ea584ece08e23db665488bfb1978957f05f30df6c394e05'
            '70f525c0637581b332ae15f4076ac6626599296c99e33c133b0dd929a00b7f72'
            'b43c09b3ccc20c5c56ce837d7cd6baee3b880f9eeffaab51bfd086bdc5248c8b'
            '0322cef3fa43a0a63f6614d26a76b2f54bde70c12c7867952984c6db1935b87c')

prepare() {
  cd "$srcdir"/afni-AFNI_$pkgver/src
  cp Makefile.linux_openmp_64 Makefile
  patch -Np0 -i "$srcdir"/Makefile.patch
}

build() {
  cd "$srcdir"/afni-AFNI_$pkgver/src
  CPPFLAGS=""
  make -j1 vastness
}

package(){
  mkdir -p "$pkgdir"/opt
  cp -r "$srcdir"/build "$pkgdir"/opt/afni
  find "$pkgdir"/opt/afni -name \*.a -delete
  find "$pkgdir"/opt/afni -name \*.h -delete
  mkdir -p "$pkgdir"/usr/share/licenses/afni
  cp "$srcdir"/afni-AFNI_$pkgver/doc/README/README.copyright "$pkgdir"/usr/share/licenses/afni/LICENSE
  mkdir -p "${pkgdir}/etc/profile.d"
  cp "${srcdir}/afni.sh" "${pkgdir}/etc/profile.d"
  cp "${srcdir}/afni.csh" "${pkgdir}/etc/profile.d"
}
