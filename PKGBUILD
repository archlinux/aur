# Maintainer:  Yangtse Su <yangtsesu@gmail.com>, Carson McManus <carson.mcmanus1@gmail.com>

_gitname=steamguard-cli
pkgname="$_gitname"-git
pkgver=0.3.5.0.r0.2b50148
pkgrel=2
pkgdesc="A linux utility for setting up and using Steam Mobile Authenticator (AKA Steam 2FA) on the command line"
arch=('any')
url="https://github.com/dyc3/steamguard-cli"
license=('MIT')
depends=('mono')
makedepends=('git' 'nuget')

provides=('steamguard-cli')
conflicts=('steamguard-cli')
options=('!strip')
source=('git+https://github.com/dyc3/steamguard-cli.git'
        'git+https://github.com/dyc3/SteamAuth.git'
	'steamguard')
md5sums=('SKIP'
         'SKIP'
	 'ee6cb214cbc9f4e5f5fe119d55fdff0c')

prepare() {
  cd $_gitname
  git submodule init
  git config submodule.SteamAuth.url $srcdir/SteamAuth
  git submodule update
}

pkgver () {
  cd $_gitname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
 
build() {
  cd $_gitname
  make
}
 
package() {
  cd $_gitname
  install -Dm755 build/steamguard "$pkgdir/usr/lib/$_gitname/steamguard"
  install -Dm644 build/Newtonsoft.Json.dll "$pkgdir/usr/lib/$_gitname/Newtonsoft.Json.dll"
  install -Dm644 build/SteamAuth.dll "$pkgdir/usr/lib/$_gitname/SteamAuth.dll"
  install -Dm644 bash-tab-completion "$pkgdir/etc/bash_completion.d/steamguard"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
  install -Dm755 "$srcdir/steamguard" "$pkgdir/usr/bin/steamguard"
}

