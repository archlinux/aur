# Maintainer: Luke Huckman (Darkpelz) <lukeh@outlook.my>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: fossdd <fossdd@tutanota.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=tenacity-git
pkgver=r14921.g8119cb11c
pkgrel=2
epoch=1
pkgdesc="An easy-to-use multi-track audio editor and recorder, forked from Audacity"
arch=(i686 x86_64)
url="https://tenacityaudio.org"
license=(GPL2 CCPL)
groups=(pro-audio)
depends=(gcc-libs glibc flac gtk3 wxwidgets-gtk3 wxwidgets-common libid3tag lilv lv2 portsmf suil libmad twolame
         vamp-plugin-sdk libsoxr soundtouch portaudio jack portmidi libebml libmatroska libzip jsoncpp

         # namcap implicit depends
         libogg expat hicolor-icon-theme glib2 libsndfile sqlite lame libvorbis
)
makedepends=(git cmake clang sdl2 libsoup libnotify gstreamer gst-plugins-bad-libs
             ffmpeg nasm chrpath python)
optdepends=('ffmpeg: additional import/export capabilities')
provides=(tenacity)
conflicts=(tenacity)
source=("git+https://codeberg.org/tenacityteam/tenacity.git"
        "tenacity-libnyquist::git+https://codeberg.org/tenacityteam/libnyquist.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd tenacity
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd tenacity
  git submodule init
  git config submodule.vcpkg.update none
  git config submodule.lib-src/libnyquist.url "${srcdir}/tenacity-libnyquist"
  git -c protocol.file.allow=always submodule update

  cd images/icons
  for i in *; do # fix for png icons not following hicolor category folders
    cd $i
    mkdir -p apps
    test -f tenacity.png && mv tenacity.png apps
    cd ..
  done
  cd ../..
  mkdir -p build
}

build() {
  cd tenacity/build
  CC=clang CXX=clang++ cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
    -Wno-dev \
    ..
  cmake --build .
  make .
}

package() {
  cd tenacity/build
  make DESTDIR="${pkgdir}" install
  test -f ${pkgdir}/usr/tenacity && rm ${pkgdir}/usr/tenacity # remove unused launch script

  mv "${pkgdir}/usr/share/pixmaps/gnome-mime-application-x-audacity-project.xpm" \
     "${pkgdir}/usr/share/pixmaps/gnome-mime-application-x-tenacity-project.xpm"

  chrpath --delete "${pkgdir}"/usr/lib/tenacity/*.so
  chrpath --delete "${pkgdir}"/usr/lib/tenacity/modules/*.so
}
