# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
# Co-Maintainer/Author: Justin Timperio <justintimperio[at]gmail[dot]com>

pkgname=pacback-git
pkgver=r87.1d50682
pkgrel=1
pkgdesc='Advanced Rollback Version Control for Arch Linux - Alpha'
arch=('any')
url='https://github.com/JustinTimperio/pacback'
license=('MIT')
provides=('pacback')
conflicts=('pacback')
depends=('python-tqdm' 'arch-install-scripts' 'curl')
optdepends=('pigz: Multithreaded de/compression of restore points')
source=('git+https://github.com/JustinTimperio/pacback.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/pacback"
  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/pacback"
  git submodule init core/python_scripts
  git config submodule.python_scripts.url "$srcdir/python_scripts"
  git submodule update
}

package() {
  cd "${srcdir}/pacback"
  install -dm 755 "${pkgdir}"/{usr/share/pacback,usr/bin/}
  cp -dr --no-preserve='ownership' core "${pkgdir}"/usr/share/pacback
  ln -sf /usr/share/pacback/core/pacback.py "${pkgdir}"/usr/bin/pacback
}

pre_remove() {
  pacback -rh
}
