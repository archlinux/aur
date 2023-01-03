# Maintainer: Yanli <beautyyuyanli@gmail.com>
# Contributor: cubercsl <hi@cubercsl.site>
# Contributor: glitsj16
pkgname=linuxqq-firejail
pkgver=0.0.5
pkgrel=1
epoch=1
pkgdesc='QQ in Firejail (security sandbox).'
arch=('x86_64' 'aarch64')
url="https://github.com/BeautyYuYanli/linuxqq-firejail"
license=('unknown')
depends=('firejail' 'xdg-desktop-portal' 'flatpak-xdg-utils')
provides=('linuxqq')
profile="linuxqq-strict.profile"
source=(
	"${profile}"
	"git+https://aur.archlinux.org/linuxqq.git"
)
sha512sums=(
	'8f5f51ad0c90594ceaae60d67a5c44c7444fcc65d58e4fb942a9570d9a088c69e2bfb49140af2cb99c774c8bd2f5cd7f7e9456c23429ea7a0147871e7c5841be'
	'SKIP'
)
prepare() {
	# Install linuxqq
	cd "linuxqq"
	makepkg -si
}
package() {
	# Patch Firejail
	echo "  -> Patching Firejail..."
	mkdir "${pkgdir}/etc/firejail" -p
	mv "${profile}" "${pkgdir}/etc/firejail/"

	# Wrap launcher
	echo "  -> Wrapping launcher..."
	mkdir "${pkgdir}/usr/share/applications" -p
	cp "/usr/share/applications/qq.desktop" "${pkgdir}/usr/share/applications/qq-firejail.desktop"
	sed -i "2s!QQ!QQ in Firejail!" "${pkgdir}/usr/share/applications/qq-firejail.desktop"
	sed -i "3s!Exec=!Exec=sh -c \"env PATH=/usr/lib/flatpak-xdg-utils:\$PATH firejail --profile=/etc/firejail/${profile} !" "${pkgdir}/usr/share/applications/qq-firejail.desktop"
	sed -i "3s!%U!\"%U!" "${pkgdir}/usr/share/applications/qq-firejail.desktop"
}
