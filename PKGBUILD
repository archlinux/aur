# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Andrew Shark <ashark linuxcomp.ru>

pkgname=supermicro-update-manager
pkgver=2.8.1
pkgrel=1
pkgdesc="Update the BMC and UEFI/BIOS firmware for Supermicro motherboards"
arch=(x86_64)
url="https://www.supermicro.com/en/solutions/management-software/supermicro-update-manager"
license=('custom: EULA')
backup=(etc/sumrc)
_rel_date=20220506
source=(
  "https://www.supermicro.com/Bios/sw_download/440/sum_${pkgver}_Linux_x86_64_${_rel_date}.tar.gz"
)
sha256sums=('f458076e94f9fd822b1a82a44bf7087a57e58c2ad47c6fe7e11091fe3e1cbff3')
depends=('zlib')

package() {
	cd sum_"$pkgver"_Linux_x86_64
	
	install -Dm644 sumrc.sample "$pkgdir/etc/sumrc"
	sed -i '1{s|.*|# To use this config you should symlink to this file with "ln -s /etc/sumrc $HOME/.sumrc" command.|}' "$pkgdir/etc/sumrc"
	sed -i '2{s|.*|# Alternatively, invoke supermicro-update-manager with "--rc_path=/etc/sumrc" parameter.|}' "$pkgdir/etc/sumrc"
	sed -i 's|#journal_path = /home/administrator/journal/supermicro/test|journal_path = /var/log/supermicro-update-manager|' "$pkgdir/etc/sumrc"
	sed -i 's|#journal_level = 0|journal_level = 6|' "$pkgdir/etc/sumrc"
	
	install -m755 -d "${pkgdir}"/var/log/supermicro-update-manager
	
	install -D SUM_UserGuide.pdf "$pkgdir/usr/share/doc/supermicro-update-manager/SUM_UserGuide.pdf"
	install -D PlatformFeatureSupportMatrix.pdf "$pkgdir/usr/share/doc/supermicro-update-manager/PlatformFeatureSupportMatrix.pdf"
	install -Dm755 sum "$pkgdir/usr/bin/supermicro-update-manager" # rename executable file to not conflict with gnu sum.
	
	# ExternalData folder: contains SMCIPID.txt, tui.fnt, VENID.txt. I do not know when they are used, so did not packaged them.
	# acpica_bin folder: contains acpidump and acpiexec. I do not know when they are used, so did not packaged them.
	# driver folder: sum_bios.ko only needed if InBand SMI E7h support is not implemented in BIOS. I have not seen such systems, but if you have, please contact me and I will edit pkgbuild.
	# policy_sample.xml - I did not packaged it. Contact me if you need that.
	# servicecalls_sample.xml - I did not packaged it. Contact me if you need that.
	# ReleaseNote.txt - I did not packaged it. Contact me if you need that.
}
