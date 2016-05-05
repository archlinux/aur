# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/gabmus/everseer

pkgname=everseer-client-git
pkgver=0.1
pkgrel=2
pkgdesc='Electron based multi-machine system monitor'
arch=('x86_64')
url='https://github.com/gabmus/everseer'
license=('GPLv3')
depends=('gtk2')
optdepends=('openssh: ssh support' 'xterm: launch ssh window')
makedepends=('git' 'npm')
install=everseer-client-git.install
source=("everseer::git+git://github.com/gabmus/everseer")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/everseer/everseer-client"
  sed -e "s/<%= description %>/$pkgdesc/" \
    -e "s|<%= appName %>|Everseer|"\
    -e "s|<%= installDir %>/share/<%= appFileName %>|/usr/bin|"\
    -e "s|<%= iconPath %>|/usr/share/everseer-client/resources/app/icon.png|"\
    resources/linux/everseer.desktop.in > resources/linux/Everseer.desktop
}

build() {
  cd "$srcdir/everseer"
  npm install electron-packager
  ./node_modules/electron-packager/cli.js everseer-client Everseer --platform=linux --arch=x64
}

package() {
  cd "$srcdir/everseer"
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/bin
  cp -r Everseer-linux-x64 $pkgdir/usr/share/everseer-client
  cp everseer-client/resources/linux/Everseer.desktop $pkgdir/usr/share/applications/
  ln -s /usr/share/everseer-client/Everseer $pkgdir/usr/bin/everseer
}
