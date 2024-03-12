# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>

## Configuration env vars:
((ENABLE_QT5)) && qt="qt5" || qt="qt6"

pkgname=openboard
pkgver=1.7.0
_src_folder="OpenBoard-${pkgver}"
pkgrel=3
pkgdesc="Interactive whiteboard software for schools and universities"
arch=('x86_64' 'i686')
url="http://openboard.ch/index.en.html"
license=('GPL3')
# qt{5,6} libraries probed wiht `ldd -r /opt/openboard/OpenBoard` for both builds
#             qt5-base qt5-declarative qt5-location qt5-multimedia                 qt5-svg qt5-webchannel qt5-webengine
# qt6-5compat qt6-base qt6-declarative              qt6-multimedia qt6-positioning qt6-svg qt6-webchannel qt6-webengine
depends+=(${qt}-{base,declarative,multimedia,svg,webchannel,webengine})
depends+=('libpaper' 'bzip2' 'openssl' 'libfdk-aac' 'sdl' 'ffmpeg')
depends+=(quazip-${qt})  #drop internal quazip and use system one.
depends+=(poppler) #replace internal xpdf with poppler and drop freetype/xpdf from deps
makedepends=('patch' ${qt}-tools)
source=("https://github.com/OpenBoard-org/OpenBoard/archive/v${pkgver}.tar.gz"
        openboard.desktop)
source+=(qchar.patch)
source+=(quazip.patch)
source+=(drop_ThirdParty_repo.patch)
sha256sums=('03b5e6f728339528b8580542302f1d80567f814b10cb94b83df9c996eca125a3'
            '64289f9d91cb25fa79fb988f19d43a542d67380fcf27668d0da1ee4ba1e705eb'
            'b40fdab85f5921d0404c07db64628a2428a87d39193d2797bbef2e69b1d51549'
            '7e790bc63831b611a6c068d3208f16cf3fff5294b69ccd6a0592d64538c7d493'
            'a6a9bc1f9c9bee0345b735fcf422245ae7946f96f6c34520dd63530a98978c14')

prepare() {
  cd "$srcdir"/$_src_folder
  echo "drop_ThirdParty_repo"
  patch -f -p1 < "$srcdir"/drop_ThirdParty_repo.patch || true
  echo "qchar"
  patch -p1 < "$srcdir"/qchar.patch
  echo "quazip"
  patch -f -p1 < "$srcdir"/quazip.patch
  echo "gcc11"
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
