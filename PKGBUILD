# Maintainer: Daniel T. Borelli < daltomi at aol >

pkgname=fxmediainfo
pkgver=6.30
pkgrel=1
pkgdesc="MediaInfo front-end based by FOX Toolkit"
arch=('i686' 'x86_64')
url='https://bitbucket.org/daltomi/fxmediainfo'
license=('GPL2')
depends=('fox-devel' 'libmediainfo')
makedepends=('git' 'cmake')
optdepends=('ttf-ms-fonts: Courier font' 'xdg-utils: for HTML help')
_gitroot=$url.git
_gitname='fxmediainfo'

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" --depth=1 --single-branch --branch "v.$pkgver" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

build() {
  src_git=$srcdir/$_gitname/

#Build  
  msg "Starting build..."
  cd $src_git/
  cmake -DCMAKE_BUILD_TYPE=Release . && make 
}

package() {
  echo "v.$pkgver" > "$srcdir/$_gitname/VERSION"
  install -Dm755 "$srcdir/$_gitname/VERSION" "$pkgdir/usr/share/$pkgname/VERSION"
  install -Dm755 "$srcdir/$_gitname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$srcdir/$_gitname/contributors.txt" "$pkgdir/usr/share/$pkgname/contributors.txt"
  install -Dm755 "$srcdir/$_gitname/Languages/es_AR/$pkgname.mo" "$pkgdir/usr/share/locale/es_AR/LC_MESSAGES/$pkgname.mo"
  install -Dm755 "$srcdir/$_gitname/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$srcdir/$_gitname/$pkgname.png" "$pkgdir/usr/share/$pkgname/$pkgname.png"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm755 "$srcdir/$_gitname/docs/"* "$pkgdir/usr/share/doc/$pkgname/"
}
