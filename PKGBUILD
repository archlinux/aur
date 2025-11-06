# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mpd-notification-git
pkgver=0.9.3.r0.gb79f512
pkgrel=1
pkgdesc='Notify about tracks played by mpd - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/eworm-de/mpd-notification'
depends=('libsystemd' 'libsystemd.so'
         'ffmpeg' 'libavformat.so' 'libavutil.so'
         'file' 'libmagic.so'
         'iniparser' 'libiniparser.so'
         'libnotify' 'libnotify.so'
         'libmpdclient' 'libmpdclient.so')
makedepends=('git' 'systemd' 'discount')
conflicts=('mpd-notification')
provides=('mpd-notification')
license=('GPL-3.0-or-later')
source=('git+https://github.com/eworm-de/mpd-notification.git')
sha256sums=('SKIP')

pkgver() {
	cd mpd-notification/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd mpd-notification/

	make VERSION="${pkgver}-${pkgrel}"
}

package() {
	cd mpd-notification/

	make DESTDIR="${pkgdir}" install
}

