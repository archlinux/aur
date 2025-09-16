# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Co-maintainer: Nebulosa <nebulosa2007 at yandex dot ru>

pkgname=maxx-desktop
_name="MaXX"
pkgver=2.2.0
pkgrel=8
pkgdesc="MaXX Interactive Desktop"
arch=(x86_64)
url="https://docs.maxxinteractive.com/"
license=(LicenseRef-MaXX-license)
depends=(
  alsa-utils
  at-spi2-core
  cairo
  curl
  fontconfig
  freeglut
  freetype2
  gcc                      # ?? needed in MaXX/bin64/desktopenv:293
  gcc-libs
  gdk-pixbuf2
  # giflib4                # obsolete building issue
  glib2
  glibc
  glu
  glew
  gtk2
  gtk3
  imlib2
  # java-runtime            # needed for MaXX/java/*.jar, skipping for now for shrink dependencies size
  libglvnd
  libjpeg6-turbo
  libice
  libid3tag
  libnotify
  libpng
  libpng15
  libtiff5
  libsm
  libwebp
  libx11
  libxau
  libxaw
  libxcb
  libxcomposite
  libxcrypt-compat
  libxdamage
  libxext
  libxfixes
  libxft
  libxi
  libxinerama
  libxkbfile
  libxml2-legacy
  libxmu
  libxp
  libxpm
  libxrandr
  libxrender
  libxss
  libxt
  libxxf86vm
  libwebp
  ncurses5-compat-libs
  noto-fonts
  noto-fonts-extra
  openmotif
  pango
  pcre
  perl
  sh
  ttf-dejavu
  wayland                   # ?? for dunst
  xorg-server
  xorg-xinit
  xorg-xrdb
  xorg-xsetroot
  xz
  zlib
)
optdepends=(
  'blender: Open-source 3D computer graphics'
  'firefox: Web browser'
  'gimp: Image editor'
  'inkscape: Vector image editor'
  'libreoffice-fresh: Office suite'
  'lightdm: Login manager'
  'pavucontrol: Sound audio mixer'
  'vlc: Multi-media'
  'xpdf: PDF viewer'
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
    --exclude="java" \
    --exclude="include/Vue/Grafix/Platform/Vulkan" \
    --exclude="share/icons/hicolor" \
    --exclude="share/man" \
    --exclude="share/misc/HOME/rox.sourceforge.net/SendTo" \
    --exclude="share/misc/HOME/rox.sourceforge.net/Templates" \
    --exclude="share/msettings/FileTypes" \
    --exclude=".directory" \
    --exclude=".ms.swp" \
    --exclude=".dumpster" \
    -C "$pkgdir"/opt # Except conflict files from other packages and other rubbish files

  # Fix non UTF-8 name
  mv "$pkgdir"/opt/$_name/share/wallpapers/Octane-Wallpapers/pexels-c{á,a}tia-matos-1072179.jpg

  # Fix permissions
  chmod go+r "$pkgdir"/opt/$_name/share/misc/HOME/rox.sourceforge.net/MIME-types/{application_x-,}executable
  find "$pkgdir"/opt/$_name/share/inventor/data/models/ -type d -exec chmod go+x {} \;

  install -vDm 644 "$pkgdir"/opt/$_name/doc/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/

  install -vd "$pkgdir"/usr/share/icons
  cd "$pkgdir"/opt/$_name/share/icons
  for _iconfolder in Irix XCursor-Pro-Red redSGI sgi; do
    ln -s "/opt/$_name/share/icons/$_iconfolder" "$pkgdir/usr/share/icons/$_iconfolder"
  done

  install -vDm 644 "$pkgdir"/{opt/$_name,usr}/share/xsessions/${pkgname//-/.}
}
