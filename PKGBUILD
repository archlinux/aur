# Maintainer:
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: J. W. Birdsong <jwbirdsong@gmail.com>

pkgname=luakit-git
gitname=luakit
pkgver=r2740.44e04aa
pkgrel=2
pkgdesc='fork of luakit using webkit2'
arch=('x86_64' 'i686' 'armv7h')
url='https://github.com/aidanholm/luakit'
license=('GPL3')
makedepends=('git')
provides=('luakit')
conflicts=('luakit')
depends=('webkit2gtk' 'lua51-filesystem' 'luajit')
backup=('etc/xdg/luakit/binds.lua'
        'etc/xdg/luakit/globals.lua'
        'etc/xdg/luakit/modes.lua'
        'etc/xdg/luakit/rc.lua'
        'etc/xdg/luakit/theme.lua'
        'etc/xdg/luakit/webview.lua'
        'etc/xdg/luakit/window.lua')
options=('!makeflags')
source=("git://github.com/aidanholm/luakit#branch=develop")
md5sums=('SKIP')

pkgver() {
   cd "$srcdir/$gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$gitname"
  sed -i '1s,lua,luajit,' build-utils/gentokens.lua
}

build() {
  cd "${srcdir}/${gitname}"
  make DEVELOPMENT_PATHS=0 PREFIX=/usr all
}

package() {
  cd "${srcdir}/${gitname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  chmod -x "$pkgdir/usr/share/pixmaps/luakit.png"
  chmod -x "$pkgdir/usr/share/applications/luakit.desktop"
}
