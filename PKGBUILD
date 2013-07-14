# Maintainer  : Jan Was < janek.jan@gmail.com >
# Contributor : Dan Vratil <dan@progdan.cz>
# Contributor  : andy123 < ajs AT online DOT de >

pkgname=lib32-boost-libs
pkgver=1.54.0
_boostver=${pkgver//./_}
pkgrel=1
url="http://www.boost.org"
arch=('x86_64')
pkgdesc="Free peer-reviewed portable C++ source libraries - Runtime (32 bit)"
license=('custom')
groups=('lib32')
depends=('lib32-bzip2' 'lib32-zlib' 'lib32-icu' 'lib32-gcc-libs')
makedepends=('lib32-icu>=51.1' 'lib32-bzip2' 'lib32-zlib' 'gcc-multilib' 'python' 'python2')
source=(http://downloads.sourceforge.net/sourceforge/boost/boost_${_boostver}.tar.gz)
sha1sums=('069501636097d3f40ddfd996d29748bb23591c53')



build() {
	export CC="gcc"
	export CFLAGS="-m32"
	export CXX="g++"
	export CXXFLAGS="-m32"
	export LDFLAGS="-m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

   export _stagedir="${srcdir}/stagedir"
   local JOBS="$(sed -e 's/.*\(-j *[0-9]\+\).*/\1/' <<< ${MAKEFLAGS})"

   cd "${srcdir}/boost_${_boostver}"

   # Shut up strict aliasing warnings
   echo "using gcc : : : <compileflags>-fno-strict-aliasing ;" >> ./tools/build/v2/user-config.jam
   # Add an extra python version. This does not replace anything and python 2.x need to be the default.
   #echo "using python : 3.3 : /usr/bin/python3 : /usr/include/python3.3m : /usr/lib ;" >> ./tools/build/v2/user-config.jam
   # Support for OpenMPI
   #echo "using mpi ;" >> ./tools/build/v2/user-config.jam

   ./bootstrap.sh --with-toolset=cc --with-icu --with-python=
   # --with-python=/usr/bin/python2

   sed -i 's/cc/gcc/g' project-config.jam

	_bindir="bin.linuxx86"

	install -d -m 755 "${_stagedir}"/bin
	install "${srcdir}"/boost_${_boostver}/tools/build/v2/engine/${_bindir}/bjam "${_stagedir}"/bin/bjam

   pushd tools
   for _tool in bcp inspect quickbook compiler_status process_jam_log wave; do
      "${_stagedir}"/bin/bjam --toolset=gcc $_tool
   done
   "${_stagedir}"/bin/bjam --toolset=gcc cflags="-std=gnu++11" library_status
   popd
   cp -a dist/bin/* "${_stagedir}"/bin

   #boostbook is needed by quickbook
   install -d -m 755 "${_stagedir}"/share/boostbook
   cp -a tools/boostbook/{xsl,dtd} "${_stagedir}"/share/boostbook/

	# default "minimal" install: "release link=shared,static
	# runtime-link=shared threading=single,multi"
	# --layout=tagged will add the "-mt" suffix for multithreaded libraries
	# and installs includes in /usr/include/boost.
	# --layout=system no longer adds the -mt suffix for multi-threaded libs.
	# install to ${_stagedir} in preparation for split packaging
	"${_stagedir}"/bin/bjam \
		variant=release \
		debug-symbols=off \
		threading=multi \
		runtime-link=shared \
		link=shared \
		toolset=gcc \
		address-model=32 \
		--without-python \
		--without-mpi \
		--layout=system \
		--prefix="${_stagedir}" \
		${JOBS} \
		install

   find ${_stagedir} -name \*.a -exec rm -f {} \;
}

package() {
	_stagedir="${srcdir}/stagedir"

	install -d -m 755 "${pkgdir}/usr/lib32"
	cp -a "${_stagedir}"/lib/*.so{,.*} "${pkgdir}/usr/lib32/"

	install -D -m 644 "${srcdir}/boost_${_boostver}/LICENSE_1_0.txt" \
		"${pkgdir}"/usr/share/licenses/lib32-boost-libs/LICENSE_1_0.txt
}

