# Maintainer: Chiku < chirantan dot mitra at gmail dot com >

pkgname=zukitwo-themes-git
pkgver=v3.32.4.r3.ga6ea8ee
pkgrel=1
pkgdesc="A theme for GTK3, GTK2, Metacity, xfwm4, Gnome Shell and Unity - git version"
arch=('any')
url="https://github.com/lassekongo83/zuki-themes"
license=('GPL3')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-roboto: Font family for the Gnome Shell theme')
makedepends=('git' 'ninja' 'meson' 'sassc')
provides=('zukitwo-themes')
conflicts=('zukitwo-themes')
source=("$pkgname::git+https://github.com/lassekongo83/zuki-themes")
md5sums=('SKIP')

_gitroot=https://github.com/lassekongo83/zuki-themes
_gitname=zukitwo-themes

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  meson --prefix /usr --buildtype=plain build
  ninja -C build
}

package() {
  cd "$srcdir/$_gitname-build"
  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
