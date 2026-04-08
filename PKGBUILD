# Maintainer: Clemens Schmid <clemens [ a t ] nevrome [-d-o-t-] de>
# Contributor: Tobias Erthal <archabuser [ a t ] mailbox [-d-o-t-] org>

# NOTE:
# Tests are extremely slow (>60 minutes) and disabled by default.
# Enable with: RUN_CHECKS=1 makepkg

pkgname=pakcs
pkgver=3.9.0
pkgrel=5
pkgdesc="PAKCS is an implementation of the multi-paradigm declarative language Curry jointly developed by the Portland State University, the Aachen University of Technology, and the University of Kiel."
arch=('x86_64')
url="https://www.curry-lang.org/pakcs"
license=('custom:PAKCS License')
depends=('swi-prolog')
makedepends=('base-devel' 'stack' 'texlive-core')
optdepends=('rlwrap: for command line editing and history functionality')
install=pakcs.install
source=("https://www.curry-lang.org/pakcs/download/${pkgname}-${pkgver}-src.tar.gz" 'skip_dir_check.patch')
md5sums=('f15037690b88f40424ef685d6194a35f' '76bdf92b29451a2983c4d9082ded5a2e')
backup=("usr/lib/${pkgname}/pakcsrc.default")
provides=('curry-compiler')

prepare() {
	patch "${srcdir}/${pkgname}-${pkgver}/Makefile" skip_dir_check.patch
}

build() {
	if locale | grep -q 'UTF-8'; then :; else
		echo "PAKCS needs to be build within an UTF-8 based environment!"
		exit -1
	fi

	cd "${srcdir}/${pkgname}-${pkgver}"
	msg2 "Building PAKCS (may take more than 10min)..."
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
	if [[ -z "$RUN_CHECKS" ]]; then
	  msg2 "Skipping tests."
	  msg2 "Set RUN_CHECKS=1 to enable (may take over an hour)."
	  return 0
	fi
	
	msg2 "Running self-tests (may take over an hour)..."

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

	# include custom license
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# copy distro files
	_PKGROOT="${pkgdir}/usr/lib/${pkgname}"
	mkdir -p ${_PKGROOT}
	for dir in "bin" "lib" "src" "tools" "scripts" "currytools" "examples"; do
		cp -r $dir ${_PKGROOT}/
	done

	# copy frontend
	mkdir -p ${_PKGROOT}/frontend
	cp -r frontend/bin ${_PKGROOT}/frontend

	# default config file
	install -Dm644 pakcsrc.default "${pkgdir}/usr/lib/${pkgname}/"

	# install documentation and examples
	install -Dm644 man/*.1 -t "${pkgdir}/usr/share/man/man1/"
	install -Dm644 docs/* -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 currytools/cpm/docs/manual.pdf "${pkgdir}/usr/share/doc/${pkgname}/cpm/Manual.pdf"

	# patch certain files
	sed -i 's|'${srcdir}/${pkgname}-${pkgver}'|/usr/lib/'${pkgname}'|g' "${pkgdir}/usr/lib/${pkgname}/bin/pakcs"
	sed -i 's|'${srcdir}/${pkgname}-${pkgver}'|/usr/lib/'${pkgname}'|g' "${pkgdir}/usr/lib/${pkgname}/currytools/cpm/src/CPM/ConfigPackage.curry"

	# ensure /usr/bin for linking
	mkdir -p "${pkgdir}/usr/bin"

	# link examples to documentation
	ln -s "/usr/lib/${pkgname}/examples" "${pkgdir}/usr/share/doc/${pkgname}/examples"

	# link binaries to /usr/bin
	ln -s "/usr/lib/${pkgname}/bin/pakcs" "${pkgdir}/usr/bin/pakcs"
	ln -s "/usr/lib/${pkgname}/bin/pakcs" "${pkgdir}/usr/bin/curry-pakcs"
}
