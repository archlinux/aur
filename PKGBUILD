# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=alephone-git
pkgver=1.5.r5611.4f2fa2dd
pkgrel=1
pkgdesc='A free, enhanced port of the classic FPS "Marathon 2" by Bungie Software (development version)'
arch=('i686' 'x86_64')
url="https://alephone.lhowon.org/"
license=('GPL3')
conflicts=("alephone")
provides=("alephone")
depends=('sdl2_ttf' 'sdl2_image' 'sdl2_net' 'libmad' 'glu' 'zziplib' 'ffmpeg4.4'
         'boost-libs' 'curl')
optdepends=('alephone-eternalx: community-made scenario'
            'alephone-evil: community-made scenario'
            'alephone-infinity: original data for Marathon Infinity'
            'alephone-marathon: M1A1 data converted for AlephOne'
            'alephone-marathon2: original data for Marathon 2: Durandal')
makedepends=('git' 'boost' 'mesa' 'icoutils' 'autoconf-archive')
source=("git+https://github.com/Aleph-One-Marathon/alephone")
md5sums=('SKIP')

pkgver() {
  cd alephone/Source_Files/Misc
  local _ver="$(grep '^#define A1_DISPLAY_VERSION' alephversion.h | cut -d\" -f2)"
  printf "%s.r%s.%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd alephone

  # convert the windows icons
  cd Resources/Windows
  icotool -x -w 48 alephone.ico -o "$srcdir"/alephone.png
  icotool -x -w 48 marathon.ico -o "$srcdir"/alephone-marathon.png
  icotool -x -w 48 marathon2.ico -o "$srcdir"/alephone-marathon2.png
  icotool -x -w 48 marathon-infinity.ico -o "$srcdir"/alephone-infinity.png
}

build() {
  cd alephone

  autoreconf --install
  PKG_CONFIG_PATH="/usr/lib/ffmpeg4.4/pkgconfig" ./configure --prefix=/usr --without-smpeg
  make
}

package() {
  cd alephone

  make DESTDIR="$pkgdir/" install

  # icons
  install -d "$pkgdir"/usr/share/icons/hicolor/48x48/apps
  install -m644 "$srcdir"/*.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps

  # docs
  install -Dm644 README "$pkgdir"/usr/share/doc/alephone/README
  install -m644 docs/*.html "$pkgdir"/usr/share/doc/alephone
}
