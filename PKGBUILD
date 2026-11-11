# Maintainer: Luke Huckman (Darkpelz) <lukeh@outlook.my>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: fossdd <fossdd@tutanota.com>
# Contributor: Ong Yong Xin <ongyongxin2020+github AT gmail DOT com>
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=tenacity-git
pkgver=r16055.gb1dfd6b46
pkgrel=1
epoch=1
pkgdesc="An easy-to-use multi-track audio editor and recorder, forked from Audacity"
arch=(i686 x86_64)
url="https://tenacityaudio.org"
license=(GPL-2.0-or-later)
groups=(pro-audio)
depends=(
    expat
    flac
    glib2
    glibc
    gtk3
    hicolor-icon-theme
    jack #
    jsoncpp #
    lame
    libebml
    libgcc
    libid3tag
    libmad #
    libmatroska
    libogg
    libsndfile
    libsoxr
    libstdc++
    libvorbis
    libzip
    lilv
    lv2
    mpg123
    opus
    opusfile
    portaudio
    portmidi
    portsmf
    soundtouch
    sqlite
    suil
    twolame
    vamp-plugin-sdk
    wavpack
    wxwidgets-common
    wxwidgets-gtk3
    )
makedepends=(
    #chrpath
    cmake
    ffmpeg
    git
    gst-plugins-bad-libs
    gstreamer
    libnotify
    libsoup
    nasm
    python
    rapidjson
    sdl2
    )
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
}

prepare() {
  cd tenacity
  git submodule init
  git config submodule.vcpkg.update none
  git config submodule.linux/flatpak/shared-modules.update none
  git config submodule.lib-src/libnyquist.url "${srcdir}/tenacity-libnyquist"
  git -c protocol.file.allow=always submodule update

  cd images/icons
  for i in *; do # fix for png icons not following hicolor category folders
    cd $i
    mkdir -p apps
    test -f tenacity.png && mv tenacity.png apps
    cd ..
  done
}

build() {
  export CC=/usr/bin/gcc CXX=/usr/bin/g++

  local _flags=(
    -DCMAKE_SKIP_RPATH=ON
    -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config
  )

  cmake -B build -S "tenacity" -Wno-author \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build

}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  #test -f ${pkgdir}/usr/tenacity && rm ${pkgdir}/usr/tenacity # remove unused launch script

  #mv "${pkgdir}/usr/share/pixmaps/gnome-mime-application-x-audacity-project.xpm" \
  #   "${pkgdir}/usr/share/pixmaps/gnome-mime-application-x-tenacity-project.xpm"

  #chrpath --delete "${pkgdir}"/usr/lib/tenacity/*.so
  #chrpath --delete "${pkgdir}"/usr/lib/modules/*.so
}
