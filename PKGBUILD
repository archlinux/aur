#!/hint/bash
# Maintainer : eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor : Victor Dmitriyev <mrvvitek@gmail.com>
# Contributor : bartus <scilab-aur@bartus.33mail.com>

_pkgname=scilab
_fragment="${FRAGMENT:-#branch=master}"
_ver_pop_commit="2797926fe5a3af91029ce4fc018ced0c286e6fe3"
pkgname=${_pkgname}-git
pkgver=6.2.0.r216.g81a9cc04933
pkgrel=1
pkgdesc='A scientific software package for numerical computations.'
arch=('i686' 'x86_64')
url='https://www.scilab.org'
license=('BSD' 'custom:CeCILL' 'GPL2')
depends=('suitesparse>=4.4.1' 'arpack' 'fftw' 'eigen'
         'hdf5' 'libmatio'
         'tk' 'bwidget'
         'curl' 'inetutils'
         'java-runtime>=8'
         'beanshell' 'eclipse-ecj' 'java-flexdock>=1.2.4' 'fop-hyph'
         'jeuclid-core' 'jgraphx-jre8' 'javahelp2'
         'saxon-he' 'jlatexmath-fop>=1.0.3' 'jrosetta>=1.0.4' 'jgoodies-looks' 'java-qdox'
         'java-skinlf' 'xalan-java' 'docbook-xsl'
         'jogl>=2.3.2' 'apache-lucene>=7'
         'java-batik>=1.8' 'java-xmlgraphics-commons>=2.0.1')
makedepends=('java-environment=8' 'ant>=1.9.0'
             'ocaml-findlib' 'ocaml-num' 'gcc-fortran'
             'time' 'git')
provides=('scilab')
conflicts=('scilab')
source=("git://git.scilab.org/scilab${_fragment}"
        "jogl-2.3.2.patch::http://gitweb.scilab.org/?p=scilab.git;a=patch;h=0c977dd8e334bf393e61f81f5fd19c48efc538c9"
        "ocaml-4.02.patch::http://gitweb.scilab.org/?p=scilab.git;a=patch;h=eb6b830cc812498a451f9d9b497b18bd4785eed5"
        "${_pkgname}-strict-jar.patch"
        "${_pkgname}-LD_LIBRARY_PATH.patch"
        "${_pkgname}-num.patch"
        "libxml.patch"
        "hdf5_18_api.patch"
         )
sha256sums=('SKIP'
            '2348c8badad19974174eac99d18f4583c838dd406265d686fa46b6c8c4d04cce'
            '2aec92a3a12e7c776856edcacbce5115cac784f4a946151d96bcf46d64f10e40'
            '38aa094951338fa1d267dc6f397552e175213b0f8ba7b35727c178607861f6dd'
            'a39277cb8cfc3d7929c73ce6d707dc24e3df4b8d8f2d587f075efebda79ff4db'
            '79c5f32bc2142f9861491787e8ee86d0b75f148141b176bae394ea360b8944d7'
            'c04114c4ef63d76bf898808e90c892de093fcc400a2371c7aa287b76c0c5d041'
            'f781c2919a0c14be5deed3a8b8866addd8de1171a06aacb96ef1e19535d0988e')

pkgver() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"
# Tags are dragging behind
# git describe --long --tags --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
  scilab_ver=$(printf "%d.%d.%d" $(grep -Po '^SCILAB_VERSION_(MAJOR|MINOR|MAINTENANCE)=\K.*' configure.ac))
  printf "%s.r%s.g%s" "$scilab_ver" "$(git rev-list --count $_ver_pop_commit..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  # https://codereview.scilab.org/#/c/17530/
  patch -p2 < "${srcdir}"/jogl-2.3.2.patch
  # https://codereview.scilab.org/#/c/20161/
  patch -p2 < "${srcdir}"/ocaml-4.02.patch
  # https://codereview.scilab.org/#/c/18089/
  patch -p0 < "${srcdir}"/${_pkgname}-strict-jar.patch
  # Fix path, to avoid the following error:
  # An error has been detected while loading /usr/share/scilab//modules/functions/.libs/libscifunctions.so: /usr/share/scilab//modules/functions/.libs/libscifunctions.so: cannot open shared object file: No such file or directory
  patch -p0 < "${srcdir}"/${_pkgname}-LD_LIBRARY_PATH.patch
  patch -p0 < "${srcdir}"/${_pkgname}-num.patch
  # libxml
  patch -p1 < "${srcdir}"/libxml.patch
  # hdf5_18_api
  patch -p1 < "${srcdir}"/hdf5_18_api.patch
}

build() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  ./configure \
    --prefix=/usr \
    --with-gcc \
    --with-gfortran \
    --with-mpi \
    --with-matio \
    --with-umfpack \
    --with-fftw \
    --with-modelica \
    --without-emf \
    --with-install-help-xml \
    --enable-build-help \
    --enable-build-localization \
    --disable-static-system-lib \
    --enable-silent-rules \
    --with-jdk=/usr/lib/jvm/java-8-openjdk/ \
    FFLAGS="-fallow-argument-mismatch" \
    CFLAGS="$CFLAGS -fcommon" \
    CXXFLAGS="$CXXFLAGS -fcommon" \

  make
  ((TRAVIS)) || make doc
}

package() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
  ((TRAVIS)) || make DESTDIR="${pkgdir}" install-data install-html

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 COPYING-BSD "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-BSD"
}

# vim:set ts=2 sw=2 et:
