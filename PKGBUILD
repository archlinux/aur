# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
pkgname=argonone-c-git
pkgver=r37.b30b87d
pkgrel=2
pkgdesc="A replacement daemon for Argon One Raspberry Pi cases, written in C."

_gitauthor=DarkElvenAngel
_gitname=argononed
arch=('aarch64' 'armv7h' 'armv6h' 'arm')
url="https://gitlab.com/DarkElvenAngel/argononed"
license=('MIT')
depends=('linux' 'dtc')
optdepends=('bash-completion: CLI command completion in the BASH shell')
install=install
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "argonone" "argonone-git" "argonone-rpi4")
replaces=("argonone" "argonone-git" "argonone-rpi4")
source=("${pkgname}::git+https://gitlab.com/${_gitauthor}/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Check if we are on Raspberry Pi:
	if [[ ! -f /boot/config.txt ]]; then
		echo "ERROR: 'config.txt' not found, are you on Raspberry Pi?"
		exit 1
	fi
}

build() {
	cd "${srcdir}/${pkgname}"
	[[ -f "makefile.conf" ]] && make mrproper
	./configure --prefix=/usr
	make -j$(nproc) all
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}/argononed" "${pkgdir}/usr/bin/argononed"
	install -Dm755 "${srcdir}/${pkgname}/argonone-cli" "${pkgdir}/usr/bin/argonone-cli"
	install -Dm644 "${srcdir}/${pkgname}/argononed.service" "${pkgdir}/etc/systemd/system/argononed.service"
	install -Dm755 "${srcdir}/${pkgname}/argonone-shutdown" "${pkgdir}/usr/lib/systemd/system-shutdown/argonone-shutdown"
	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -Dm644 "${srcdir}/${pkgname}/argonone.dtbo" "${pkgdir}/boot/overlays/argonone.dtbo"
}
