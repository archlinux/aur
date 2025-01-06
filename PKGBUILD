# Maintainer: Florian Hülsmann <fh@cbix.de>
# Contributor: Miroslav Koškár <http://mkoskar.com/>

_slug=AudibleInstruments
_name=AudibleInstruments
pkgname=vcvrack-audible-instruments
pkgver=2.0.0
pkgrel=1
pkgdesc="Mutable Instruments VCV modules"
url='https://github.com/VCVRack/AudibleInstruments'
license=(GPL-3.0-or-later LicenseRef-dist)
arch=(aarch64 x86_64)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
groups=(pro-audio vcvrack-plugins)
# https://github.com/VCVRack/AudibleInstruments/issues/119
_commit='a15554e33721c2f8f65bb6b0f59588307fb6e625'
source=("git+https://github.com/VCVRack/$_name#commit=$_commit"
        'git+https://github.com/VCVRack/pichenettes-eurorack'
        'git+https://github.com/pichenettes/avr-audio-bootloader'
        'git+https://github.com/pichenettes/avril'
        'git+https://github.com/pichenettes/avrilx'
        'git+https://github.com/pichenettes/stm-audio-bootloader'
        'git+https://github.com/pichenettes/stmlib')
sha256sums=('a602265d7136fee95ac26b29771ffadae3349412f93ba4e7c21190c45db8e072'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $_name
  git submodule init
  git config submodule.eurorack.url "$srcdir"/pichenettes-eurorack
  git -c protocol.file.allow=always submodule update

  cd eurorack
  git submodule init
  git config submodule.avr-audio-bootloader.url "$srcdir"/avr-audio-bootloader
  git config submodule.avril.url "$srcdir"/avril
  git config submodule.avrilx.url "$srcdir"/avrilx
  git config submodule.stm-audio-bootloader.url "$srcdir"/stm-audio-bootloader
  git config submodule.stmlib.url "$srcdir"/stmlib
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  # remove common license
  rm "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE-GPLv3.txt
}
