# Maintainer: stick <stick@stma.is>
pkgname=ida-eval
pkgver=7.4
pkgrel=2
pkgdesc='Interactive, programmable, extensible, multi-processor disassembler (evaluation version)'
arch=('x86_64')
url='https://out7.hex-rays.com/demo'
license=('custom')
depends=('qt5-base')
options=('!strip')
_installer='idademo74_linux.run'
source=("$_installer"
	"$pkgname.desktop")
sha256sums=('547373518e2823a94195ea5e06cacf53c101610afa0f642204e7265f4b548045'
	'0ccb62aca554831233a9d968a7a886693dfcdd2f03f97d360981d73e9664a982')

package() {
	install -d "$pkgdir"/opt/"$pkgname"
	install -d "$pkgdir"/usr/bin
	install -d "$pkgdir"/usr/share/{icons,applications,licenses/"$pkgname"}
	install -d "$pkgdir"/tmp

	chmod +x "$_installer"
	./"$_installer" --mode unattended --prefix "$pkgdir"/opt/"$pkgname" \
		--installpassword ""
	rmdir "$pkgdir"/tmp

	# the installer needlessly makes a lot of files executable
	find "$pkgdir"/opt/"$pkgname" -type f -exec chmod -x {} \;
	chmod +x "$pkgdir"/opt/"$pkgname"/{ida64,assistant}

	rm "$pkgdir"/opt/"$pkgname"/{uninstall*,Uninstall*}

	install "$srcdir"/"$pkgname".desktop "$pkgdir"/usr/share/applications
	ln -s /opt/"$pkgname"/appico64.png "$pkgdir"/usr/share/icons/"$pkgname".png
	ln -s /opt/"$pkgname"/license.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

	cat <<-"EOF" >"$pkgdir"/usr/bin/ida64-eval
		#!/bin/sh
		if [ "$QT_QPA_PLATFORM" == wayland-egl ]; then
		    QT_QPA_PLATFORM= /opt/ida-eval/ida64
		else
		    /opt/ida-eval/ida64
		fi
	EOF
	chmod +x "$pkgdir"/usr/bin/ida64-eval
}
