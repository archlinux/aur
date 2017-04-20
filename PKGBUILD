# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: Mihails Strasuns <public@dicebot.lv>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname='ldc017'
_pkgbase='ldc'
groups=('dlang' 'dlang-ldc')
pkgver=0.17.4
_druntimever=0.17.3
_phobosver=0.17.3
_dmdtestsuitever=0.17.3
pkgrel=1
pkgdesc="A D Compiler based on the LLVM Compiler Infrastructure including D runtime and libphobos2 (0.17 bootstrap branch)"
arch=('i686' 'x86_64')
url="https://github.com/ldc-developers/ldc"
license=('BSD')
depends=('libconfig' 'llvm-libs' 'curl')
makedepends=('git' 'cmake' 'llvm')
backup=("etc/ldc2-0.17.conf")
options=('staticlibs')

source=("https://github.com/ldc-developers/ldc/archive/v${pkgver}.tar.gz"
        "druntime-ldc-v${_druntimever}.tar.gz::https://github.com/ldc-developers/druntime/archive/ldc-v${_druntimever}.tar.gz"
		"phobos-ldc-v${_phobosver}.tar.gz::https://github.com/ldc-developers/phobos/archive/ldc-v${_phobosver}.tar.gz"
		"dmd-testsuite-ldc-v${_dmdtestsuitever}.tar.gz::https://github.com/ldc-developers/dmd-testsuite/archive/ldc-v${_dmdtestsuitever}.tar.gz"
        "ldc2-0.17.conf"
       )

sha256sums=('08970636ae3023bb62cd727022d642974684e54aa9ef66cc04709989ce9080cf'
            '5a4204312a38247bafd4291b4eaa8f3819900ccd24deae0f60aa3bd18d45817c'
            '541eb14056faa9048cb2ffb1c320f87100977204892b7272ad350570edb6dc63'
            '3d4dfd1b0da1001ac84ccc2245aac83b73392dc4509eff46c57ef8d2959bd5a4'
            '7f7f4fd0bfa68efc28528c020a99114521a1c3f1f9ad37a498285aa35df36455')

prepare() {
	cd "${srcdir}/ldc-${pkgver}"

	rm -r runtime/{druntime,phobos} tests/d2/dmd-testsuite
	ln -s ${srcdir}/druntime-ldc-v${_druntimever} runtime/druntime
	ln -s ${srcdir}/phobos-ldc-v${_phobosver} runtime/phobos
	ln -s ${srcdir}/dmd-testsuite-ldc-v${_dmdtestsuitever} tests/d2/dmd-testsuite

	echo '-> Forcing CMakeLists to ignore AUR git repo'
	sed -i -e 's/get_git_head_revision(REFSPEC HASH)/set(HASH "GITDIR-NOTFOUND")/g' CMakeLists.txt

	echo '-> Changing expected config file name'
	sed 's/ldc2[.]conf/ldc2-0.17.conf/' -i driver/configfile.cpp

	sed -i -e 's/\(complete -o nospace -F _ldc ldc2\)/\1-0.17/' bash_completion.d/ldc2
}


build() {
    mkdir -p "${srcdir}/tmp_install_dir"
    cd "${srcdir}/ldc-${pkgver}"

    mkdir -p build && cd build
	cmake \
	-DPROGRAM_SUFFIX='-0.17' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DINCLUDE_INSTALL_DIR=/usr/include/dlang/ldc-0.17 \
    -DBUILD_SHARED_LIBS=OFF \
    ..

	# Easier than sed'ing CMakeLists.txt
	cp bin/ldc2.conf bin/ldc2-0.17.conf

	make -j $(nproc)
}


package() {
    cd "${srcdir}"/ldc-${pkgver}/build
    make install DESTDIR="${pkgdir}"

    # alternative executable names
    ln -s /usr/bin/ldmd2-0.17 "${pkgdir}"/usr/bin/ldmd-0.17
    ln -s /usr/bin/ldc2-0.17 "${pkgdir}"/usr/bin/ldc-0.17

    # custom configuration file
	rm -f "${pkgdir}"/etc/ldc2.conf
    install -D -m644 "${srcdir}"/ldc2-0.17.conf "${pkgdir}"/etc/ldc2-0.17.conf

    # license
    install -D -m644 "${srcdir}"/ldc-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

	# rename/move bash-completion script
	rm -rf "${pkgdir}"/etc/bash_completion.d
	install -D -m644 "${srcdir}"/ldc-${pkgver}/bash_completion.d/ldc2 "${pkgdir}"/usr/share/bash-completion/completions/ldc2-0.17

    # rename static libraries
	mv "${pkgdir}"/usr/lib/libphobos2-ldc.a "${pkgdir}"/usr/lib/liblphobos2-0.17.a
    mv "${pkgdir}"/usr/lib/libdruntime-ldc.a "${pkgdir}"/usr/lib/libldruntime-0.17.a
    mv "${pkgdir}"/usr/lib/libphobos2-ldc-debug.a "${pkgdir}"/usr/lib/liblphobos2-debug-0.17.a
    mv "${pkgdir}"/usr/lib/libdruntime-ldc-debug.a "${pkgdir}"/usr/lib/libldruntime-debug-0.17.a
}

