# Maintainer: Daniel Parks <danielrparks at gmail dot com>
pkgname=acp3x-rn-dkms
_upstreamver='5.8-rc3'
pkgver="${_upstreamver/-/}"
pkgrel=1
pkgdesc="Renoir audio co-processor drivers from release candidate 5.8"
arch=('x86_64')
url="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/amd?h=v$_upstreamver"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=('linux>=5.8.0')
source=("https://git.kernel.org/torvalds/t/linux-$_upstreamver.tar.gz"
	      'dkms.conf'
			  'dkms.conf.sig')
noextract=("linux-$_upstreamver.tar.gz")
sha256sums=('3b983f9c93c791424e4d0894031625d1d6b5ec04ec09a09de0248b374329ef05'
	          'SKIP'
						'SKIP') # todo
validpgpkeys=('8A144654AD99CA9E984F4156EC74EAEC196A648E')

prepare() {
	bsdtar -xf "linux-$_upstreamver.tar.gz" "linux-$_upstreamver/sound/soc/amd/renoir"
}

package() {
	# used amd-sfh-hid-dkms as reference
	local DEST="$pkgdir/usr/src/${pkgname%-dkms}-$pkgver"
	local SRC="linux-$_upstreamver/sound/soc/amd/renoir"

	install -dm755 "$DEST"

	for f in "$SRC/"*.[hc] "$SRC/Makefile"; do
		install -m644 "$f" "$DEST"
	done

	install -m644 dkms.conf "$DEST"

	# substitution in dkms.conf
	sed -e 's/PACKAGE_NAME=""/PACKAGE_NAME="'"${pkgname%-dkms}"'"/' \
		  -e 's/PACKAGE_VERSION=""/PACKAGE_VERSION="'"$pkgver"'"/' \
			-i "$DEST/dkms.conf"
}
