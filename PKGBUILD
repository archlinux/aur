# Maintainer: xsmile <sascha_r gmx de>
_gitbranch="develop"
_gitname="Sming"
pkgname=sming-git
pkgver=r946.01aa073
pkgrel=1
pkgdesc="Open Source framework for high efficiency WiFi SoC ESP8266 native development with C++ language"
arch=('i686' 'x86_64')
url="https://github.com/SmingHub/Sming"
license=('LGPL3')
depends=('esp-open-sdk' 'esptool' 'esptool2-git')
makedepends=('esp-open-sdk' 'git' 'rsync')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("${pkgname%-git}")
options=('!strip')
source=("${pkgname%-git}::git+${url}.git#branch=${_gitbranch}"
        'Makefile.patch')
md5sums=('SKIP'
         'db79ff8c17f46566e72c4cdf34505380')

pkgver()
{
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
  cd "$srcdir"
  # permanently set the paths for esp-open-sdk and sming
  patch -p1 -i "Makefile.patch"
  # pull all Git submodules
  cd "${pkgname%-git}/${_gitname}"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/${pkgname%-git}/${_gitname}"
  make
  make spiffy
}

package() {
  cd "$srcdir"
  install -d -m 755 "${pkgdir}/opt"
  rsync -a --exclude='.git*' "${pkgname%-git}/." "${pkgdir}/opt/${pkgname%-git}"
}
