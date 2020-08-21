# Maintainer: Patrick Oppenlander <patrick.oppenlander@gmail.com>

pkgname=trace32
pkgver=2020_02_000121039
pkgrel=1
pkgdesc="Lauterbach TRACE32 - REQUIRES MANUAL DOWNLOAD"
arch=(x86_64)
url="https://www.lauterbach.com/"
source=(local://TRACE32_R_$pkgver.tar.xz install.sh)
md5sums=(3dffffeae09b894f5e50fd41d67d4524 afce9a50619896f769c88a8cee144749)
depends=(openmotif libjpeg6-turbo qt4)
options=(!strip)

package()
{
	"$srcdir"/install.sh "$srcdir"/setup_linux.sh "$pkgdir"/opt/t32
	# cd "$pkgdir"/opt/t32 && unzip -o /path/to/update.zip 
	install -dm755 "$pkgdir"/etc/udev/rules.d
	install -m 644 "$srcdir"/files/bin/pc_linux64/udev.conf/kernel_starting_4.14/10-lauterbach.rules "$pkgdir"/etc/udev/rules.d
	sed -i "s#$pkgdir##g" "$pkgdir"/opt/t32/config_*.t32
	sed -i 's#"/home/$USER/t32"#/opt/t32#' "$pkgdir"/opt/t32/bin/pc_linux64/t32_start.sh
	sed -i 's#/var/tmp#/opt/t32/tmp#' "$pkgdir"/opt/t32/bin/pc_linux64/t32_start.sh
	install -dm755 "$pkgdir"/usr/bin
	cd "$pkgdir"/opt/t32/bin/pc_linux64 && for f in t32*; do ln -s /opt/t32/bin/pc_linux64/"$f" "$pkgdir"/usr/bin; done
}
