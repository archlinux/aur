# Maintainer: Andrea Richiardi <a.richiardi.work at gmail dot com>

# Patched NVIDIA open kernel modules: consumer-GPU P2P over PCIe BAR1 / NVLink.
# Fork: aikitoria/open-gpu-kernel-modules. It replaces nvidia-open-dkms.
#
# Release: tag this repository with the packaged upstream driver version, so
# users can check out an exact release. The tag equals $pkgver, e.g.:
#     git tag 615.78.08 && git push origin 615.78.08

pkgname=nvidia-open-p2p-dkms
pkgver=615.78.08
pkgrel=1
pkgdesc='NVIDIA open kernel modules patched for consumer GPU P2P (PCIe BAR1 / NVLink)'
arch=('x86_64' 'aarch64')
url='https://github.com/aikitoria/open-gpu-kernel-modules'
license=('MIT AND GPL-2.0-only')
depends=('dkms' "nvidia-utils=$pkgver")
provides=('nvidia-open-dkms' 'nvidia-open' 'nvidia-dkms' 'NVIDIA-MODULE')
conflicts=('nvidia-open-dkms' 'nvidia-open' 'nvidia-dkms' 'nvidia')
options=('!strip' '!debug')

# The fork publishes per-driver branches (<pkgver>-p2p), so a moving branch or
# tag would break the checksum. Pin the exact commit instead.
_commit=efed6748b6e7bfc81273f61c148554aa5944e107

source=("$pkgname-$pkgver.tar.gz::https://github.com/aikitoria/open-gpu-kernel-modules/archive/$_commit.tar.gz"
	'dkms.conf')
sha256sums=('2562e8237a99913ee44340f2e517f27b914b31b40e90f9d8b1b4c784330a4fb7'
	'ae4b05b85bd3514189978c21a26371cd444cdd38ff6db4eb49f9524a9d43f787')

package() {
	local _src="open-gpu-kernel-modules-$_commit"
	local _dst="$pkgdir/usr/src/$pkgname-$pkgver"

	install -dm755 "$_dst"
	cp -a "$_src/." "$_dst/"
	# The upstream tree ships a template dkms.conf under kernel-open/; the real
	# one for this package lives at the source root. Drop the template.
	rm -f "$_dst/kernel-open/dkms.conf"
	install -Dm644 dkms.conf "$_dst/dkms.conf"
	install -Dm644 "$_src/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
