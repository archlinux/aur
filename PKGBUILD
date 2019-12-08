# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# {former}Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# {former}Maintainer: youngunix <zagazaw2004 () gmail ()>
# {former}Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: eht16 <enrico.troeger@uvena.de>
# Contributor: Addict7 <nicolasfloquet@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>

_gitname=geany-plugins
pkgname=$_gitname-git
pkgver=1.36.0.r19.g0bfe89d1
pkgrel=2
pkgdesc='Various plugins for Geany'
arch=('x86_64' 'i686')
url='https://plugins.geany.org/'
license=('GPL')
depends=('geany' 'ctpl' 'gpgme' 'gtkspell3' 'libgit2' 'lua51' 'webkit2gtk' 'vte3')
makedepends=('git' 'intltool' 'python')
provides=("$_gitname")
conflicts=("$_gitname-svn" "$_gitname" 'geany-plugin-markdown')
source=("git+https://github.com/geany/geany-plugins.git")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_gitname"

  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_gitname"

  ./autogen.sh \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --disable-geanypy
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "$srcdir/$_gitname"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
