# Maintainer: ruxir-ig <ruchirkalokhe@gmail.com>
# Contributor: haawda <haawda@baum-lang.org>
# Contributor: unxsh <me@unxsh.cc>

pkgname=('nitch-git' 'nitch-git-nonerd')
pkgver=0.2.4.r0.g6c83449
pkgrel=1
pkgdesc="Incredibly fast system fetch written in Nim (git snapshot)"
arch=('x86_64')
url="https://github.com/ruxir-ig/nitch"
license=('MIT')
depends=()
makedepends=('nim' 'nimble' 'git')
source=("git+https://github.com/ruxir-ig/nitch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/nitch"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/nitch"

  # Build Nerd Font version
  nimble build -d:release -y

  # Build Non-Nerd Font version
  nim c -d:release -o:nitchNoNerd src/nitchNoNerd.nim
}

package_nitch-git() {
  pkgdesc="Incredibly fast system fetch written in Nim (Nerd Font icons, git version)"
  optdepends=('nerd-fonts: for icon support')
  provides=('nitch')
  conflicts=('nitch')

  cd "$srcdir/nitch"
  install -Dm755 nitch "$pkgdir/usr/bin/nitch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_nitch-git-nonerd() {
  pkgdesc="Incredibly fast system fetch written in Nim (no Nerd Font icons, git version)"
  provides=('nitch')
  conflicts=('nitch' 'nitch-git')

  cd "$srcdir/nitch"
  install -Dm755 nitchNoNerd "$pkgdir/usr/bin/nitch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
