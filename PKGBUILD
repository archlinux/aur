#!/hint/bash
# Maintainer: bartus <arch-user-repoᘓbartus.33mail.com>

## Configuration env vars:
((ENABLE_QT5)) && qt="qt5" || qt="qt6"

pkgname=openboard-develop
_pkgver=1.7.1rc-240202
pkgver=${_pkgver%rc*}
_src_folder="OpenBoard-${_pkgver}"
pkgrel=2
pkgdesc="Interactive whiteboard software for schools and universities (development version)"
arch=('x86_64' 'i686')
url="http://openboard.ch/index.en.html"
license=('GPL3')
provides=("${pkgname%-develop}=${pkgver}")
conflicts=("${pkgname%-develop}")
depends+=(${qt}-{base,declarative,multimedia,svg,webchannel,webengine})
depends+=('libpaper' 'bzip2' 'openssl' 'libfdk-aac' 'sdl' 'ffmpeg')
depends+=(quazip-${qt})  #drop internal quazip and use system one.
depends+=(poppler) #replace internal xpdf with poppler and drop freetype/xpdf from deps
makedepends=('patch' ${qt}-tools)
source=("openboard_v${_pkgver}.tar.gz::https://github.com/OpenBoard-org/OpenBoard/archive/v${_pkgver}.tar.gz"
        openboard.desktop)
source+=(qchar.patch)
source+=(quazip.patch)
source+=(drop_ThirdParty_repo.patch)
sha256sums=('99cef28d0b40f2f7904552456f26c4c3f8a653088e2f189c5036f4a8bf26e43c'
            '18ee4fab83b0c92490c81c2aaace98f669d07d7260cc0f83a24acb8d6224e5e7'
            'b40fdab85f5921d0404c07db64628a2428a87d39193d2797bbef2e69b1d51549'
            '1ebd1025762ac97fa47ddcfae8d10a68bb6499d79c1f36dff52f6a10a1e3fa74'
            'a6a9bc1f9c9bee0345b735fcf422245ae7946f96f6c34520dd63530a98978c14')

prepare() {
  cd "$srcdir"/$_src_folder
  msg2 "drop_ThirdParty_repo"
  patch -f -p1 < "$srcdir"/drop_ThirdParty_repo.patch
  msg2 "qchar"
  patch -f -p1 < "$srcdir"/qchar.patch
  msg2 "quazip"
  patch -f -p1 < "$srcdir"/quazip.patch
  msg2 "gcc11"
  sed 's/_serialize/serialize/g' -i src/pdf-merger/Object.{h,cpp}
}

build() {
  cd "$srcdir"/$_src_folder
# convert translations to binary form
  ((ENABLE_QT5)) || export PATH="/usr/lib/qt6/bin/:$PATH"
  lrelease OpenBoard.pro
  qmake OpenBoard.pro -spec linux-g++
  make
}

package() {
  cd "$srcdir"/$_src_folder

  install -Dm755 build/linux/release/product/OpenBoard -t "$pkgdir"/opt/openboard/
  cp -rp "$srcdir"/$_src_folder/resources/{customizations,etc,i18n,library,startupHints} -t "$pkgdir"/opt/openboard/
  install -Dm644 "$srcdir"/$_src_folder/resources/images/OpenBoard.png -t "$pkgdir"/usr/share/icons/hicolor/64x64/apps/
  install -Dm644 "$srcdir"/openboard.desktop -t "$pkgdir"/usr/share/applications/
  install -dm755 "$pkgdir"/usr/bin/
  ln -s /opt/openboard/OpenBoard "$pkgdir"/usr/bin/openboard
}
