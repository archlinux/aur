# Maintainer: Romain Porte <microjoe@microjoe.org>

pkgname=sw4stm32
pkgver=v1.8
pkgrel=2
pkgdesc="SystemWorkbench for STM32"
arch=('x86_64')
url="http://www.openstm32.org/System+Workbench+for+STM32"
license=('unknown')
depends=('java-environment'
	'lib32-ncurses5-compat-libs')

source=(http://www.ac6-tools.com/downloads/SW4STM32/install_sw4stm32_linux_64bits-$pkgver.run
	sw4stm32
	sw4stm32.desktop)

md5sums=('f4cf8d73b867cf7c7f261a8bfea3a8b2'
	'2cb47631f9c17ae30890001eec765107'
	'fab1a998b1f24153827bfb4d9013240f')

noextract=(install_sw4stm32_linux_64bits-$pkgver.run)


package() {
	mkdir -p $pkgdir/opt/sw4stm32

	chmod +x install_sw4stm32_linux_64bits-$pkgver.run

	# See https://izpack.atlassian.net/wiki/display/IZPACK/Unattended+Installations+Using+Properties
	# for command-line instructions
	yes | java -DINSTALL_PATH=$pkgdir/opt/sw4stm32 -d64 \
		-jar install_sw4stm32_linux_64bits-$pkgver.run -options-system

	# Extract icon
	convert "${pkgdir}/opt/sw4stm32/logo_openstm32.ico" "${srcdir}/${pkgname}.png"

	# Copy icon and desktop
	install -Dm644 "${srcdir}/sw4stm32-12.png" "${pkgdir}/opt/sw4stm32/icon.png"
	install -Dm644 "sw4stm32.desktop" "${pkgdir}/usr/local/share/applications/sw4stm32.desktop"

	# Copy bash executable to path
	install -Dm755 sw4stm32 "$pkgdir/usr/local/bin/sw4stm32"

	# Copy udev rule manually
	install -Dm644 "$pkgdir/opt/sw4stm32/.installation/49-stlinkv2.rules" \
		"$pkgdir/etc/udev/rules.d/49-stlinkv2.rules"
}
