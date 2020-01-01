# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=salome-meca-bin
pkgver=2019.0.3
pkgrel=1
pkgdesc='Integration of the Code_Aster solver in the Salome platform'
arch=('x86_64')
url='https://www.code-aster.org/spip.php?article303'
license=('LGPL')
depends=('coreutils' 'openblas')
makedepends=('python2')
optdepends=()
provides=('salome-meca')
source=("https://www.code-aster.org/FICHIERS/salome_meca-2019.0.3-1-universal.tgz")
sha1sums=('4ea7be35819a53a201d48d189ef1c4d4f6d47e32')

prepare() {
	cd "${srcdir}"

	msg2 "Extracting installer..."

	# remove previous build folder if present, otherwise the installer will fail
	[ ! -d "${srcdir}/salome_meca" ] || rm -rf "${srcdir}/salome_meca"

	# self-extract
	./salome_meca-2019.0.3-1-universal.run &> /dev/null <<-EOF
	${srcdir}/salome_meca
	EOF
}

package() {
	local _pkgver="V${pkgver}_universal"
	cd "${srcdir}/salome_meca/${_pkgver}/"

	# impose the right path for the setup script
	sed -i \
		-e "107iSALOMEDIR=${srcdir}/salome_meca/${_pkgver}/" \
		-e 's,\bpython\b,python2,g'\
		create_appli.sh

	# use the bundled version of python
	export PATH="${srcdir}/salome_meca/${_pkgver}/prerequisites/Python-365/bin/":$PATH
	export LD_LIBRARY_PATH="${srcdir}/salome_meca/${_pkgver}/prerequisites/Python-365/lib/":$LD_LIBRARY_PATH

	# Try to use the system libstdc++.so.6
	# (hoping this does not break anything else, for the moment it seems not...)
	mv "${srcdir}/salome_meca/${_pkgver}/prerequisites/debianForSalome/lib/libstdc++.so.6" \
		"${srcdir}/salome_meca/${_pkgver}/prerequisites/debianForSalome/lib/libstdc++.so.6.bak"

	msg2 "Building virtual application..."

	# create virtual application
	# -D to not automatically create a (wrong) desktop and menu entry
	./create_appli.sh -D -q -a "${srcdir}/salome_meca/appli_${_pkgver}"

	# ensure that the extraction did not fail
	if [ ! -e "${srcdir}/salome_meca/appli_${_pkgver}/salome" ]; then
		error "Extraction of the application failed, please check '${srcdir}/salome_meca/appli_${_pkgver}/appli_${_pkgver}.log' for relevant error messages."
		exit 1
	fi

	# create .desktop file from template
	sed -e "s,APPLIDIR/salome,/usr/bin/salome_meca," \
		-e "s,SALOMEDIR,/opt/salome_meca/${_pkgver}," \
		"${srcdir}/salome_meca/${_pkgver}/.salome_meca_${_pkgver}.desktop" \
		> "${srcdir}/salome_meca.desktop"

	msg2 "Fixing references..."

	# fix references to srcdir
	# shellcheck disable=2013
	for f in $(grep -RI "${srcdir}" "${srcdir}" | cut -d: -f1); do
		sed -i "s,${srcdir},/opt,g" "$f"
	done

	msg2 "Fixing symlinks..."

	# fix symlinks pointing to srcdir
	# https://stackoverflow.com/questions/31020219/how-change-symlink-path-for-many-files
	_oldpath="${srcdir}"
	_newpath='/opt'
    # shellcheck disable=2156
	find "${srcdir}/salome_meca" -type l -execdir bash -c 'p="$(readlink "{}")"; if [ "${p:0:1}" != "/" ]; then p="$(echo "$(pwd)/$p" | sed -e "s|/\./|/|g" -e ":a" -e "s|/[^/]*/\.\./|/|" -e "t a")"; fi; if [ "${p:0:'${#_oldpath}'}" == "'"$_oldpath"'" ]; then ln -snf "'"$_newpath"'${p:'${#_oldpath}'}" "{}"; fi;' \;

	cd "${srcdir}"

	# create launcher script
	# use the bundled libraries and Python version
	# shellcheck disable=2016
	_path='PATH=/opt/salome_meca/'"${_pkgver}"'/prerequisites/Python-365/bin/:$PATH'
	_ld_path="LD_LIBRARY_PATH=\$(find /opt/salome_meca/${_pkgver}/ -type d -name lib  | tr '\\n' ':' | sed 's/:$//'):\$LD_LIBRARY_PATH"
	mkdir -p "${pkgdir}/usr/bin"
	cat > "${pkgdir}/usr/bin/salome_meca" <<-EOF
	#!/usr/bin/env bash
	$_path $_ld_path /opt/salome_meca/appli_${_pkgver}/salome "\$@"
	EOF
	chmod +x "${pkgdir}/usr/bin/salome_meca"

	# install bash completions
	mkdir -p "$pkgdir/usr/share/bash-completion/completions"
	install -D -m644 \
		"${srcdir}/salome_meca/appli_${_pkgver}/.salome-completion.sh" \
		"${pkgdir}/usr/share/bash-completion/completions/salome"

	# install application
	mkdir "${pkgdir}/opt"
	mv "${srcdir}/salome_meca" "${pkgdir}/opt/salome_meca"

	# install .desktop file
	mkdir -p "${pkgdir}/usr/share/applications"
	install -D -m644 \
		"${srcdir}/salome_meca.desktop" \
		"${pkgdir}/usr/share/applications/salome_meca.desktop"
}
