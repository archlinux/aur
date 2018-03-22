# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=salome-meca-bin
pkgver=2017.0.2
pkgrel=4
pkgdesc='Integration of the Code_Aster solver in the Salome platform'
arch=('x86_64')
url='https://www.code-aster.org/spip.php?article303'
license=('LGPL')
depends=('openblas')
makedepends=()
optdepends=()
options=('!strip')
provides=('salome-meca')
source=("https://www.code-aster.org/FICHIERS/Salome-Meca-${pkgver}-LGPL-1.tgz")
md5sums=('e65b4da01a8200492b94a278db621029')

build() {
	cd "${srcdir}"

	echo "Extracting installer..."

	# self-extract
	./Salome-Meca-2017.0.2-LGPL-1.run &> /dev/null <<-EOF
	${srcdir}/salome_meca
	EOF

	cd "${srcdir}/salome_meca/V2017.0.2/" 

	# impose the right path for the setup script
	sed -i \
		"107iSALOMEDIR=${srcdir}/salome_meca/V2017.0.2/" \
		create_appli.sh

	# use the bundled version of python
	export PATH="${srcdir}/salome_meca/V2017.0.2/prerequisites/Python-2710/bin/":$PATH

	echo "Building virtual application..."

	# create virtual application
	# -D to not automatically create a (wrong) desktop and menu entry
	./create_appli.sh -D &> /dev/null <<-EOF
	${srcdir}/salome_meca/appli_V2017.0.2
	EOF

	# create .desktop file from template
	# use the bundled libraries and Python version 
	_path='PATH=/opt/salome_meca/V2017.0.2/prerequisites/Python-2710/bin/:$PATH'
	_ld_path='LD_LIBRARY_PATH=$(find /opt/salome_meca/V2017.0.2/ -type d -name lib  | tr '"'"'\\n'"'"' '"'"':'"'"' | sed '"'"'s/:$//'"'"'):$LD_LIBRARY_PATH'
	sed -e "s,APPLIDIR,$_path $_ld_path /opt/salome_meca/appli_V2017.0.2," \
		-e "s,SALOMEDIR,/opt/salome_meca/V2017.0.2," \
		${srcdir}/salome_meca/V2017.0.2/.salome_meca_V2017.0.2.desktop \
		> ${srcdir}/salome_meca.desktop

	echo "Fixing references..."

	# fix references to srcdir
	for f in `grep -RI "${srcdir}" ${srcdir} | cut -d: -f1`; do
		sed -i "s,${srcdir},/opt,g" $f
	done

	echo "Fixing symlinks..."

	# fix symlinks pointing to srcdir
	# https://stackoverflow.com/questions/31020219/how-change-symlink-path-for-many-files
	_oldpath="${srcdir}"
	_newpath='/opt'
	find ${srcdir}/salome_meca -type l -execdir bash -c 'p="$(readlink "{}")"; if [ "${p:0:1}" != "/" ]; then p="$(echo "$(pwd)/$p" | sed -e "s|/\./|/|g" -e ":a" -e "s|/[^/]*/\.\./|/|" -e "t a")"; fi; if [ "${p:0:'${#_oldpath}'}" == "'"$_oldpath"'" ]; then ln -snf "'"$_newpath"'${p:'${#_oldpath}'}" "{}"; fi;' \;
}

package() {
	cd ${srcdir}

	# install bash completions
	mkdir -p $pkgdir/usr/share/bash-completion/completions
	install -D -m644 \
		"${srcdir}/salome_meca/appli_V2017.0.2/.salome-completion.sh" \
		"${pkgdir}/usr/share/bash-completion/completions/salome"

	# install application
	mkdir ${pkgdir}/opt
	mv ${srcdir}/salome_meca ${pkgdir}/opt/salome_meca

	# install .desktop file
	mkdir -p ${pkgdir}/usr/share/applications
	install -D -m644 \
		"${srcdir}/salome_meca.desktop" \
		"${pkgdir}/usr/share/applications/salome_meca.desktop"
}
