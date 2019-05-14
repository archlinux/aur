# Maintainer: robertfoster
# Contributor: Marcin Kornat <rarvolt@rarvolt.net>
# Contributor: Romain Porte <microjoe@microjoe.org>

pkgname=sw4stm32
pkgver=2.9
pkgrel=1
pkgdesc="SystemWorkbench for STM32"
arch=('x86_64')
url="http://www.openstm32.org/System+Workbench+for+STM32"
license=('CUSTOM')
depends=("java-environment=8")
options=(!emptydirs !strip)
source=("http://www.ac6-tools.com/downloads/SW4STM32/install_sw4stm32_linux_64bits-v$pkgver.run"
	$pkgname
	$pkgname.png
	$pkgname.desktop
auto-install.xml)
noextract=(install_sw4stm32_linux_64bits-v$pkgver.run)
optdepends=('arm-none-eabi-gcc: ARM compiler'
	'arm-none-eabi-gdb: ARM GDB'
	'arm-none-eabi-newlib: ARM bare metal files'
	'arm-none-eabi-binutils: ARM binutils'
'openocd: firmware flashing tool')

package() {
	HOME="$pkgdir/usr/lib/sw4stm32"
	sed "s|@HOME@|$HOME|g" auto-install.xml > unattended.xml

	cd $srcdir
	chmod +x install_sw4stm32_linux_64bits-v$pkgver.run

	java -jar install_sw4stm32_linux_64bits-v$pkgver.run unattended.xml

	# Copy icon and desktop
	install -Dm644 "sw4stm32.png" "${pkgdir}/usr/share/pixmaps/sw4stm32.png"
	install -Dm644 "sw4stm32.desktop" "${pkgdir}/usr/share/applications/sw4stm32.desktop"

	# Copy bash executable to path
	install -Dm755 sw4stm32 "$pkgdir/usr/bin/sw4stm32"

	# Copy udev rule manually
	#for i in $(seq 1 3); do
	#	install -Dm644 "$HOME/.installation/49-stlinkv$i.rules" \
		#		"$pkgdir/etc/udev/rules.d/49-stlinkv$i.rules"
	#done

	# Extracting arm cross-compiler
	CROSSPATH="$HOME/plugins/fr.ac6.mcu.externaltools.arm-none.linux64_1.17.0.201812190825/tools/st-gnu-arm-gcc-7-2018-q2-update_gdb-5_4-2016q3-linux.tar.bz2"
	CROSSDEST=$(dirname $CROSSPATH)
	tar -xf $CROSSPATH -C $(dirname $CROSSPATH)
	rm $CROSSPATH
	chmod 755 -R $CROSSDEST

	# Clean the fakeroot
	rm -rf $HOME/{.installation,stlinkserver/st-stlink*,.desktop_shortcut.sh,uninstall.jar}

	# Change configuration folder
	echo "-Dosgi.configuration.area=@user.home/.sw4stm32" >> $HOME/eclipse.bin.ini
}

md5sums=('670be5ab4b336a118aaa4179a499fcac'
	'd1dfe6479d10bbfd07b17a289aa1ae32'
	'1abad981624008108a0651b9847e183e'
	'ff9b48b50dc8a1845d002bc1f1ddb50a'
'78b8e04b38d672dc60bc14a78ac5814f')
