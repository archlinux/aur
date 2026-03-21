# Maintainer: Popolon <popolon@popolon.org>

pkgname=psgplay-git
_pkgname=psgplay
pkgver=0.8
pkgrel=2
pkgdesc="Music player and emulator for the Atari ST Programmable Sound Generator (PSG) YM2149 and files in the SNDH archive."
arch=('i686' 'x86_64' 'armv7h' 'aarch64' 'riscv32' 'riscv64' 'loong64' 'powerpc' 'powerpc64le' 'powerpc64')
url="https://github.com/frno7/psgplay"
license=('GPL-2.0' 'LGPL-2.1' 'MIT')
depends=('alsa-lib' 'tinyxxd')
# looks like recent libapm changes broken submodule fetchs
source=("git+https://github.com/frno7/${_pkgname}.git"
 	"git+https://github.com/frno7/toslibc"
        "git+https://github.com/frno7/cf2149"
        "git+https://github.com/frno7/cf68901"
        "git+https://github.com/frno7/cf300588"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
    )


prepare() {
  cd "${srcdir}/${_pkgname}"
# looks like recent libapm changes broken submodule fetchs
  #  git submodule update --init --recursive
  git submodule init
  #for lib in 
  git config submodule.toslibc "$srcdir/toslibc"
  for lib in cf2149 cf68901 cf300588
  do
    git config submodule.lib/${lib}.url "$srcdir/${lib}"
  done
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${_pkgname}"
  make ALSA=1
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm644 "licence/GPL-2.0" "${pkgdir}/usr/share/licenses/${_pkgname}/GPL-2.0"
  install -Dm644 "licence/LGPL-2.1" "${pkgdir}/usr/share/licenses/${_pkgname}/LGPL-2.1"
  install -Dm644 "licence/MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/MIT"
  make prefix=/usr DESTDIR="$pkgdir" install
}

