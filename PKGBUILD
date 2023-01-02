# Maintainer: Yanli <beautyyuyanli@gmail.com>
# Contributor: cubercsl <hi@cubercsl.site>
# Contributor: glitsj16
pkgname=linuxqq-firejail
pkgver=0.0.2
pkgrel=1
pkgdesc='Run QQ in Firejail (security sandbox). Install linuxqq before this.'
arch=('x86_64' 'aarch64')
url="https://github.com/BeautyYuYanli/linuxqq-firejail"
license=('unknown')
# TODO: add linuxqq
depends=('firejail' 'xdg-desktop-portal' 'flatpak-xdg-utils')
profile="linuxqq.profile"
source=(
	"${profile}"
	"xdg-open"
)
sha512sums=(
	'a4ee0f052e34868363067afd7a0964a1e3b8967c153fac0a52b0669e2f1ab84c0a1a2709f855c42fb3bb5271c3c909d7bdae285772e3b599cb3a77f6b298d376'
	'78ed919ce27036d57f34bca748d8834948269e20e45a6db4e487989a97061922c6cfb0dcbc8faea8cf66008aaf5cd769570c293300d9de1281a08063fa3a7c4a'
)

package() {
	# Patch Firejail
	echo "  -> Patching Firejail..."
	mkdir "${pkgdir}/etc/firejail" -p
	mv "${profile}" "${pkgdir}/etc/firejail/"

	# Patch xdg-open
	mkdir "${pkgdir}/usr/local/bin/" -p
	mv "xdg-open" "${pkgdir}/usr/local/bin/"

	# Wrap launcher
	echo "  -> Wrapping launcher..."
	mkdir "${pkgdir}/usr/share/applications" -p
	cp "/usr/share/applications/qq.desktop" "${pkgdir}/usr/share/applications/qq-firejail.desktop"
	sed -i "2s!QQ!QQ in Firejail!" "${pkgdir}/usr/share/applications/qq-firejail.desktop"
	sed -i "3s!/usr/bin/linuxqq!firejail --profile=/etc/firejail/${profile} /usr/bin/linuxqq!" "${pkgdir}/usr/share/applications/qq-firejail.desktop"
}
