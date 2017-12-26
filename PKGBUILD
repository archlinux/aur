# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=bterm-git
_pkgname=bterm
pkgver=v1.1.0.r8.bb1f02b
pkgrel=1
pkgdesc="cross-platform terminal emulator"
arch=('x86_64')
url="https://github.com/bleenco/bterm"
license=('MIT')
conflicts=('bterm')
depends=('nodejs')
#dpkg is not actually needed, it's just to avoid a build failure
makedepends=('git' 'npm' "libicns" "dpkg")
source=("bterm-git::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

# Git, tags available
printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

build() {
	cd "$srcdir/${pkgname}"
  npm install
  npm install 7zip-bin-linux
  npm run app
}

package() {
	cd "$srcdir/${pkgname}"
  ar x dist/*.deb
  tar -xf data.tar.xz
  mv usr "${pkgdir}"
  mv opt "${pkgdir}"

  install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
  #!/usr/bin/bash
  /opt/bterm/bterm

END
}
