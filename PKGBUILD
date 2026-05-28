# Maintainer: Stephano Cetola <stephano@cetola.net>
pkgname=reform-tools
pkgver=1.87
pkgrel=3
pkgdesc="MNT Reform system tools & helpers"
arch=('x86_64' 'aarch64')
url="https://source.mnt.re/reform/reform-tools"
license=('GPL3')
install=reform-tools.install


depends=(
  'python'
  'python-psutil'
  'i2c-tools'
  'cryptsetup'
  'lvm2'
  'parted'
  'jq'
  'rsync'
  'e2fsprogs'
)
makedepends=(
  'git'
  'help2man'
  'imagemagick'
  'pkgconf'
  'plymouth'
)
optdepends=(
  'mtd-utils: for NAND flashing tools'
  'alsa-utils: for audio-related tools'
  'lm_sensors: for sensor monitoring'
  'ircii: for Reform chat/IRC tools'
  'pavucontrol: GUI mixer control (if using PulseAudio)'
)

source=(
  "git+https://source.mnt.re/reform/reform-tools.git#tag=7048b8b2be903764a3777f47c68fc5fff5c3ccc3"
  'motd-full'
  'motd-rescue'
)
sha256sums=(
  'SKIP'
  'e11f4e0d24edbb52f6bd1fa6599bd81a41c7cca7143eb52e66a48f9423e1e1a2'
  'fba668d174ec937c97ad8281202c4bc1d1e3d388dc950ad7b062ab3b19888334'
)

build() {
  cd "$srcdir/reform-tools"
  make
}

package() {
  cd "$srcdir/reform-tools"

  # libdirarch is overridden to /usr/lib because Arch does not use multiarch
  # library directories; without this the Makefile appends the empty output of
  # 'cc --print-multiarch' and produces a path with a double slash.
  make install DESTDIR="$pkgdir" prefix=/usr libdirarch=/usr/lib

  # MOTD files are maintained in this packaging repo, not upstream.
  install -Dm644 "$srcdir/motd-full"   "$pkgdir/etc/motd-full"
  install -Dm644 "$srcdir/motd-rescue" "$pkgdir/etc/motd-rescue"
}
