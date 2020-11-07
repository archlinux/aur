# Maintainer: Saurabh Kumar Sharma <saurabh000345 at gmail dot com>

pkgname=soundcloud-nativefier 
pkgver=1.0
pkgrel=1
pkgdesc="Stream great music! SoundCloud Client built with nodejs-nativefier (electron)"
arch=("i686" "x86_64")
url="https://soundcloud.com/"
license=("GPL")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier")

source=("${pkgname}.desktop" "${pkgname}.png")
sha256sums=("b10535d6488d742bcbb3b334e936156bb2682b748507389927399dc0fa65f1d9"
            "8d44f32553624110623423ec3f34181c27f5b5453efbd67ca5525e446c64be3f")

build() {
	cd "${srcdir}"
	nativefier "https://soundcloud.com" --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:70.0) Gecko/20100101 Firefox/70.0' --name "SoundCloud" --internal-urls ".*soundcloud.com.*" -m -i "${pkgname}.png"
}

package() {
	install -dm755 "${pkgdir}/"{opt,usr/share/applications,usr/bin}
	cp -rL "${srcdir}/SoundCloud-linux"* "${pkgdir}/opt/${pkgname}"
	chmod +x "${pkgdir}/opt/${pkgname}/SoundCloud"
	ln -s "/opt/${pkgname}/SoundCloud" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
	do
		install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
		convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
	done
}
