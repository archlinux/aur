# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wootility-lekker-beta
pkgname=${_pkgname}-appimage
pkgver=4.0.2
pkgrel=4
pkgdesc='Utility for configuring Wooting keyboards (binary AppImage version)'
arch=('x86_64')
url='https://wooting.io/wootility'
license=('unknown')
depends=('fuse2')
makedepends=('p7zip')
provides=("wootility")
conflicts=("wootility")
options=(!strip)
_appimage="${_pkgname}-${pkgver}-beta.AppImage"
install=$pkgname.install
source=("https://s3.eu-west-2.amazonaws.com/wooting-update/wootility-lekker-linux-beta/${_appimage}"
        '70-wooting.rules'
        'wooting-lekker-xinput@.service'
        'wooting-xinput@.service')
noextract=("${_appimage}")
b2sums=('589f4294db3f69e2907ff2b7817a68f5edc9446e6cb432ce949f665f5eac1c3de4d0bee4c2b89511b9d042195144429d8bc3477d212b685d489ab5c694e97a46'
        '0b42256dae0ffd71ba7fb521581c485d4e11eeeba049de59c7cc0aa6daa1119b33a2d65d0674e46ec826fc14768cc9494d2ebd0efafc4aa8840373436a1531b7'
        '2126e811c54bb7b40e5f5f50f52a5e01633fa7e08c72cc2a18f2fc7b3de83a96196cab0bdd2605ab9a82efb71f64909640f7fcff70d5c0f79abe50a64bbce5d2'
        '7dbac8d655d65bbd5fa496dfe3085e5a2c2164f0738442d64f00c76b0308589bd659a6a17962955b4026b93ef23edcca01f9a0fe7136232f50098dd312e8cd1f')

prepare() {
	7z x "${_appimage}" 'wootility-lekker-beta.desktop' 'usr/share/icons' > /dev/null
}

build() {
	sed -i -E "s|Exec=AppRun|Exec=${_pkgname}|" wootility-lekker-beta.desktop
	# Fix permissions; .AppImage permissions are 700 for all directories
	chmod -R a-x+rX usr
}

package() {
	install -Dpm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_appimage}"
	install -d "${pkgdir}/usr/bin"
	ln -s "../../opt/${_pkgname}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dpm644 'wootility-lekker-beta.desktop' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -d "${pkgdir}/usr/share/icons"
	cp -a usr/share/icons/hicolor "${pkgdir}/usr/share/icons/hicolor"
	install -Dpm644 '70-wooting.rules' "${pkgdir}/usr/lib/udev/rules.d/70-wooting.rules"
	install -Dpm644 'wooting-lekker-xinput@.service' "${pkgdir}/etc/systemd/system/wooting-lekker-xinput@.service"
	install -Dpm644 'wooting-xinput@.service' "${pkgdir}/etc/systemd/system/wooting-xinput@.service"
}
