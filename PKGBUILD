# Maintainer:
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: J. W. Birdsong <jwbirdsong@gmail.com>

pkgname=luakit-git
gitname=luakit
pkgver=r2735.5f2a71b
pkgrel=1
pkgdesc='Browser framework based on Webkit and Lua'
arch=('x86_64' 'i686')
url='https://github.com/luakit/luakit'
license=('GPL3')
makedepends=('help2man' 'git')
provides=('luakit')
conflicts=('luakit')
depends=('webkitgtk2' 'lua51-filesystem' 'libunique' 'luajit')
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
  make PREFIX=/usr all
}

package() {
  cd "${srcdir}/${gitname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  chmod -x "$pkgdir/usr/share/pixmaps/luakit.png"
  chmod -x "$pkgdir/usr/share/applications/luakit.desktop"
}
