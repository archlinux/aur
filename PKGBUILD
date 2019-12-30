# Maintainer: Dasith Gunawardhana <dasith@dg10a.com>
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>

_pkgname=fraidycat
pkgname=${_pkgname}-git
pkgver=v1.0.7.r2.g76d1b26
pkgrel=1
pkgdesc="Follow blogs, wikis, YouTube, Twitter, Reddit, Instagram and the like... from a distance."
arch=('x86_64')
url="https://fraidyc.at"
license=('BlueOak-1.0.0')
depends=('libnotify' 'nss' 'libxss' 'libxtst' 'libsecret' 'libappindicator-gtk3')
optdepends=("xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
makedepends=('npm' 'git' 'git-lfs' 'gendesk')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

prepare() {
	gendesk -f -n --name Fraidycat --pkgname "${_pkgname}" --pkgdesc "$pkgdesc" --exec="/opt/${_pkgname}/${_pkgname} %U" --categories 'News' --custom "StartupWMClass=Fraidycat"

	rm -rf "$srcdir/${_pkgname}"

	git clone https://github.com/kickscondor/fraidycat.git
	cd "$srcdir/${_pkgname}"
	git lfs install
	git lfs pull
}

pkgver() {
	cd "${_pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
	cd "$srcdir/${_pkgname}"
	npm install --cache "$srcdir/npm-cache"
	npm run electron:linux
}

package() {
	cd "$srcdir/${_pkgname}"

	install -dm755 "${pkgdir}/opt/${_pkgname}"
	cp -dr --no-preserve=ownership dist/linux-unpacked/* "${pkgdir}/opt/${_pkgname}/"

	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"

	for size in 16 32 64 128 512; do
		icons_dir=${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps
		install -dm755 "${icons_dir}"
		install -Dm644 src/images/flatcat-${size}.png "${icons_dir}/${_pkgname}.png"
	done

	install -D -m644 "$srcdir/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
