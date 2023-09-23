# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
# Contributor: fishburn <frankthefishburn@gmail.com>

pkgname=fsl
pkgver=6.0.7.3
pkgrel=1
pkgdesc="A comprehensive library of analysis tools for FMRI, MRI and DTI brain imaging data"
arch=("x86_64")
url="http://www.fmrib.ox.ac.uk/fsl/"
license=('custom')
depends=('python')
source=("fslinstaller.py")

sha256sums=('97aa9b7524cc18a28ca658d6cacf9ab017a386d16484e67fed5ebd824d4c5e7f')

build() {
        export TMPFSLDIR="${srcdir}/fsl"
	mkdir -p "${TMPFSLDIR}"
	/usr/bin/python3 "${srcdir}"/fslinstaller.py -n -o -d "${TMPFSLDIR}" -V "${pkgver}"
}

package() {
	# Replace paths and move files in place
	find "${TMPFSLDIR}" -type f -exec grep -Iq . {} \; -exec sed -i "s|${srcdir}|/opt|g" {} +
	mkdir "${pkgdir}"/opt
	mv "${TMPFSLDIR}" "${pkgdir}"/opt
	# Copy license
	mkdir -p "${pkgdir}"/usr/share/licenses/fsl	
	cp "${pkgdir}"/opt/fsl/LICENCE.FSL "${pkgdir}"/usr/share/licenses/fsl/LICENSE
	# Setup shell environment
	mkdir -p "${pkgdir}/etc/profile.d"
	echo 'FSLDIR=/opt/fsl' >			"${pkgdir}/etc/profile.d/fsl.sh"
	echo '. ${FSLDIR}/etc/fslconf/fsl.sh' >>	"${pkgdir}/etc/profile.d/fsl.sh"
	echo 'export FSLDIR' >>				"${pkgdir}/etc/profile.d/fsl.sh"
}
