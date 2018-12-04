# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Christian Hesse <mail@eworm.de
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>

pkgname=squeezelite-git
pkgver=1.9.0.1121.r313.a203cd2
pkgrel=1
pkgdesc='Lightweight headless squeezebox emulator'
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url='https://github.com/ralph-irving/squeezelite'
license=(GPL3)
makedepends=(git)
depends=(alsa-lib faad2 flac libmad libvorbis mpg123 libsoxr)
provides=(squeezelite)
conflicts=(squeezelite)
install=squeezelite.install
source=("git+https://github.com/ralph-irving/squeezelite"
	'service'
	'conffile'
	)
sha256sums=('SKIP'
            '5b39e9754b6bcf06bcaaecab76ebf7c997966160b48692461d3be5d94ee5f004'
            'f0753a1cbd0194119226587ff9c12257438674d9b8e0179d22f0d5461ad3a70a')

pkgver() {
  cd "squeezelite"

  _maj=$(cat squeezelite.h|grep "#define MAJOR_VERSION" | awk '{print $3}' | sed 's/\"//g;s/-/_/g')
  _min=$(cat squeezelite.h|grep "#define MINOR_VERSION" | awk '{print $3}' | sed 's/\"//g;s/-/_/g')
  _mic=$(cat squeezelite.h|grep "#define MICRO_VERSION" | awk '{print $3}' | sed 's/\"//g;s/-/_/g')

  printf "%s.r%s.%s"  "${_maj}.${_min}.${_mic}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "squeezelite"

  export LDFLAGS="${LDFLAGS} -lasound -lpthread -lm -lrt"
  export OPTS="${OPTS} -DDSD -DRESAMPLE -DVISEXPORT -DLINKALL"
  make
}

package() {
  cd "squeezelite"

  install -m0755 -D squeezelite "${pkgdir}/usr/bin/squeezelite"
  install -Dm644 ../conffile "${pkgdir}/etc/squeezelite.conf.default"
  install -Dm644 ../service "${pkgdir}/usr/lib/systemd/system/squeezelite.service"
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/squeezelite.LICENSE
}

