# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=rlvm-git
pkgver=20150819
pkgrel=1
pkgdesc="RealLive clone for Linux and OSX. Git version."
arch=(i686 x86_64)
url="http://www.elliotglaysher.org/rlvm/"
license=('GPL')
depends=('boost-libs>=1.46' glew libmad sdl_mixer sdl_image sdl_ttf guichan gtk2)
makedepends=(git scons boost)
provides=(rlvm)
conflicts=(rlvm)
source=('git+https://github.com/eglaysher/rlvm.git'
        'freetype.patch')
md5sums=('SKIP'
         '60d11c6a9b259eda3ee69c6a6ddaffac')

pkgver() {
  cd  "$srcdir/rlvm/"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
  cd "$srcdir/rlvm/"
  rm -r "$srcdir/rlvm/vendor/guichan"
  patch -p1 < "$srcdir/freetype.patch"
}

build() {
  cd "$srcdir/rlvm/"
  scons --release # --jobs 4
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

