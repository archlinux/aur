# Maintainer: Your Name <youremail@domain.com>
pkgname=archipelago-git
_pkgname=archipelago
pkgver=v2.3.2.r482.61afeb0
pkgrel=1
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://github.com/npezza93/archipelago"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm' 'yarn') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("archipelago")
conflicts=("archipelago")
replaces=('archipelago')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
	cd "$srcdir/${_pkgname}"
    yarn install
    yarn run compile
    yarn run build
}

package() {
  cd "$srcdir/${_pkgname}"
  ar x dist/*.deb
  tar -xf data.tar.xz
  cp -r usr/ $pkgdir
  cp -r opt/ $pkgdir
  install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
  #!/usr/bin/bash
  /opt/Archipelago/archipelago

END
}
