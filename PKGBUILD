# Maintainer: Litao Lu <lulitao1997@gmail.com>
# From this directory: makepkg -sf
# Driver + firmware come from the vendor zip (not stored in git); Linux 6.13+ fixes are applied via patch.

pkgname=aic8800d80-pcie-dkms
pkgver=6.4.3.0
pkgrel=5

pkgdesc="DKMS modules for AIC8800D80 PCIe Wi-Fi and companion USB Bluetooth adapters (Ugreen CM958 and similar)"
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
  "0003-normalize-driver-logging.patch"
  "0004-aic-btusb-bluez.patch"
  "0005-linux-7.1-compat.patch"
  "0006-linux-7.2-compat.patch"
  "aic8800d80-sleep-hook"
  "aic8800d80-btusb.conf"
  "dkms.conf"
  "aic.rules"
)
sha256sums=(
  'c929c2ff22ba0b55e26ecaccb57f04edc11bb84767d31ac068b8087dd4a8c53a'
  '6e8562dcb93f114bdbf759506967f9504ffc5fc9043b94b616449ba43d1d34ef'
  '98699379ab9b302c0e5059d6a16e1598ad3ace7cfb15570c988c994c12a0333f'
  '60744f321ef8f069e10efeb579a20a6114aeefa5796c0da2d9e0e0c91965ff8e'
  'cf5532c0254f9f0f6ce80b6f0eda15f3103cebfdb6af500c9d38cd04cda0295b'
  'b78fb00a2afab38213fd705d6500c3a9dd6456fd394c548829d831f28392f88f'
  'd955a5ab2c34ba71272b704f61db7ecc5fa54e636e5dbc783ccdd69604a5be9f'
  '1d34e929c3570cfae9aea2b79d3e143ca89c41ad165457e10c143c2bb74489da'
  '17abd63c992a6929015475561fb183e955ad1402d25c64cfd1e63a40290fa21b'
  '88d8e7274bc799eada757fabc87ec90dade6f3e6757075f4ba5fc7537f2acee8'
  '8f35c85a2fa9435bb9b393c6f51eee990c588b42c6ff0c8cbc0c97f6294e19be'
)

prepare() {
	bsdtar -C "$srcdir" -xf "$srcdir/UGREEN-CM958-75615_Linux_Drive_V1.0.zip"
	bsdtar -C "$srcdir" -xf "$srcdir/Linux/aic8800_linux_drvier.zip"
	bsdtar -C "$srcdir/aic8800_linux_drvier" -xf "$srcdir/aic8800_linux_drvier/aic_btusb.zip"
	sed -i 's/\r$//' "$srcdir/aic8800_linux_drvier/aic_btusb/aic_btusb.h"
	patch -d "$srcdir/aic8800_linux_drvier" -p1 -i "$srcdir/0001-linux-6.13-plus-compat.patch"
	patch -d "$srcdir/aic8800_linux_drvier" -p1 -i "$srcdir/0002-export-pci-modalias.patch"
	patch -d "$srcdir/aic8800_linux_drvier" -p1 -i "$srcdir/0003-normalize-driver-logging.patch"
	patch -d "$srcdir/aic8800_linux_drvier" -p1 -i "$srcdir/0004-aic-btusb-bluez.patch"
	patch -d "$srcdir/aic8800_linux_drvier" -p1 -i "$srcdir/0005-linux-7.1-compat.patch"
	patch -d "$srcdir/aic8800_linux_drvier" -p1 -i "$srcdir/0006-linux-7.2-compat.patch"
}

package() {
	local _drv="${srcdir}/aic8800_linux_drvier/drivers/aic8800/aic8800_fdrv"
	local _bt="${srcdir}/aic8800_linux_drvier/aic_btusb"
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

	install -dm755 "${_dst}/aic_btusb"
	while IFS= read -r -d '' f; do
		local rel
		rel="${f#${_bt}/}"
		case "$rel" in
			*.o|*.ko|*.mod|*.mod.c|*.cmd|*.orig|*.rej|modules.order|Module.symvers|build.log) continue ;;
		esac
		install -Dm644 "$f" "${_dst}/aic_btusb/${rel}"
	done < <(find "${_bt}" -maxdepth 1 -type f -print0)

	sed "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${pkgver}\"/" "${srcdir}/dkms.conf" \
		> "${_dst}/dkms.conf"
	chmod 644 "${_dst}/dkms.conf"

	install -dm755 "${pkgdir}/usr/lib/udev/rules.d"
	install -Dm644 "${srcdir}/aic.rules" \
		"${pkgdir}/usr/lib/udev/rules.d/70-aic8800d80.rules"
	install -dm755 "${pkgdir}/usr/lib/modprobe.d"
	install -Dm644 "${srcdir}/aic8800d80-btusb.conf" \
		"${pkgdir}/usr/lib/modprobe.d/aic8800d80-btusb.conf"
	install -dm755 "${pkgdir}/usr/lib/systemd/system-sleep"
	install -Dm755 "${srcdir}/aic8800d80-sleep-hook" \
		"${pkgdir}/usr/lib/systemd/system-sleep/aic8800d80"

	local _fw="${srcdir}/aic8800_linux_drvier/fw/aic8800D80"
	if [[ -d "${_fw}" ]]; then
		install -dm755 "${pkgdir}/usr/lib/firmware/aic8800D80"
		install -Dm644 "${_fw}/"* -t "${pkgdir}/usr/lib/firmware/aic8800D80/"
	fi
}
