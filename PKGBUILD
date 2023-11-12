# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
# Co-Maintainer/Author: Justin Timperio <justintimperio[at]gmail[dot]com>
 
pkgname=pacback-git
pkgver=r133.775373a
pkgrel=1
pkgdesc='Advanced Version Control for Arch Linux'
arch=('x86_64')
url='https://github.com/JustinTimperio/pacback'
license=('MIT')
provides=('pacback')
conflicts=('pacback')
# avoid overwriting modified config files
install='pacback.install'
backup=('etc/pacback.conf')
depends=('python' 'python-rich' 'python-requests' 'pacman-contrib')
makedepends=('zstd')
optdepends=('pigz: Multithreaded de/compression of custom user files')
source=('git+https://github.com/JustinTimperio/pacback.git')
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/pacback"
  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/pacback"
  git submodule init core/paf
  git config submodule.paf.url "$srcdir/paf"
  git submodule update
}

package() {
  cd "${srcdir}"
  install -dm 755 "${pkgdir}"{/usr/{share/{pacback,pacback/paf,licenses/pacback},bin/},/etc}
  install -dm 1777 "${pkgdir}"/tmp
  cp -dr --no-preserve='ownership' pacback/core "${pkgdir}"/usr/share/pacback
  cp -dr --no-preserve='ownership' pacback/LICENSE "${pkgdir}"/usr/share/licenses/pacback
  cp -dr --no-preserve='ownership' pacback/build/config "${pkgdir}"/etc/pacback.conf
  ln -sf /usr/share/pacback/core/pacback.py "${pkgdir}"/usr/bin/pacback
}
