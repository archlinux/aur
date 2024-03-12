#!/hint/bash
# Maintainer: bartus <arch-user-repoᘓbartus.33mail.com>

## Configuration env vars:
((ENABLE_QT5)) && qt="qt5" || qt="qt6"

pkgname=openboard-git
_fragment="#branch=master"
pkgver=1.7.0.r11.gfff1a15e
pkgrel=1
pkgdesc="Interactive whiteboard software for schools and universities (development version current master)"
arch=('x86_64' 'i686')
url="http://openboard.ch/index.en.html"
license=('GPL3')
provides=("${pkgname%-git}=${pkgver%%.r*}")
conflicts=("${pkgname%-git}")
depends+=(${qt}-{base,declarative,multimedia,svg,webchannel,webengine})
depends+=('libpaper' 'bzip2' 'openssl' 'libfdk-aac' 'sdl' 'ffmpeg')
depends+=(quazip-${qt})  #drop internal quazip and use system one.
depends+=(poppler) #replace internal xpdf with poppler and drop freetype/xpdf from deps
makedepends=(git ${qt}-tools)
source=("git+https://github.com/OpenBoard-org/OpenBoard.git${_fragment}"
        openboard.desktop)
source+=(qchar.patch)
source+=(quazip.patch)
source+=(drop_ThirdParty_repo.patch)
source+=(30fps.patch)
sha256sums=('SKIP'
            'e518455b149ced284f515219d752a579f82c67fd143c6f489ea00ff0741a0c79'
            'b40fdab85f5921d0404c07db64628a2428a87d39193d2797bbef2e69b1d51549'
            '1ebd1025762ac97fa47ddcfae8d10a68bb6499d79c1f36dff52f6a10a1e3fa74'
            'a6a9bc1f9c9bee0345b735fcf422245ae7946f96f6c34520dd63530a98978c14'
            '205062adbbd48d6622341e316e14a5496f73696385a3ed5cda7a89d3e7d2861d')

pkgver() {
  cd "$srcdir/OpenBoard"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir"/OpenBoard
  msg2 "drop_ThirdParty_repo"
  patch -p1 < "$srcdir"/drop_ThirdParty_repo.patch
  msg2 "qchar"
  patch -p1 < "$srcdir"/qchar.patch
  msg2 "quazip"
  patch -p1 < "$srcdir"/quazip.patch
  msg2 "fix translation issue"
  git revert --no-commit  bc42f702afca517bbf2a3de60ed4827729400537
}

build() {
  export CCACHE_BASEDIR="$srcdir"
  cd "$srcdir"/OpenBoard
# convert translations to binary form
  ((ENABLE_QT5)) || export PATH="/usr/lib/qt6/bin/:$PATH"
  lrelease OpenBoard.pro
  qmake OpenBoard.pro -spec linux-g++
  make
}

package() {
  cd "$srcdir"/OpenBoard

  install -Dm755 build/linux/release/product/OpenBoard -t "$pkgdir"/opt/openboard/
  cp -rp "$srcdir"/OpenBoard/resources/{customizations,etc,i18n,library,startupHints} -t "$pkgdir"/opt/openboard/
  install -Dm644 "$srcdir"/OpenBoard/resources/images/OpenBoard.png -t "$pkgdir"/usr/share/icons/hicolor/64x64/apps/
  install -Dm644 "$srcdir"/openboard.desktop -t "$pkgdir"/usr/share/applications/
  install -dm755 "$pkgdir"/usr/bin/
  ln -s /opt/openboard/OpenBoard "$pkgdir"/usr/bin/openboard
}
