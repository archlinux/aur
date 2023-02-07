# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Christian Hesse <mail@eworm.de
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>

pkgname=squeezelite
pkgver=1.9.9.1422
pkgrel=1
pkgdesc="Lightweight headless squeezebox emulator"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://github.com/ralph-irving/squeezelite"
license=(GPL3)
depends=(alsa-lib faad2 flac libmad libvorbis mpg123 libsoxr ffmpeg)
makedepends=(git)
install=${pkgname}.install
_commit=6394b3f987cfafdb49bb73a7381b0fbf234bc556 #micro 1422
source=("git+https://github.com/ralph-irving/squeezelite.git#commit=${_commit}"
        'squeezelite.service'
        'conffile')
sha256sums=('SKIP'
            '5b39e9754b6bcf06bcaaecab76ebf7c997966160b48692461d3be5d94ee5f004'
            'f0753a1cbd0194119226587ff9c12257438674d9b8e0179d22f0d5461ad3a70a')

pkgver() {
  cd "${srcdir}/squeezelite"

  _maj=$(cat squeezelite.h|grep "#define MAJOR_VERSION" | awk '{print $3}' | sed 's/\"//g;s/-/_/g')
  _min=$(cat squeezelite.h|grep "#define MINOR_VERSION" | awk '{print $3}' | sed 's/\"//g;s/-/_/g')
  _mic=$(cat squeezelite.h|grep "#define MICRO_VERSION" | awk '{print $3}' | sed 's/\"//g;s/-/_/g')

  printf "${_maj}.${_min}.${_mic}"
}

build() {
  cd "${srcdir}/squeezelite"

  export LDFLAGS="${LDFLAGS} -lasound -lpthread -lm -lrt"
  export OPTS="${OPTS} -DDSD -DRESAMPLE -DVISEXPORT -DFFMPEG -DLINKALL"
  make
}

package() {
  cd "${srcdir}/squeezelite"

  install -m0755 -D squeezelite "${pkgdir}/usr/bin/squeezelite"
  install -Dm644 ../conffile "${pkgdir}/etc/squeezelite.conf.default"
  install -Dm644 ../squeezelite.service -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 doc/squeezelite.1 -t "${pkgdir}/usr/share/man/man1/"
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
