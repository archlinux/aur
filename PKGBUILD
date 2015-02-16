# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.0.105.7
pkgrel=1
pkgdesc='A new browser for our friends (weekly snapshot)'
url="https://vivaldi.com"
install=vivaldi.install
options=(!strip !zipman)
license=('custom')
arch=('i686' 'x86_64')
source=(
"https://vivaldi.com/download/snapshot/vivaldi-snapshot_${pkgver}-1_amd64.deb"
"https://vivaldi.com/download/snapshot/vivaldi-snapshot_${pkgver}-1_i386.deb"
)
noextract=(
"vivaldi-snapshot_${pkgver}-1_amd64.deb"
"vivaldi-snapshot_${pkgver}-1_i386.deb"
)
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
optdepends=('ffmpeg: playback of proprietary formats')
conflicts=('vivaldi')

if [[ "$CARCH" == "x86_64" ]]; then
	_arch="amd64"
elif [[ "$CARCH" == "i686" ]]; then
	_arch="i386"
fi

prepare() {
	bsdtar -xf "$srcdir/vivaldi-snapshot_${pkgver}-1_${_arch}.deb"
}

package() {
	tar -xf data.tar.xz --exclude={usr/share/{lintian,menu},etc} -C "$pkgdir/"

	# soname fix for libsystemd (udev)
	sed -e 's/libudev.so.0/libudev.so.1/g' \
		-i "$pkgdir/opt/vivaldi-snapshot/vivaldi-bin"

	# suid sanbox
	chmod 4755 "$pkgdir/opt/vivaldi-snapshot/vivaldi-sandbox"

	# install icons
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir/opt/vivaldi-snapshot/product_logo_${res}.png" \
		"$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi-snapshot.png"
	done
}

sha256sums=('089db6e6f5b7a0b22a617fab0d5a91938349f6f6b94d76f303c4649cea609235'
            '569a9816baa95b627cb655ca03a4d7dc524200dcb2c2520cfec9f9c720f33a1d')
