# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Christian Hesse <mail@eworm.de
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>

pkgname=squeezelite
pkgver=2.0.0.1488
pkgrel=1
pkgdesc="Lightweight headless squeezebox emulator"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://github.com/ralph-irving/squeezelite"
license=(GPL3)
depends=(alsa-lib faad2 flac libmad libvorbis mpg123 libsoxr ffmpeg)
makedepends=(git)
install=${pkgname}.install
_commit=0e85ddfd79337cdc30b7d29922b1d790600bb6b4 #micro 1488
source=("git+https://github.com/ralph-irving/squeezelite.git#commit=${_commit}"
        'squeezelite.service'
        'conffile')
sha256sums=('8f06eb69af2efd02f65254f5d0eb564337e69cca1dd15dee53ffc7d075cee239'
            '9bffedd1d119e6b8643007c8e3ca674266100fb091e4c1458893a42388d4e90e'
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
