# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Maintainer: Alexandre Macabies <web+oss@zopieux.com>
#
pkgname=gn-chromium
pkgdesc='Meta-build system which generates Ninja build files'
pkgver=r1454.499868c6
cl=337439
cl2=1
pkgrel=1
license=('BSD')
arch=('x86_64' 'i686')
conflicts=('gn-bin')
provides=('gn')
depends=('python2' 'wget' 'p7zip')
makedepends=('python2' 'ninja')
url='https://gn.googlesource.com/gn'
source=("gn::git+${url}" gn-gen-r1.patch  https://commondatastorage.googleapis.com/chromium-browser-clang/Linux_x64/clang-$cl-$cl2.tgz)
sha512sums=('SKIP'
            'a4da00a35e32905f9bcc6c63384baeaaaccdb4ae4286f8ecdb170277c5fcdd86ad3c101ea2d8fdb11fa3446874b3b14c1e5197df6fbc7c104029ee94762bcf82'
            '43c4d937b260a2da61e559d158fef9f8e1c3e556ed220d24c4901a8bdd00a50c230027043f434f83167d25e24f31acd443d2c545ec1f060b29d5227b8570325c')
noextract=('clang-337439-1.tgz')
pkgver () {
	export GIT_DIR="${startdir}/gn"
	printf "r%s.%s" "$(git --bare rev-list --count HEAD)" "$(git --bare rev-parse --short HEAD)"
}

prepare () {
mkdir c7
cp clang-337439-1.tgz c7/
cd c7
tar -xvzf clang-337439-1.tgz
cd ../gn
	patch -p1 -i ../gn-gen-r1.patch
}

build () {
	cd gn
      _clang_path="${srcdir}/c7/bin"
      _c_compiler="${_clang_path}/clang"
      _cpp_compiler="${_clang_path}/clang++"
      export CXXFLAGS="${CXXFLAGS//-fno-plt/}"
      export CFLAGS="${CFLAGS//-fno-plt/}"
      CFLAGS+=' -Wno-unknown-warning-option'
      CXXFLAGS+=' -Wno-unknown-warning-option'


  # Export compilers
  msg2 "Setup ${_compiler} compiler${_compiler_msg}"
  export AR=ar
  export NM=nm
  export CC="${_c_compiler}"
  export CXX="${_cpp_compiler}"

	 python2 build/gen.py --no-sysroot 
	ninja -C out
}

package () {
	install -Dm755 gn/out/gn "${pkgdir}/usr/bin/gn"

	# Documentation
	# Vim support
	local item
	for item in autoload ftplugin ftdetect syntax ; do
		install -Dm 644 -t "${pkgdir}/usr/share/vim/vimfiles/${item}" \
			"gn/tools/gn/misc/vim/${item}"/*.vim
	done
		
	# License
	install -m 644 -D gn/LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
