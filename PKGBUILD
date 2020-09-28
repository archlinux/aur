# Maintainer: Ernesto Castellotti <mail@ernestocastellotti.it>
# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Dave Reisner <dreisner@archlinux.org> ([core] package)
# Maintainer: Thomas Bächler <thomas@archlinux.org> ([core] package)

pkgname=mkinitcpio-nohooks-git
pkgver=28.r0.g3340dbc
pkgrel=1
pkgdesc='Modular initramfs image creation utility - Without pacman.d and kernel.d hooks'
arch=('any')
url='http://www.archlinux.org/'
license=('GPL')
depends=('awk' 'mkinitcpio-busybox' 'kmod' 'util-linux' 'libarchive' 'coreutils'
         'bash' 'findutils' 'grep' 'filesystem' 'gzip' 'systemd-tools')
optdepends=('xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
makedepends=('git' 'asciidoc')
provides=("mkinitcpio=${pkgver}")
conflicts=('mkinitcpio' 'mkinitcpio-git')
backup=('etc/mkinitcpio.conf')
source=('git://projects.archlinux.org/mkinitcpio.git')
sha256sums=('SKIP')

pkgver() {
	cd mkinitcpio/

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
	cd mkinitcpio/

	make DESTDIR="${pkgdir}" install
	rm -r "${pkgdir}/etc/mkinitcpio.d" "${pkgdir}/usr/lib/kernel" "${pkgdir}/usr/share/libalpm" "${pkgdir}/usr/share/mkinitcpio"
}

