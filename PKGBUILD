# Maintainer: Pietagorh <pietagorhh at proton dot me>
pkgname=key-gunner
pkgver=1.3.1
pkgrel=1
pkgdesc="A game where you defeat waves of enemies by typing"
arch=('x86_64')
url='https://zad-man.itch.io/key-gunner'
license=('custom:commercial')
depends=('wine')
source=(
	"hib://KeyGunnerPortable${pkgver}.zip"
	launch-script.sh
	key-gunner.desktop
	key-gunner_iconsrc.png::'https://img.itch.zone/aW1nLzE5NDI4MDIyLnBuZw==/original/tlzD7z.png'
)
sha256sums=(
	'1ff9ceee6afa689d9b23ad6c31edd80831c5cb50292e5b2ee1d2421c3cfe080c'
	'ce80193e3b750688d83c6e663bcef441de1c529fea44834622172a4ab8e23beb'
	'65403ef470ce1b292aa19cef49daacf80bbdfd88609319baad5a49ea8d7ee3c8'
	'21b2763c4daee08cc6548fb3ca418bfe0c56b4b923a78a6c19692122e2cef5c4'
)
noextract=("KeyGunnerPortable${pkgver}.zip")
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

prepare() {
	mkdir -p key-gunner
	bsdtar -C key-gunner -xf "KeyGunnerPortable${pkgver}.zip"

	magick key-gunner_iconsrc.png -background transparent -gravity center -extent 1660x1660 key-gunner_square.png
	for _size in 16 24 32 48 64 96 128 256; do
		magick key-gunner_square.png -resize "${_size}x${_size}" "key-gunner_x${_size}.png"
	done
}

package() {
	for _size in 16 24 32 48 64 96 128 256; do
		_destdir="${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps"
		install -d -m755 "${_destdir}"
		install -Dm644 "key-gunner_x${_size}.png" "${_destdir}/${pkgname}.png"
	done

	_destdir="${pkgdir}/usr/share/${pkgname}"
	install -d -m755 "${_destdir}"
	find key-gunner -type f -exec \
		install -Dm644 {} "${_destdir}" \;

	_destdir="${pkgdir}/usr/bin"
	install -d -m755 "${_destdir}"
	install -Dm755 launch-script.sh "${_destdir}/${pkgname}"

	_destdir="${pkgdir}/usr/share/applications"
	install -d -m755 "${_destdir}"
	install -Dm755 key-gunner.desktop "${_destdir}/${pkgname}.desktop"
}
