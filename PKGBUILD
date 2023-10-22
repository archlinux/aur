# Maintainer: gardar <aur@gardar.net>
# Contributor: gardar <aur@gardar.net>
pkgname=zfsbootmenu
pkgver=2.2.1
pkgrel=2
pkgdesc="ZFS bootloader for root-on-ZFS systems"
license=('MIT')
url="https://github.com/zbm-dev/$pkgname"
arch=('x86_64')
depends=('zfs' 'kexec-tools' 'fzf' 'bash' 'mbuffer' 'ncurses' 'perl-sort-versions' 'perl-boolean' 'perl-yaml-pp' 'openssl-1.1')
optdepends=('dracut' 'mkinitcpio' 'efibootmgr' 'refind' 'syslinux' 'grub')
source=(
	"${pkgname}-v${pkgver}.tar.gz::${url}/archive/v$pkgver.tar.gz"
	"makefile.patch"
	"config.yaml.patch"
)
sha256sums=(
	'02b7e8b5573c843042c9f4164209e012790c05665c463f547bed03eb0821e348'
	'5104b54d161077afed8006645762aa9661c5ae8e77c0a699a0530bfd8b750a7e'
	'a2fc30c06e360d39d620b9339c79299c16b0553bc2dc875c8ebd7783d9791a16'
)
backup=("etc/${pkgname}/config.yaml" "etc/${pkgname}/mkinitcpio.conf" "etc/${pkgname}/dracut.conf.d/omit-drivers.conf" "etc/${pkgname}/dracut.conf.d/${pkgname}.conf")

# Patch for Arch compatibility with the latest zfsbootmenu.
# https://github.com/zbm-dev/zfsbootmenu/discussions/501
prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < "${srcdir}/makefile.patch"
    patch -p1 < "${srcdir}/config.yaml.patch"
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir"
        install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
