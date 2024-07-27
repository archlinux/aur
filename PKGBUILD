# Maintainer: MojArch

pkgname=opera-developer
pkgver=114.0.5236.0
pkgrel=2
pkgdesc='A fast and secure web browser and Internet suite - developer stream'
arch=('x86_64')
url='https://www.opera.com/computer'
license=('custom:opera')
provides=('opera')
depends=('gtk3' 'alsa-lib' 'libnotify' 'curl' 'nss' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
optdepends=(
    'opera-developer-ffmpeg-codecs-bin: additional support for proprietary codecs for opera-developer, extracted directly from the chromium-ffmpeg snap (higly recomended)'
    'upower: opera battery save'
)
source=(
    "https://get.geo.opera.com/pub/${pkgname}/${pkgver}/linux/${pkgname}_${pkgver}_amd64.deb"
    "opera"
    "default"
)
sha256sums=('7e605ae7a32dd36fb2e1e5f81a0636dc041c2ef63740813f2ea9d288b207cc67'
            '508512464e24126fddfb2c41a1e2e86624bdb0c0748084b6a922573b6cf6b9c5'
            '99fc0d2822edd14e234d451995db47148125e4580221a292598959421d131231')

prepare() {
    sed -e "s/%pkgname%/$pkgname/g" -i "$srcdir/opera"
    sed -e "s/%operabin%/$pkgname\/$pkgname/g" \
        -i "$srcdir/opera"

}

package() {
    tar -xf data.tar.xz --exclude=usr/share/{lintian,menu} -C "$pkgdir/"

	# get rid of the extra subfolder {i386,x86_64}-linux-gnu
	(
        cd "$pkgdir/usr/lib/"*-linux-gnu/
        mv "$pkgname" ../
	)
    rm -rf "$pkgdir/usr/lib/"*-linux-gnu

    # suid opera_sandbox
    chmod 4755 "$pkgdir/usr/lib/$pkgname/opera_sandbox"

	# install default options
    install -Dm644 "$srcdir/default" "$pkgdir/etc/$pkgname/default"

	# install opera wrapper
    rm "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/opera" "$pkgdir/usr/bin/$pkgname"

	# license
	install -Dm644 \
        "$pkgdir/usr/share/doc/$pkgname/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/copyright"
}

