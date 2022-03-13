# Maintainer: SpacingBat3 <aur@spacingbat3.anonaddy.com>
pkgname=argonone-c-git
pkgver=r152.e7671c1
pkgrel=2
pkgdesc="A replacement daemon for Argon One Raspberry Pi cases, written in C."

_gitauthor=DarkElvenAngel
_gitname=argononed
arch=('aarch64' 'armv7h' 'armv6h' 'arm')
url="https://gitlab.com/DarkElvenAngel/argononed"
license=('MIT')
depends=('linux' 'dtc')
optdepends=(
      'bash-completion: CLI command completion in the BASH shell'
			'systemd: Run daemon at system boot'
			'logrotate: Automatic logs rotation'
)
install=install
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "argonone" "argonone-git" "argonone-rpi4")
source=("${pkgname}::git+https://gitlab.com/${_gitauthor}/${_gitname}.git")
md5sums=('SKIP')
backup=('etc/logrotate.d/argononed')

_BIN_DIR="${pkgname}/build"
_COMMON_DIR="${pkgname}/OS/_common"

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
	install -Dm755 "${srcdir}/${_BIN_DIR}/argononed" "${pkgdir}/usr/bin/argononed"
	install -Dm755 "${srcdir}/${_BIN_DIR}/argonone-cli" "${pkgdir}/usr/bin/argonone-cli"
	install -Dm755 "${srcdir}/${_BIN_DIR}/argonone-shutdown" "${pkgdir}/usr/lib/systemd/system-shutdown/argonone-shutdown"
	install -Dm644 "${srcdir}/${_COMMON_DIR}/argononed.service" "${pkgdir}/usr/lib/systemd/system/argononed.service"
	install -Dm644 "${srcdir}/${_COMMON_DIR}/argononed.logrotate" "${pkgdir}/etc/logrotate.d/argononed"
	install -Dm644 "${srcdir}/${_COMMON_DIR}/argonone-cli-complete.bash" "${pkgdir}/usr/share/bash-completion/completions/argonone-cli"
	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
	install -Dm644 "${srcdir}/${_BIN_DIR}/argonone.dtbo" "${pkgdir}/boot/overlays/argonone.dtbo"
}
