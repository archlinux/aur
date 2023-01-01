# Maintainer: Yanli <beautyyuyanli at gmail dot com>
# Maintainer: Purofle <purofle@gmail.com>
# Contributor: Yidaozhan Ya <yidaozhan_ya@outlook.com>
# Contributor: Integral <luckys68@126.com>
# https://github.com/BeautyYuYanli/linuxqq-new-firejail
pkgname=linuxqq-new-firejail
_pkgname=tencent-qq
pkgver=3.0.0_571
pkgrel=4
pkgdesc='New Linux QQ based on Electron, running in Firejail (security sandbox)'
arch=('x86_64' 'aarch64')
url="https://im.qq.com/linuxqq/"
license=('custom')
depends=('firejail' 'nss' 'alsa-lib' 'gtk3' 'gjs' 'at-spi2-core')
optdepends=('libappindicator-gtk3: Allow QQ to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
conflicts=('linuxqq-new')
source_x86_64=("https://dldir1.qq.com/qqfile/qq/QQNT/c005c911/linuxqq_${pkgver//_/-}_amd64.deb")
source_aarch64=("https://dldir1.qq.com/qqfile/qq/QQNT/c005c911/linuxqq_${pkgver//_/-}_arm64.deb")
sha512sums_x86_64=('933a54d7a68da74854a2f3c5e6763366b1059295a477c74385333c30254ad3cd3d5be609f2c81b3b3c0af3816c542a63c6ee4110afb5858b04345fa41f852e5e')
sha512sums_aarch64=('bab4ed630e8db0c4ff07ed13e93323031aa45cd7098543da9b03d343ba733562fe2d3e1431ba5f00cfeb47561daa793c43846782e2bc87706244ce3e3790050d')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "${pkgdir}/"
	chmod -R 755 "${pkgdir}/"

	echo "  -> Installing..."

	# Wrapper for Firejail
	wrapper="${pkgdir}/opt/QQ/qq_wrapper"
	echo "#!/bin/bash" > $wrapper
	echo "mkdir ~/.linuxqq -p" >> $wrapper
	echo "firejail --private=~/.linuxqq /opt/QQ/qq" >> $wrapper
	chmod 755 $wrapper

	# Launcher
	install -d "${pkgdir}/usr/bin/"
	ln -s "/opt/QQ/qq" "${pkgdir}/usr/bin/${_pkgname}"
	ln -s "/opt/QQ/qq_wrapper" "${pkgdir}/usr/bin/${_pkgname}_wrapper"

	# Launcher Fix
	sed -i "3s!/opt/QQ/qq!/usr/bin/${_pkgname}_wrapper!" "${pkgdir}/usr/share/applications/qq.desktop"

	# License
	install -Dm644 "${pkgdir}/opt/QQ/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgdir}/opt/QQ/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
