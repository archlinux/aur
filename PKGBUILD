# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgname=deadbeef-plugin-spectrogram-git
pkgver=0.+r25.20150110
pkgrel=1
pkgdesc="Spectrogram Plugin for the DeaDBeeF audio player (development version)"
url="https://github.com/cboxdoerfer/ddb_spectrogram"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('deadbeef')
makedepends=('git')
conflicts=('deadbeef-plugin-spectrogram')
source=(git+"${url}")
sha512sums=('SKIP')
_reponame=("${url##*/}")

pkgver() {
	cd "${srcdir}/${_reponame}"; (
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "0.+r%s.%s" "$(git rev-list --count HEAD)" "$(git log -1 --pretty='%cd' --date=short | sed 's|-||g')"
	)
}

build() {
	make -C "${srcdir}/${_reponame}"
}

package() {
	cd "${srcdir}/${_reponame}"
	install -d "${pkgdir}/usr/lib/deadbeef/"
	install -p gtk2/ddb_vis_spectrogram_GTK2.so gtk3/ddb_vis_spectrogram_GTK3.so "${pkgdir}/usr/lib/deadbeef"
}
