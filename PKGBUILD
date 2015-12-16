# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi
pkgver=1.0.303.52
pkgrel=2
pkgdesc='An advanced browser made with the power user in mind.'
url="https://vivaldi.com"
install=${pkgname}.install
options=(!strip !zipman)
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
optdepends=(
    'vivaldi-ffmpeg-codecs: playback of proprietary video/audio'
    'google-chrome: Widevine DRM Plugin'
)
source=('vivaldi-ffmpeg-codecs.patch')
source_i686=("https://vivaldi.com/download/stable/vivaldi-beta-${pkgver}-2.i386.rpm")
source_x86_64=("https://vivaldi.com/download/stable/vivaldi-beta-${pkgver}-2.x86_64.rpm")
sha256sums=('8e24a7074d9c8719040f6731ab91ab888a410d98bd41486aca96b35f79eeef6b')
sha256sums_i686=('3910a588bb3e1b6ad4cf9e5b6ab48e8b496b9b45cc7b212b5bceb5d43507c527')
sha256sums_x86_64=('75a91e2b228a516507af61d35dbfceb282f9d97614e0c402ebca75cf5ecfd81d')

package() {
    cp -a opt "$pkgdir"
    install -dm755 "$pkgdir/usr/bin/"

    # cheat to have the vivaldi path
    mv "$pkgdir/opt/vivaldi-beta" "$pkgdir/opt/vivaldi"

	# suid sanbox
	chmod 4755 "$pkgdir/opt/vivaldi/vivaldi-sandbox"

    # link to vivaldi from /usr/bin
    ln -sf "/opt/vivaldi/vivaldi" "$pkgdir/usr/bin/vivaldi"

    # fix internal vivaldi link
    (
        cd "$pkgdir/opt/vivaldi"
        rm vivaldi
        ln -s vivaldi-beta vivaldi
    )

	# install icons
	for res in 16 22 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir/opt/vivaldi/product_logo_${res}.png" \
		"$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi.png"
	done

    # install desktop file
    install -Dm644 usr/share/applications/vivaldi-beta.desktop \
        "$pkgdir/usr/share/applications/vivaldi.desktop"
    sed -e "s/-beta//g" -i "$pkgdir/usr/share/applications/vivaldi.desktop"

    # allow playback of proprietary video/audio when alternative ffmpeg.so is installed
    cd "$pkgdir/opt/vivaldi"
    patch -p1 -i "$srcdir/vivaldi-ffmpeg-codecs.patch"
}

