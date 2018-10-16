# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

# Contributor: Christian Hesse <mail@eworm.de
# Contributor: Mika Fischer <mika.fischer@zoopnet.de>

pkgname=squeezelite-r2-git
pkgver=1.8.4.R2.r6.g75797ed
pkgrel=2
pkgdesc='Lightweight headless squeezebox emulator - version r2'
arch=('i686' 'x86_64' 'armv6h')
url='http://www.marcoc1712.it/'
license=(GPL3)
depends=('alsa-lib')
makedepends=('git' 'alsa-lib' 'faad2' 'flac' 'libmad' 'libvorbis' 'mpg123' 'portaudio')
optdepends=('faad2: Support for decoding AAC'
	'flac: Support for decoding FLAC'
	'libmad: Support for decoding MP3'
	'libvorbis: Support for decoding Ogg Vorbis'
	'mpg123: Support for decoding MP3'
	'portaudio: Use of binary using portaudio for output')
provides=('squeezelite')
conflicts=('squeezelite')
source=('git+https://github.com/marcoc1712/squeezelite-R2' "squeezelite@.service" "squeezelite" )
sha256sums=('SKIP' '0f884ee7ce301855507489c97472e6d5ee0ff9a336a28793f8ae3455d94cbbdf' '6811051615d46b0ac5a7587f8174336352f3b74efc2ac5df892f212b00ef412c')
backup=('etc/conf.d/squeezelite')
install=squeezelite.install

pkgver() {
  cd squeezelite-R2/
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\(//g;s/\)//g'
}

build() {
	cd squeezelite-R2/
   export LDFLAGS="${LDFLAGS} -lasound -lpthread -lm -lrt"
   export OPTS="${OPTS} -DDSD"
	# build squeezelite
	make
}

package() {
   install -Dm644 "squeezelite" "$pkgdir/etc/conf.d/squeezelite"
	install -Dm644 "squeezelite@.service" "$pkgdir/usr/lib/systemd/system/squeezelite@.service"
	
	cd squeezelite-R2/

	# Install binaries
	install -Dm755 squeezelite-R2 "${pkgdir}/usr/bin/squeezelite"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	
}

