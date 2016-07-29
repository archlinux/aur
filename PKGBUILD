# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>

_pkgname=scilab
pkgname=scilab-git
pkgver=6.0.0.beta.2.r107.g742e0b0
pkgrel=1
pkgdesc='A scientific software package for numerical computations'
arch=('i686' 'x86_64')
url="https://www.scilab.org/"
license=('custom:CeCILL' 'BSD')
makedepends=('apache-ant' 'git' 'ocaml' 'java-environment>=8' 'gcc-fortran')
depends=('suitesparse>=4.4.1'  'arpack' 'fftw' 'eigen'
         'libmatio' 'tk' 'curl'
         'hdf5_18'
         'java-runtime>=8'
         'beanshell2' 'eclipse-ecj' 'java-flexdock>=1.2.4' 'fop-hyph'
         'java-freehep-vectorgraphics' 'jeuclid-core' 'jgraphx>=2.0.0.1' 'javahelp2'
         'saxon-he' 'jlatexmath-fop>=1.0.3' 'jrosetta>=1.0.4' 'jgoodies-looks' 'java-qdox'
         'java-skinlf' 'java-testng' 'xalan-java' 'docbook-xsl'
         'jogl>=2.3.2' 'java-batik>=1.8')
provides=('scilab')
conflicts=('scilab')
source=("git://git.scilab.org/scilab"
        "${pkgname}_strict-jar.patch"
        "${pkgname}_jogl.patch::http://gitweb.scilab.org/?p=scilab.git;a=patch;h=db79126ed25fc254e83f8a96b164cb2dbf0d6204"
        "${pkgname}_java-default-dir.patch")
sha256sums=('SKIP'
            '38aa094951338fa1d267dc6f397552e175213b0f8ba7b35727c178607861f6dd'
            '7777f0e5fedb3f71f8869a20c448f139501caab17537786db37b999d5c76e618'
            'a2eb7888bf52862fdba300e113667ad4d3f95512dbf1a99b661eb54b68038948')
pkgver() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare(){
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  # https://codereview.scilab.org/#/c/17530/
  patch -p2 < "${srcdir}"/${pkgname}_jogl.patch
  # Linked to: https://codereview.scilab.org/#/c/18089/
  patch < "${srcdir}"/${pkgname}_strict-jar.patch
  # Fix path for Java
  patch -p1 < "${srcdir}"/${pkgname}_java-default-dir.patch
}

build() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  ./configure \
    --prefix=/usr \
    --with-gcc \
    --with-gfortran \
    --with-hdf5-include=/usr/include/hdf5_18 \
    --with-hdf5-library=/usr/lib/hdf5_18 \
    --with-jdk=/usr/lib/jvm/java-8-openjdk \
    --with-mpi \
    --with-matio \
    --with-umfpack \
    --with-fftw \
    --without-modelica \
    --with-install-help-xml \
    --enable-build-help \
    --enable-build-localization \
    --disable-static-system-lib

  make
  make doc
}

package() {
  cd "${srcdir}/scilab/scilab"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "$srcdir/scilab/scilab/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "$srcdir/scilab/scilab/COPYING-FR" "$pkgdir/usr/share/licenses/${pkgname}/COPYING-FR"
  install -Dm644 "$srcdir/scilab/scilab/COPYING-BSD" "$pkgdir/usr/share/licenses/${pkgname}/COPYING-BSD"
}

# vim:set ts=2 sw=2 et:
