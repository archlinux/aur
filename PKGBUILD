# Maintainer: Your Name <youremail@domain.com>
pkgname=tabby-terminal-git
_pkgname=Tabby
pkgver=1.0.184.r65.88b24e75
pkgrel=1
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://github.com/Eugeny/tabby"
license=('MIT')
depends=('nodejs''gtk3' 'at-spi2-core' 'java-runtime' 'nss' 'python' 'lib32-gcc-libs' 'alsa-lib')
makedepends=('git' 'npm' 'yarn' 'libxcrypt-compat' 'rpm-tools') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("tabby-terminal")
conflicts=("tabby-terminal")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${_pkgname}"
  yarn add shelljs npmlog
  node ./scripts/install-deps.js
}

build() {
	cd "$srcdir/${_pkgname}"
  #yarn add angular
  yarn install
  node ./scripts/build-native
  node ./scripts/vars
  yarn run build
  node ./scripts/prepackage-plugins
  node ./scripts/build-linux
}

package() {
  cd "$srcdir/${_pkgname}"
  ar x dist/*.deb
  tar -xf data.tar.xz
  cp -r usr/ $pkgdir
  cp -r opt/ $pkgdir
  install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
  #!/usr/bin/bash
  /opt/Tabby/tabby

END
}
