# Maintainer  : Jan Was < janek.jan AT gmail DOT com >
# Contributor : Dan Vratil <dan@progdan.cz>
# Contributor  : andy123 < ajs AT online DOT de >

pkgname=lib32-boost-libs
pkgver=1.51.0
_boostver=1_51_0
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries - Runtime (32
bit)"
arch=('x86_64')
url="http://www.boost.org"
license=('custom')
groups=('lib32')
depends=('lib32-bzip2' 'lib32-zlib' 'lib32-gcc-libs')
makedepends=('icu' 'gcc-multilib')
source=(http://downloads.sourceforge.net/sourceforge/boost/boost_${_boostver}.tar.gz)
md5sums=('6a1f32d902203ac70fbec78af95b3cf8')
sha1sums=('8f8e2b2450a7167051b066866fc249fea6f82dbe')




_stagedir="${srcdir}/stagedir"

build()
{
  export CC="gcc"
  export CFLAGS="-m32"
  export CXX="g++"
  export CXXFLAGS="-m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  # set python path for bjam
  cd "${srcdir}/boost_${_boostver}/tools"
#  echo "using python : 2.7 : /usr/bin/python2 ;" >> build/v2/user-config.jam
#  echo "using python : 3.2 : /usr/bin/python3.2 : /usr/include/python3.2mu :
#  /usr/lib32 ;" >> build/v2/user-config.jam
#  echo "using mpi ;" >> build/v2/user-config.jam

  # build bjam
  cd "${srcdir}/boost_${_boostver}/tools/build/v2/engine"
  ./build.sh cc

  _bindir="bin.linuxx86"

  install -d "${_stagedir}"/usr/bin
  install ${_bindir}/bjam "${_stagedir}"/usr/bin/bjam

  # build bcp
  cd "${srcdir}/boost_${_boostver}/tools/bcp"
  ../build/v2/engine/${_bindir}/bjam --toolset=gcc
  install -m755 "${srcdir}/boost_${_boostver}/dist/bin/bcp" \
                ${_stagedir}/usr/bin/bcp

  # build libs
  cd "${srcdir}/boost_${_boostver}"

  # default "minimal" install: "release link=shared,static
  # runtime-link=shared threading=single,multi"
  # --layout=tagged will add the "-mt" suffix for multithreaded libraries
  # and installs includes in /usr/include/boost.
  # --layout=system no longer adds the -mt suffix for multi-threaded libs.
  # install to ${_stagedir} in preparation for split packaging

  ./tools/build/v2/engine/${_bindir}/bjam \
      release debug-symbols=off threading=multi \
      runtime-link=shared link=shared,static \
      cflags=-fno-strict-aliasing \
      toolset=gcc \
	  address-model=32 \
	  --without-python \
      --without-mpi \
      --prefix="${_stagedir}" \
      -sTOOLS=gcc \
      --layout=system \
      ${MAKEFLAGS} \
      install
}

package() 
{
	install -d "${pkgdir}/usr/lib32"

        #shared libs
        cp -r "${_stagedir}"/lib/*.so{,.*} "${pkgdir}/usr/lib32/"
                     
        # license
        install -D -m644 "${srcdir}/boost_${_boostver}/LICENSE_1_0.txt" \
        "${pkgdir}"/usr/share/licenses/lib32-boost-libs/LICENSE_1_0.txt
}

