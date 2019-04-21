# Maintainer: Bakasura <bakasura@protonmail.ch>

pkgname=kawanime-git
pkgver=0.3.1.r211.g1546acd
pkgrel=1
pkgdesc='Desktop app for anime fans'
arch=('x86_64')
url='https://kawanime.com'
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm' 'libicns')
optdepends=()
provides=('kawanime')
conflicts=('kawanime')
replaces=('kawanime')
_gitname='kawanime'
source=("$_gitname::git+https://github.com/kylart/kawanime.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"

  npm install && npm run build && npm run dist:linux
}

package() {
  cd "$_gitname/dist"

  ar x *.deb
  tar -xf data.tar.xz

  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_gitname" <<END
#!/bin/sh
/opt/KawAnime/kawanime
END

}
