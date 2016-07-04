#  (c) Adrian Smith 2012-2015, triode1@btinternet.com
#      Ralph Irving 2015-2016, ralph_irving@hotmail.com

pkgname=squeezelite-git
pkgver=v1.8.4_758.c7a59a2
pkgrel=1
pkgdesc='Lightweight headless squeezebox emulator'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/ralph-irving/squeezelite'
license=(GPL3)
makedepends=('ffmpeg')
depends=('alsa-lib' 'faad2' 'flac' 'libmad' 'libvorbis' 'mpg123' 'libsoxr')
provides=('squeezelite')
conflicts=('squeezelite')
source=('git+https://github.com/ralph-irving/squeezelite'
	'service'
	'conffile'
	'install'
	)

install=install

pkgver() {
	cd squeezelite

	# printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	printf "%s.%s" "$(cat squeezelite.h|grep VERSION | awk '{print $3}' | sed 's/\"//g;s/-/_/g')" "$(git rev-parse --short HEAD)"
}

build() {
	cd squeezelite

	export LDFLAGS="${LDFLAGS} -lasound -lpthread -lm -lrt"
	export CFLAGS="${CFLAGS} -DDSD -DRESAMPLE -DVISEXPORT -DFFMPEG"
	make
}

package() {
	cd squeezelite

	# Main binary
	install -m0755 -D squeezelite "${pkgdir}/usr/bin/squeezelite"
	install -Dm644 ../conffile "${pkgdir}/etc/squeezelite.conf.default"
	install -Dm644 ../service "${pkgdir}/usr/lib/systemd/system/squeezelite.service"
	install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/squeezelite.LICENSE
}


sha256sums=('SKIP'
            '15695d9dbb94e41f7aae7450dcfa9fbba83f25f4d8f2427e872c20c302e486cc'
            'f0753a1cbd0194119226587ff9c12257438674d9b8e0179d22f0d5461ad3a70a'
            '0f19c6b028ad6005c21039a3cb996824ad3be54e69cc010db4c9a409ce4cdb96')

