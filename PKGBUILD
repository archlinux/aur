# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Maintainer: Alexandre Macabies <web+oss@zopieux.com>
#
pkgname=gn-chromium
pkgdesc='Meta-build system which generates Ninja build files'
pkgver=r1446.5d9a4e9a
cl=335091
cl2=1
pkgrel=1
license=('BSD')
arch=('x86_64' 'i686')
conflicts=('gn-bin')
provides=('gn')
depends=('python2' 'wget' 'p7zip')
makedepends=('python2' 'ninja')
url='https://gn.googlesource.com/gn'
source=("gn::git+${url}" https://raw.githubusercontent.com/gentoo/gentoo/master/dev-util/gn/files/gn-gen-r0.patch  https://commondatastorage.googleapis.com/chromium-browser-clang/Linux_x64/clang-$cl-$cl2.tgz)
sha512sums=('SKIP'
            '0e281be477d235a15ffc483fa6af03db560bc421392d7c82322c7735c0498ca3e6ea69843ed46bfe7bc562539488c5b6d945e508e66b530d97584e08e154d6d7'
            'd86dac70af6476c3b47957080a3467a45e99235bb389eed6b7f9c6e82cc12f5405d1ec9d23ff3f58f7ff4893fd3149a35c41a61136c0a8490a2f6a341102af1f')
noextract=('clang-335091-1.tgz')
pkgver () {
	export GIT_DIR="${startdir}/gn"
	printf "r%s.%s" "$(git --bare rev-list --count HEAD)" "$(git --bare rev-parse --short HEAD)"
}

prepare () {
mkdir c7
cp clang-335091-1.tgz c7/
cd c7
tar -xvzf clang-335091-1.tgz
cd ../gn
	patch -p1 -i ../gn-gen-r0.patch
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
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		gn/tools/gn/docs/*.md

	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/example" \
		gn/tools/gn/example/*.*
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/example/build" \
		gn/tools/gn/example/build/*.*

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
