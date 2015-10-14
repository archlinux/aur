# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=rlvm-git
pkgver=20150819
pkgrel=1
pkgdesc="RealLive clone for Linux and OSX. Git version."
arch=(i686 x86_64)
url="http://www.elliotglaysher.org/rlvm/"
license=('GPL')
depends=('boost-libs>=1.46' glew libmad sdl_mixer sdl_image sdl_ttf guichan)
makedepends=(scons boost)
source=('git+https://github.com/eglaysher/rlvm.git' 'detect_guichan.patch')
md5sums=('SKIP' '357e8680838cf8b27ab3c3eaa73d3107')

pkgver() {
  cd  "$srcdir/rlvm/"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/rlvm/"
  patch -p1 < "$srcdir/detect_guichan.patch"

  scons --release

}

package() {
  cd "$srcdir/rlvm/"

  install -D "$srcdir/rlvm/build/release/rlvm" "$pkgdir/usr/bin/rlvm"
  install -D "$srcdir/rlvm/src/platforms/gtk/rlvm.desktop" "$pkgdir/usr/share/applications/rlvm.desktop"
  for r in 16 24 32 48 128 256; do
    install -d "$pkgdir/usr/share/icons/hicolor/${r}x$r"
    install -D "$srcdir/rlvm/resources/$r/rlvm.png" "$pkgdir/usr/share/icons/hicolor/${r}x$r/apps/rlvm.png"
  done
}

