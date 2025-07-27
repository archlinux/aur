# Maintainer: zephyrdrh <zephyrdrh at gmx dot de>
# Contributor: Yonggang Li <gnaggnoyil@gmail.com>
# Contributor: Efe Çetin <efectn@protonmail.com>

pkgbase=grub-theme-minegrub
pkgname=(
	grub-theme-minegrub
	minegrub-theme-update-service)
_projectname=minegrub-theme
pkgver=3.1.0
pkgrel=1
pkgdesc="The minegrub theme and related utilities"
arch=('any')
url="https://github.com/Lxtharia/${_projectname}"
license=('MIT')
#depends=('grub')
source=(
	"${_projectname}-${pkgver}.tar.gz::https://github.com/Lxtharia/${_projectname}/archive/v${pkgver}.tar.gz"
	"0001-fix_update_theme_script_path.patch"
	"0002-fix_cachedir_path.patch"
)
sha256sums=('127ee3b112014dd6b26e2316ccd018084c300ecf5c401d6047efd0d5d4705112'
            '45739b6d506d0c57fc66f291bcd951c0de8103c3c7eeeb0c39b1875761f14e66'
            '695c88c58200f85e69a4f01b2b1e5388403f3b05e5b545490c779fc383b8bdf9')

prepare() {
	cd "${srcdir}/${_projectname}-${pkgver}"
	patch -i "${srcdir}/0001-fix_update_theme_script_path.patch" -p1
	patch -i "${srcdir}/0002-fix_cachedir_path.patch" -p1
}

package_grub-theme-minegrub() {
	_pkgname=grub-theme-minegrub
	pkgdesc="A Grub Theme in the style of Minecraft!"
	depends=('grub')
	optdepends=(
		'minegrub-theme-update-service: for automatic theme update'
	)

	install -dm755 "${pkgdir}/usr/share/grub/themes"
	cd "${srcdir}/${_projectname}-${pkgver}"
	find minegrub -type f -exec install -Dm 644 "{}" "$pkgdir/usr/share/grub/themes/{}" \;
	rm -f "${pkgdir}/usr/share/grub/themes/minegrub/update_theme.py"
	rm -f "${pkgdir}/usr/share/grub/themes/minegrub/update_theme.py.orig"

	install -Dpm644 "${srcdir}/${_projectname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

package_minegrub-theme-update-service() {
	_pkgname=minegrub-theme-update-service
	pkgdesc='A systemd service that automatically updates the minegrub theme'
	depends=(
		'grub-theme-minegrub'
		'systemd'
		'python-pillow'
		'fastfetch'
	)
	conflicts=('grub-theme-minegrub-git')

	install -Dpm644 "${srcdir}/${_projectname}-${pkgver}/minegrub/update_theme.py" -t "${pkgdir}/usr/share/grub/themes/minegrub"
	install -Dpm644 "${srcdir}/${_projectname}-${pkgver}/minegrub-update.service" -t "${pkgdir}/usr/lib/systemd/system"

	install -Dpm644 "${srcdir}/${_projectname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
