# Maintainer: Yanli <beautyyuyanli@gmail.com>
# Contributor: cubercsl <hi@cubercsl.site>
# Contributor: glitsj16
pkgname=linuxqq-firejail
pkgver=0.0.6
pkgrel=1
epoch=1
pkgdesc='New Linux QQ based on Electron, running in Firejail sandbox.'
arch=('x86_64' 'aarch64')
url="https://github.com/BeautyYuYanli/linuxqq-firejail"
license=('unknown')
depends=('firejail' 'xdg-desktop-portal' 'flatpak-xdg-utils')
provides=('linuxqq')
profile="linuxqq-strict.profile"
source=(
	"${profile}"
	"git+https://aur.archlinux.org/linuxqq.git"
	"jsbridge-dummy.desktop"
	"jsbridge-dummy.xml"
)
sha512sums=(
	'8f5f51ad0c90594ceaae60d67a5c44c7444fcc65d58e4fb942a9570d9a088c69e2bfb49140af2cb99c774c8bd2f5cd7f7e9456c23429ea7a0147871e7c5841be'
	'SKIP'
	'037701c7be573813a75a664497ccce1b9b3a5152c9f2d0b73cd163d6ae0bd4d37c6332bd43ae8d09a2318657328a1d99cb77ba6a88824f1a6f54e8ae9ebe4986'
	'265028a10695cf879f4dc8bf87b9a9f860b774563487dedba5f2c11a233eb74dde0ee61e0a6a8618e5320302600edaeedc68114337ad455d2303e5d931cbea3f'
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

	# Add dummy jsbridge handler
	mkdir "${pkgdir}/usr/share/mime/packages/" -p
	mv "jsbridge-dummy.desktop" "${pkgdir}/usr/share/applications/"
	mv "jsbridge-dummy.xml" "${pkgdir}/usr/share/mime/packages/"
}
post_install() {
	update-desktop-database -q
	update-mime-database /usr/share/mime
}