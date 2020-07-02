# Maintainer: Michael Taboada <michael@2mb.solutions.
# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
pkgname=swamp-wine
pkgver=3.8E
pkgrel=2
pkgdesc="First-person Audio Shooter"
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'pentium4')
url="https://kaldobsky.com/audiogames"
license=('custom')
_depends_x86_64=(lib32-sdl2 lib32-ncurses lib32-mpg123 lib32-libpulse lib32-libpng lib32-libjpeg-turbo lib32-gnutls lib32-alsa-plugins lib32-alsa-lib lib32-mesa lib32-openal)
depends=(wine winetricks wine_gecko wine-mono sdl2 ncurses mpg123 libpulse libpng libjpeg-turbo gnutls alsa-plugins alsa-lib mesa openal)
if [ "$CARCH" == "x86_64" ] ;then
  depends+=(${_depends_x86_64[@]})
fi
makedepends=(unzip wget)
install="swamp-wine.install"
source=('swamp.sh'
        'swamp.desktop')
md5sums=('662be95ce8b52349f32e1d895f850ec2'
         '34dc658b23e7411ee8af44d01b4877f1')

prepare() {
  cd "$srcdir"
  _fullver=3.8C
  [ ! -f swamp-${_fullver}.zip ] && wget 'https://kaldobsky.com/audiogames/Swamp.zip' -O swamp-${_fullver}.zip
  _fullsum=57b40c8eb603ce0d4afdcdb0ab0d5df6
  if [ "$_fullsum" = "$(md5sum swamp-${_fullver}.zip | cut -d\  -f1)" ] ; then
    mkdir swamp
    unzip -q -d swamp swamp-${_fullver}.zip
  else
    echo "Md5sum doesn't match for swamp-${_fullver}.zip, please notify the package maintainer." >&2
    return 1
  fi
  if [ "$pkgver" != "$_fullver" ] ; then
    _patchver=$pkgver
    [ ! -f swamp-patch-${_fullver}-to-${_patchver}.zip ] && wget 'https://kaldobsky.com/audiogames/SwampPatch.zip' -O swamp-patch-${_fullver}-to-${_patchver}.zip
    _patchsum=3cd33a805aac615b9f6b9abb82c2f804
    if [ "$_patchsum" = "$(md5sum swamp-patch-${_fullver}-to-${_patchver}.zip | cut -d\  -f1)" ] ; then
      unzip -o -q -d swamp swamp-patch-${_fullver}-to-${_patchver}.zip
    else
      echo "Md5sum doesn't match for swamp-patch-${_fullver}-to-${_patchver}.zip, please notify the package maintainer." >&2
      exit 1
    fi
  fi
    }

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir"/opt/swamp
  cp -R swamp/* "$pkgdir"/opt/swamp
  install -dm755 "$pkgdir"/usr/bin
  install -m755 swamp.sh "$pkgdir"/usr/bin/swamp
  install -dm755 "$pkgdir"/usr/share/applications/
  cp swamp.desktop "$pkgdir"/usr/share/applications
}
