# Maintainer: Sam S. <smls75@gmail.com>

pkgname=snapshot-hib
pkgver=1.28+h20121219
_hibver=v28
pkgrel=1
pkgdesc='A platformer puzzle game (Humble Bundle version)'
url='http://www.retroaffect.com/games/1/snapshot/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('glu' 'sdl' 'openal' 'libvorbis')
source=('snapshot-hib.desktop')
md5sums=('b8020b21e46d0d57f9fedfcaa436ca82')
options=('!strip' '!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

case $CARCH in
    i686)   _arch=x86; _archive_md5='8c893e6152d86801768de5d222b5150e' ;;
    x86_64) _arch=x64; _archive_md5='a9e6bb953e5d443fdb63901d89f65e78' ;;
esac
source=("hib://Snapshot-linux-${_hibver}-${_arch}.tar.gz"
        'snapshot-hib.desktop')
md5sums=("$_archive_md5"
         '6df7363660caff44e3f2bfd946d12b34')

package() {
  cd $srcdir

  # Fix permissions
  find "${srcdir}/resources" -type f -exec chmod 644 {} \;
  find "${srcdir}/resources" -type d -exec chmod 755 {} \;

  # Install game files
  install -d "${pkgdir}/opt/Snapshot/"
  cp -r "${srcdir}/"{resources,snapshot.bin,snapshot,libSDL*,liblua5.1.so.0} \
        "${pkgdir}/opt/Snapshot/"

  # Install desktop entry
  install -Dm644 "${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install icon
  install -Dm644 "${srcdir}/resources/art/engine/pic_icon.png" \
                 "${pkgdir}/usr/share/pixmaps/snapshot.png"

  # Install launch script
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/Snapshot/snapshot" "${pkgdir}/usr/bin/snapshot"
}
