# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=servedir
pkgver=0.2
pkgrel=1
pkgdesc='Simple tool for sharing and uploading files through HTTP protocol.'
license=('MIT')
arch=('x86_64' 'i686')
url='https://github.com/mikolajb/servedir'
depends=()
makedepends=('go')

_gitname='servedir'
_gitroot='git@github.com:mikolajb/servedir.git'
prepare() {
  cd "$srcdir"

  msg2 "Connecting to Git..."

  if [[ -d $_gitname ]]; then
    cd $_gitname
    git fetch --depth=1
    git reset --hard origin/master
    msg2 "Local checkout updated or server timeout"
    cd ..
  else
    git clone --depth=1 $_gitroot $_gitname
    msg2 "Checkout done or server timeout"
  fi

  cp -urT $_gitname ${_gitname}-build
}

build() {
  msg2 'Compiling...'

  cd ${_gitname}-build
  go build -o ${pkgname}
}

package() {
  msg2 'Installing...'

  install -Dm755 ${_gitname}-build/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
