# Maintainer: Tobias Erthal <archabuser [ a t ] mailbox [-d-o-t-] org>

pkgname=pakcs
pkgver=3.3.0
pkgrel=3
pkgdesc="The Portland Aachen Kiel Curry System"
arch=('x86_64')
url="https://www.informatik.uni-kiel.de/~pakcs/index.html"
license=('custom:PAKCS License')
depends=('swi-prolog')
makedepends=('stack' 'texlive-core')
optdepends=('rlwrap: for command line editing and history functionality')
install=pakcs.install
source=("https://www.informatik.uni-kiel.de/~pakcs/download/${pkgname}-${pkgver}-src.tar.gz" 'skip_dir_check.patch')
md5sums=('85365437d1121fb3a79262f3fa0f7bd6' '76bdf92b29451a2983c4d9082ded5a2e')

prepare() {
	patch "${srcdir}/${pkgname}-${pkgver}/Makefile" skip_dir_check.patch
}

build() {
	if locale | grep -q 'UTF-8'; then :; else
		echo "PAKCS needs to be build within an UTF-8 based environment!"
		exit -1
	fi

	cd "${srcdir}/${pkgname}-${pkgver}"
	make	DISTPKGINSTALL=yes \
			CURRYLIBSDIR="${PWD}/lib" \
			CURRYTOOLSDIR="${PWD}/currytools" \
			PAKCSINSTALLDIR="/usr/lib/${pkgname}"

	# build cypm documentation
	cd currytools/cpm/docs
	pdflatex manual.tex
	pdflatex manual.tex
}

check() {
	_CURRYBIN="${srcdir}/${pkgname}-${pkgver}/bin/"
	PATH=$PATH:${_CURRYBIN}

	cypm update
	cypm install currycheck

	_CYPMBIN=$(cypm config | grep 'BIN_INSTALL_PATH' | sed -E "s/BIN_INSTALL_PATH\s*:\s*(.*)/\1/")
	PATH=$PATH:${_CYPMBIN}

	# run packaged tests
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	make	DISTPKGINSTALL=yes \
			CURRYLIBSDIR="${PWD}/lib" \
			CURRYTOOLSDIR="${PWD}/currytools" \
			PAKCSINSTALLDIR="/usr/lib/${pkgname}" runtest
	
	if [ $? -eq 0 ]; then
		echo "All tests ran successfully."
		cypm uninstall currycheck
	else
		echo "Testsuite finished with exit code $?. At least one test failed!"
		cypm uninstall currycheck
		return -1
	fi
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Include custom license
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Copy distro files
	_PKGROOT="${pkgdir}/usr/lib/${pkgname}"
	mkdir -p ${_PKGROOT}
	for dir in "bin" "lib" "src" "tools" "scripts" "currytools" "examples"; do
		cp -r $dir ${_PKGROOT}/
	done

	# Copy frontend
	mkdir -p ${_PKGROOT}/frontend
	cp -r frontend/bin ${_PKGROOT}/frontend

	# Default config file
	install -Dm644 pakcsrc.default "${pkgdir}/usr/lib/${pkgname}/"

	# Install documentation and examples
	install -Dm644 man/*.1 -t "${pkgdir}/usr/share/man/man1/"
	install -Dm644 docs/* -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 currytools/cpm/docs/manual.pdf "${pkgdir}/usr/share/doc/${pkgname}/cpm/Manual.pdf"

	# patch certain files
	sed -i 's|'${srcdir}/${pkgname}-${pkgver}'|/usr/lib/'${pkgname}'|g' "${pkgdir}/usr/lib/${pkgname}/bin/pakcs"
	sed -i 's|'${srcdir}/${pkgname}-${pkgver}'|/usr/lib/'${pkgname}'|g' "${pkgdir}/usr/lib/${pkgname}/currytools/cpm/src/CPM/ConfigPackage.curry"
	sed -i 's|'${srcdir}/${pkgname}-${pkgver}'|/usr/lib/'${pkgname}'|g' "${pkgdir}/usr/lib/${pkgname}/currytools/optimize/.cpm/CURRYPATH_CACHE"	

	# ensure /usr/bin for linking
	mkdir -p "${pkgdir}/usr/bin"

	# Link examples to documentation
	ln -s "/usr/lib/${pkgname}/examples" "${pkgdir}/usr/share/doc/${pkgname}/examples"

	# Link binaries to /usr/bin
	ln -s "/usr/lib/${pkgname}/bin/cleancurry" "${pkgdir}/usr/bin/cleancurry"
	ln -s "/usr/lib/${pkgname}/bin/pakcs" "${pkgdir}/usr/bin/pakcs"
	ln -s "/usr/lib/${pkgname}/bin/cypm" "${pkgdir}/usr/bin/cypm"
}
