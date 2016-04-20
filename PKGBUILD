# Maintainer: Chiku < chirantan dot mitra at domain dot com >

pkgname=zukitwo-themes-git
pkgver=20160418.r87.7fedc33
pkgrel=1
pkgdesc="A theme for GTK3, GTK2, Metacity, xfwm4, Gnome Shell and Unity - git version"
arch=('any')
url="http://gnome-look.org/content/show.php/Zukitwo?content=140562"
license=('GPL3')
depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-roboto: Font family for the Gnome Shell theme')
makedepends=('git')
provides=('zukitwo-themes')
conflicts=('zukitwo-themes')
source=("$pkgname::git+https://github.com/lassekongo83/zuki-themes")
md5sums=('SKIP')

_gitroot=https://github.com/lassekongo83/zuki-themes
_gitname=zukitwo-themes

pkgver() {
  cd "$pkgname"
  printf "20160418.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
}

package() {
  cd "$srcdir/$_gitname-build"
  find Zuki* -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
