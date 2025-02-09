# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=maxx-desktop
_name="MaXX"
pkgver=2.2.0
pkgrel=3
pkgdesc="MaXX Interactive Desktop"
arch=(x86_64)
url="https://docs.maxxinteractive.com/"
license=(LicenseRef-MaXX-license)
depends=(
  alsa-utils
  bash
  curl
  freetype2
  gcc                   # needed in /opt/MaXX/bin64/desktopenv:293
  gcc-libs
  glib2
  glibc
  java-runtime          # needed for /opt/MaXX/java/*.jar
  libjpeg6-turbo
  libxml2
  libxpm
  libpng
  ncurses5-compat-libs
  noto-fonts
  noto-fonts-extra
  perl
  ttf-dejavu
  xorg-server
  xterm
  xorg-xinit
  xorg-xrdb
  xorg-xsetroot
  xz
  zlib
)
optdepends=(
  'lightdm: Suggested login manager'
  'feh: Suggested image viewer'
  'xscreensaver: Suggested screen saver and locker'
)
options=(!debug)
source=("$pkgname-$pkgver.gz::https://s3.ca-central-1.amazonaws.com/cdn.maxxinteractive.com/$pkgname-installer/$_name-Desktop-v$pkgver-LINUX-${arch[0]}-tar.gz")
noextract=("$pkgname-$pkgver.gz")
sha512sums=('4c869dd59ce33f9786e3a35bc11833a2e8f67705d9d235e0875ae5bbdbbafb02c9736bc7d0419112c0ad95b76de944044269607e78d7f08390ff778f6cb513d9')
b2sums=('6db87f67b9eb960967ca5eb93e13ebe6c532d7d7a5f7f06344bed04909d0856b62faa422501b8738b9ba23f0526cc13d7a9a16140fc1455bff3708f62c1d71c2')

package() {
  install -vd "$pkgdir"/opt
  tar zxf "$pkgname-$pkgver.gz" \
    --no-same-owner \
    --exclude="share/icons/hicolor" \
    --exclude="share/inventor" \
    --exclude="share/man" \
    --exclude=".directory" \
    --exclude=".ms.swp" \
    --exclude=".dumpster" \
    -C "$pkgdir"/opt # Except conflict files from other packages and other rubbish files

  # TODO: Inspect bin64 and share folders for removing obsolete and conflict files from other packages

  # Fix non UTF-8 name
  mv "$pkgdir"/opt/$_name/share/wallpapers/Octane-Wallpapers/pexels-cátia-matos-1072179.jpg "$pkgdir"/opt/$_name/share/wallpapers/Octane-Wallpapers/pexels-catia-matos-1072179.jpg

  # Fix permissions
  chmod +r "$pkgdir"/opt/$_name/share/misc/HOME/rox.sourceforge.net/MIME-types/{application_x-,}executable

  install -vDm 644 "$pkgdir"/opt/$_name/doc/LICENSE                                 -t "$pkgdir"/usr/share/licenses/$pkgname/

  install -vd      "$pkgdir"/usr/share/icons  
  cd               "$pkgdir"/opt/$_name/share/icons
  for _iconfolder in Irix XCursor-Pro-Red redSGI sgi; do
    ln     -s      "/opt/$_name/share/icons/$_iconfolder"                              "$pkgdir/usr/share/icons/$_iconfolder"
  done

  install -vDm 644 "$pkgdir"/opt/$_name/share/xsessions/${pkgname%-desktop}.desktop -t "$pkgdir"/usr/share/xsessions/
  
}
