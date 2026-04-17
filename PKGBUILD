# Maintainer: Litao Lu <lulitao1997@gmail.com>
# From this directory: makepkg -sf
# Driver + firmware come from the vendor zip (not stored in git); Linux 6.13+ fixes are applied via patch.

pkgname=aic8800d80-pcie-dkms
pkgver=6.4.3.0
pkgrel=1

pkgdesc="DKMS module for AIC8800D80 PCIe Wi-Fi adapters (Ugreen CM958 and similar)"
arch=('x86_64')
url="https://www.aicsemi.com/"
license=('GPL-2.0-or-later')
depends=('dkms')
conflicts=('aic8800d80-dkms')
optdepends=('LINUX-HEADERS: kernel headers for building the module')

# No install= script: pacman hook from package "dkms" registers modules under /usr/src/*/dkms.conf

source=(
  "UGREEN-CM958-75615_Linux_Drive_V1.0.zip::https://download.lulian.cn/2026-drive/UGREEN-CM958-75615_Linux_Drive_V1.0.zip"
  "0001-linux-6.13-plus-compat.patch"
  "0002-export-pci-modalias.patch"
  "0003-default-quiet-logging.patch"
  "0004-quiet-pcie-dma-progress.patch"
  "aic8800d80-sleep-hook"
)
sha256sums=(
  'c929c2ff22ba0b55e26ecaccb57f04edc11bb84767d31ac068b8087dd4a8c53a'
  '6e8562dcb93f114bdbf759506967f9504ffc5fc9043b94b616449ba43d1d34ef'
  '98699379ab9b302c0e5059d6a16e1598ad3ace7cfb15570c988c994c12a0333f'
  '0aea176f35d1f80898d2680c0b4117392d22e47846f42d83b9cc3a7b787f4639'
  '8b3fa1408d8762424761f41989581cf03a0cace9ff506ddb9529db5510480a01'
  '1d34e929c3570cfae9aea2b79d3e143ca89c41ad165457e10c143c2bb74489da'
)

prepare() {
	bsdtar -C "$srcdir" -xf "$srcdir/UGREEN-CM958-75615_Linux_Drive_V1.0.zip"
	bsdtar -C "$srcdir" -xf "$srcdir/Linux/aic8800_linux_drvier.zip"
	patch -d "$srcdir/aic8800_linux_drvier" -p1 -i "$srcdir/0001-linux-6.13-plus-compat.patch"
	patch -d "$srcdir/aic8800_linux_drvier" -p1 -i "$srcdir/0002-export-pci-modalias.patch"
	patch -d "$srcdir/aic8800_linux_drvier" -p1 -i "$srcdir/0003-default-quiet-logging.patch"
	patch -d "$srcdir/aic8800_linux_drvier" -p1 -i "$srcdir/0004-quiet-pcie-dma-progress.patch"
}

package() {
	local _root="${startdir}/.."
	local _drv="${srcdir}/aic8800_linux_drvier/drivers/aic8800/aic8800_fdrv"
	local _dst="${pkgdir}/usr/src/aic8800-${pkgver}"

	install -dm755 "${_dst}"

	while IFS= read -r -d '' f; do
		local bn
		bn=$(basename "$f")
		case "$bn" in
			*.o|*.ko|*.mod|*.mod.c|*.cmd|*.orig|*.rej|modules.order|Module.symvers|build.log) continue ;;
		esac
		install -Dm644 "$f" "${_dst}/${bn}"
	done < <(find "${_drv}" -maxdepth 1 -type f -print0)

	sed "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" "${_root}/dkms.conf" \
		> "${_dst}/dkms.conf"
	chmod 644 "${_dst}/dkms.conf"

	install -dm755 "${pkgdir}/usr/lib/udev/rules.d"
	install -Dm644 "${_root}/aic.rules" \
		"${pkgdir}/usr/lib/udev/rules.d/70-aic8800d80.rules"
	install -dm755 "${pkgdir}/usr/lib/systemd/system-sleep"
	install -Dm755 "${srcdir}/aic8800d80-sleep-hook" \
		"${pkgdir}/usr/lib/systemd/system-sleep/aic8800d80"

	local _fw="${srcdir}/aic8800_linux_drvier/fw/aic8800D80"
	if [[ -d "${_fw}" ]]; then
		install -dm755 "${pkgdir}/usr/lib/firmware/aic8800D80"
		install -Dm644 "${_fw}/"* -t "${pkgdir}/usr/lib/firmware/aic8800D80/"
	fi
}
