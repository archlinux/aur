# Maintainer: Fermín Olaiz <ferminolaiz@gmail.com>

pkgname=hpsahba-dkms
_targetkernelver=6.18
pkgver=6.18.r41.0a57a52
pkgrel=1
pkgdesc="Kernel patches to enable HBA mode on some HP Smart Array controllers for linux-lts"
arch=('any')
url="https://github.com/im-0/hpsahba"
license=('GPL-2.0-only')
depends=('dkms'
         "linux-lts>=${_targetkernelver}"
         "linux-lts-headers>=${_targetkernelver}"
         "linux-lts<6.19.0"
         "linux-lts-headers<6.19.0")
makedepends=('git')
optdepends=('hpsahba')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}::git+${url}.git#commit=0a57a528dd5cd52214df91e4e9efd197aaa07d68"
        "hpsa.h::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/scsi/hpsa.h?h=linux-${_targetkernelver}.y"
        "hpsa.c::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/scsi/hpsa.c?h=linux-${_targetkernelver}.y"
        "hpsa_cmd.h::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/scsi/hpsa_cmd.h?h=linux-${_targetkernelver}.y"
)
sha256sums=('5afb2ac1c652f483b3c26fc6add1aa0adfcc6432f2be010bcc76fcf91cb343db'
            '250c9f7d47b511280d049faae15029a94e7da05a197573aabcd42f72ccb81920'
            '453fc03714d74a440726de5b0daddd72552c2aa4e0c760ed6a774ede21e18c3f'
            '421bde2da8b1cac0dcd09a317d6ebb1f28319dca484830991a58e4f8ef0ae34a')
pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s.r%s.%s" "${_targetkernelver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	for PATCH in "${pkgname}"/kernel/5.18-patchset-v2/*.patch; do
		patch --follow-symlinks --no-backup-if-mismatch -Np3 < "${PATCH}"
	done
}

package() {
	for FILE in hpsa.c hpsa.h hpsa_cmd.h ${pkgname}/contrib/dkms/{dkms.conf,Makefile}; do 
		install -Dm644 "${FILE}" -t "${pkgdir}/usr/src/hpsahba"
	done
}
