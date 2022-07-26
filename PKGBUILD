# Maintainer: Ivan Zenin <i.zenin@gmx.com>
# Maintainer: Lukas Böger <dev AT lboeger DOT de>
# Maintainer: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Tomáš Mládek <tmladek{at}inventati{dt}org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=tmsu-git
pkgver=latest
pkgrel=4
pkgdesc="A tool for tagging your files and accessing them through a virtual filesystem. (development version)"
arch=('i686' 'x86_64')
url="https://tmsu.org/"
license=('GPL3')
depends=('fuse' 'sqlite>=3')
makedepends=('git' 'go')
provides=('tmsu')
conflicts=('tmsu' 'tmsu-bin')
source=("git+https://github.com/oniony/tmsu.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/tmsu
  ( set -o pipefail
    git describe --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  export GOPATH=/tmp
  go env -w GO111MODULE=auto

  echo "Now getting blake2b..."
  go get -u golang.org/x/crypto/blake2b

  echo "Now getting go-sqlite3..."
  go get -u github.com/mattn/go-sqlite3

  echo "Now getting go-fuse..."
  go get -u github.com/hanwen/go-fuse/fuse

  cd "${srcdir}"/tmsu
  make
}

package() {
  mkdir -p "${pkgdir}/usr/bin" \
           "${pkgdir}/usr/bin" \
           "${pkgdir}/usr/share/man/man1" \
           "${pkgdir}/usr/share/zsh/site-functions"

  cd "${srcdir}"/tmsu
  make INSTALL_DIR="${pkgdir}/usr/bin" \
  MOUNT_INSTALL_DIR="${pkgdir}/usr/bin" \
  MAN_INSTALL_DIR="${pkgdir}/usr/share/man/man1" \
  BASH_COMP_INSTALL_DIR="${pkgdir}/usr/share/bash-completion" \
  ZSH_COMP_INSTALL_DIR="${pkgdir}/usr/share/zsh/site-functions" \
  install
}
