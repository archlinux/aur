# Maintainer: Batuhan Baserdem <lastname.surname@gmail.com>

pkgname=genkernel-next-git
pkgver=69.r2.g7b20b78
pkgrel=1
pkgdesc='Kernel compiliation and initramfs image creation utility - git checkout'
arch=('any')
url='https://github.com/Sabayon/genkernel-next'
license=('GPL2')
depends=('bash'
        'lvm2'
        'thin-provisioning-tools'
        'util-linux'
        'pax-utils'
        'cpio')
optdepends=('cryptsetup: Enable support for LUKS disk encryption'
            'gnupg: Enable support for GPG'
            'mdadm: Enable support for mdadm'
            'dmraid: Enable support for dmraid'
            'open-iscsi: Enable iscsi support'
            'plymouth: Enable framebuffer splash support')
makedepends=('git' 'asciidoc' 'e2fsprogs' 'udev')
provides=('genkernel')
backup=('etc/genkernel.conf')
source=('git://github.com/Sabayon/genkernel-next.git')
sha256sums=('SKIP')

pkgver() {
	cd genkernel-next/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
        printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

package() {
	cd genkernel-next/

	make DESTDIR="${pkgdir}" install
}
