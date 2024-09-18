# Maintainer: gcb0 <1705-gcb@users.noreply.gitlab.archlinux.org>
#set -xe
year=2023
pkgname=opentaxsolver$year
pkgver=21.06
# ^ same as upstream. No hypen! `s/-/_/`, and later source=("${pkgname}-${pkgver//_/-}.tar.gz")
_snvrevision=r137
pkgrel=1
pkgdesc="An easy-to-use text-based calculator for U.S.A Tax Forms"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://opentaxsolver.sourceforge.net/"
license=('GPL2')
#groups=(OTS)
depends=()
checkdepends=()
optdepends=(
	'gtk4: GUI support'
	'libreoffice: Edit generated PDFs'
)

# SOURCES :: from subversion
makedepends=('subversion')
source=("${pkgname}" "${pkgname}-${pkgver}::svn://svn.code.sf.net/p/opentaxsolver/SrcCodeRepo/trunk/OTS_${year}#revision=${_snvrevision}")
sha256sums=('c24fc0b104cb7270b9a877eb9101f169fc08409cf7649879443504f657064c6b'
            'SKIP')
verify() {
	# NOTE this happens before files are moved to $srcdir... must use the dir on the prefix of source=()
	cd "${pkgname}-${pkgver}/src/"
	# hacky checksum
	if [[ "f7212bd7eb8b3786614b011c7d082020f198e1bd08ce55fa48a664ae7bb538ea  -" \
		!= $(cat *c | sha256sum) ]];
	then
		echo "got wrong checksum for requested revision!" >&2
		return 2;
	fi
}
# pkgver() {  ... this is silly as we use fixed revision, but keeping here in case anyone want to do a -svn packge
# 	# TODO: this returns MAJ.MIN e.g. "21.03", which is not valid?
# 	# TODO: add 'r123' for the svn revision on the version? e.g. "21.03-r146"
# 	cd "$srcdir/${pkgname}-${pkgver}/src/"
# 	# get actual version from changelog
# 	local ver=$(grep --max-count=1 '* v' ../0_README.txt  | cut -c 8-12)
# 	echo $ver >&2
# 	return $ver
# }

# SOURCES :: from upstream artifact (fail as sf.net likes to redirects to webpage from time to time)
# makedepends=()
# source=("${pkgname}" "https://phoenixnap.dl.sourceforge.net/project/opentaxsolver/OTS_${year}/v${pkgver}_linux/OpenTaxSolver${year}_${pkgver}_linux64.tgz")
# sha256sums=('c24fc0b104cb7270b9a877eb9101f169fc08409cf7649879443504f657064c6b'
#             '76f6a29d824ad3229555f04c7bf91c76fe8d16bdb822c31f6b410480d948a90b')
# prepare() {
# 	# normalize srcdir path tree with svn sources. for consistency on other methods.
# 	cd "$srcdir/"
# 	ln -s "OpenTaxSolver${year}_${pkgver}_linux64/" "${pkgname}-${pkgver}"
# }


build() {
	cd "$srcdir/${pkgname}-${pkgver}/src/"
	make
	cd Gui_gtk
	make
}

# all files must live in /var/lib/pkgname because program have no concept of
# systemdirs. All must live relative to the executable. This also requires a
# wrapper
package() {
	cd "$srcdir/${pkgname}-${pkgver}/"
	local -r INSTALL="install --preserve-timestamps --owner=root --group=root"

	# NOTE: $pkgdir is absolute.
	$INSTALL --mode=0755 -d "${pkgdir}/usr/bin/"
	$INSTALL --mode=0755 -d "${pkgdir}/var/lib/${pkgname}/src/"
	$INSTALL --mode=0755 -d "${pkgdir}/var/lib/${pkgname}/bin/"

	# NOTE: to use glob on install we can't use quotes... this will break if this project
	#       ever adds spaces to filenames i guess.
	$INSTALL --mode=0755 --target-directory="${pkgdir}/var/lib/${pkgname}/bin/" bin/*

	# our wrapper
	# TODO: create .desktop file for this
	$INSTALL --mode=0755 --target-directory="${pkgdir}/usr/bin/" "${srcdir}/${pkgname}"

	# this is convoluted but ensure right permissions/ownership
	local formdir
	#for formdir in "AZ_140" "CA_540" "Form_2210" "Form_8606" "Form_8812" "Form_8829" "Form_8959" "Form_8960" "Form_8995" "Form_CA_5805" "HSA_Form_8889" "MA_1" "NC_D400" "NJ_1040" "NY_IT201" "OH_IT1040" "PA_40" "US_1040" "US_1040_Sched_C" "US_1040_Sched_SE" "VA_760";
	for formdir in tax_form_files/*;
	do
		$INSTALL --mode=0755 -d "${pkgdir}/var/lib/${pkgname}/${formdir}/"
		$INSTALL --mode=0644 --target-directory="${pkgdir}/var/lib/${pkgname}/${formdir}/" \
			${formdir}/*.txt
	done

	$INSTALL --mode=0755 -d "${pkgdir}/var/lib/${pkgname}/src/formdata/"
	$INSTALL --mode=0644 --target-directory="${pkgdir}/var/lib/${pkgname}/src/formdata/" \
		src/formdata/*.dat
}

