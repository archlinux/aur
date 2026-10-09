# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-music-git
_pkgname=gxde-music
pkgver=4.0.1.r0.gd1a2fe2
pkgrel=1
pkgdesc='GXDE music player'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS/gxde-music'
license=(GPL-3.0-or-later)
depends=(gxde-dtk2-qt6-git gxde-dtk6-git
         qt6-base qt6-svg qt6-multimedia qt6-5compat
         taglib icu libcue ffmpeg hicolor-icon-theme
         libstdc++ libgcc glibc)
makedepends=(git qt6-tools libx11 libxext)
optdepends=('gvfs: access music on remote and removable locations')
provides=(gxde-music)
conflicts=(gxde-music)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g[0-9a-f]*\)$/r\1/;s/-/./g'
}

prepare() {
  local _tag
  _tag=$(git -C "$_pkgname" describe --tags --abbrev=0)
  msg2 "$_pkgname -> $_tag"
  git -C "$_pkgname" checkout -q --detach "refs/tags/$_tag"
}

build() {
  cd "$_pkgname"
  ( cd src/music-player && ./update-translation.sh )
  qmake6 PREFIX=/usr CONFIG+=no_qt_rpath BUNDLED_MPRIS=1 \
    DEFINES+="VERSION=$(git describe --tags --abbrev=0)" \
    QMAKE_CFLAGS_RELEASE="$CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
    QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install

  # 自带的 mpris-qt6/dbusextended-qt6 只供 gxde-music 使用，不安装开发文件
  rm -r "$pkgdir"/usr/include "$pkgdir"/usr/lib/pkgconfig "$pkgdir"/usr/lib/qt6
}
