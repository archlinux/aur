# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2164,SC2154

pkgname=openboard-git
_fragment="#branch=master"
pkgver=v1.5.3.r0.g426b1f7a
pkgrel=2
pkgdesc="Interactive whiteboard software for schools and universities"
arch=('x86_64')
url="http://openboard.ch/index.en.html"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-script' 'qt5-webkit' 'qt5-tools' 'qt5-xmlpatterns' 'libpaper' 'bzip2' 'openssl' 'libfdk-aac' 'sdl' 'ffmpeg')
depends+=(quazip)  #drop internal quazip and use system one.
depends+=(poppler) #replace xpdf lib with poppler, simplify the package and remove internal dep.
makedepends=(git)
source=("git://github.com/OpenBoard-org/OpenBoard.git${_fragment}"
        qchar.patch
        qwebkit.patch
        https://github.com/OpenBoard-org/OpenBoard/pull/218.diff
        https://github.com/OpenBoard-org/OpenBoard/pull/223.diff
        openboard.desktop
)
source+=(quazip.diff)
source+=(poppler.patch)
source+=(drop_ThirdParty_repo.patch)
source+=(30fps.patch)
md5sums=('SKIP'
         'bf2c524f3897cfcfb4315bcd92d4206e'
         '60f64db6bf627015f4747879c4b30fd3'
         'f484614cc48181287607afb5a45ef644'
         '04c421c140e983d41975943ede5fe61a'
         '21d1749400802f8fc0669feaf77de683'
         '30a7928f696f958d5e8f06e02c49639f'
         'ebddda8793f57b7b7e1402c5d271ed86'
         '879116c683374b2dde291014e44a29fe'
         '79afac7031634bf9e46ba67cbf2a2d0c')

pkgver() {
  cd "$srcdir/OpenBoard"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/OpenBoard"
  git apply -v "$srcdir"/*{diff,patch}
}

build() {
  cd "$srcdir/OpenBoard"
  qmake OpenBoard.pro -spec linux-g++
  make
}

package() {
  cd "$srcdir/OpenBoard"

  mkdir -p "$pkgdir/opt/openboard"

  for i in customizations etc i18n library; do
    cp -rp "$srcdir/OpenBoard/resources/$i" "$pkgdir/opt/openboard"
  done 

  cp -rp "$srcdir/OpenBoard/resources/images/OpenBoard.png" "$pkgdir/opt/openboard/"
  cp -rp "build/linux/release/product/OpenBoard" "$pkgdir/opt/openboard/"

  install -D -m 644 "$srcdir/openboard.desktop" "$pkgdir/usr/share/applications/openboard.desktop"
  install -d -m 755 "$pkgdir/usr/bin"
  ln -s /opt/openboard/OpenBoard "$pkgdir/usr/bin/openboard"
}
