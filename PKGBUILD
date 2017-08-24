# Maintainer:  Yangtse Su <yangtsesu@gmail.com>

_gitname=steamguard-cli
pkgname="$_gitname"-git
pkgver=v0.3.2.0.r0.gfe26a5c
pkgrel=1
pkgdesc="A linux utility for setting up and using Steam Mobile Authenticator (AKA Steam 2FA) on the command line"
arch=('x86_64')
url="https://github.com/dyc3/steamguard-cli"
license=('custom')
depends=('mono' 'nuget')
makedepends=('git')

provides=('steamguard-cli')
conflicts=('steamguard-cli')
source=('git+https://github.com/dyc3/steamguard-cli.git'
        'git+https://github.com/geel9/SteamAuth.git')
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd $_gitname
  git submodule init
  git config submodule.SteamAuth.url $srcdir/SteamAuth
  git submodule update
}

pkgver () {
  cd $_gitname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
 
build() {
  cd $_gitname
  make
}
 
package() {
  cd $_gitname
  install -d "$pkgdir/usr/lib/$_gitname"
  install -Dm755 build/steamguard "$pkgdir/usr/lib/$_gitname"
  install -Dm644 build/Newtonsoft.Json.dll "$pkgdir/usr/lib/$_gitname"
  install -Dm755 build/SteamAuth.dll "$pkgdir/usr/lib/$_gitname"
  install -Dm644 bash-tab-completion "$pkgdir/etc/bash_completion.d/steamguard"

  install -d "${pkgdir}/usr/bin"
  echo -e '#!/bin/sh\nexec /usr/lib/steamguard-cli/steamguard $*' > $pkgdir/usr/bin/steamguard
  chmod 755 $pkgdir/usr/bin/steamguard
}

