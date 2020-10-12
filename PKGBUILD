#!/hint/bash
# Maintainer: bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=openboard-develop
pkgver=1.6.0
_a=3
_src_folder="OpenBoard-${pkgver}a${_a}"
pkgrel=1
((pkgrel+=_a))
pkgdesc="Interactive whiteboard software for schools and universities"
arch=('x86_64' 'i686')
url="http://openboard.ch/index.en.html"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-script' 'qt5-webkit' 'qt5-tools' 'qt5-xmlpatterns' 'libpaper' 'bzip2' 'openssl' 'libfdk-aac' 'sdl' 'ffmpeg')
depends+=(quazip)  #drop internal quazip and use system one.
depends+=(poppler) #replace internal xpdf with poppler and drop freetype/xpdf from deps
source=("https://github.com/OpenBoard-org/OpenBoard/archive/v${pkgver}a${_a}.tar.gz"
        openboard.desktop)
source+=(qchar.patch)
source+=(quazip.patch)
source+=(drop_ThirdParty_repo.patch)
sha256sums=('6c09e8fba969de960764eb0fd0c4e38585354d8f75a337b48176a77d880a4cf7'
            '18ee4fab83b0c92490c81c2aaace98f669d07d7260cc0f83a24acb8d6224e5e7'
            'b40fdab85f5921d0404c07db64628a2428a87d39193d2797bbef2e69b1d51549'
            '8c0b28ebd6cade0a551b695af9c04a2c45052f2d955357825b3be97bf00d5be7'
            '71a41ecbecb952b402d554aa7c5659650765b692662a28f9db904c7390f8f080')

prepare() {
  cd "$srcdir"/$_src_folder
  patch -p1 < "$srcdir"/drop_ThirdParty_repo.patch
  patch -p1 < "$srcdir"/qchar.patch
  patch -p1 < "$srcdir"/quazip.patch
}

build() {
  cd "$srcdir"/$_src_folder
  qmake OpenBoard.pro -spec linux-g++
  make
}

package() {
  cd "$srcdir"/$_src_folder

  install -Dm755 build/linux/release/product/OpenBoard -t "$pkgdir"/opt/openboard/
  cp -rp "$srcdir"/$_src_folder/resources/{customizations,etc,i18n,library} -t "$pkgdir"/opt/openboard/
  install -Dm644 "$srcdir"/$_src_folder/resources/images/OpenBoard.png -t "$pkgdir"/usr/share/icons/hicolor/64x64/apps/
  install -Dm644 "$srcdir"/openboard.desktop -t "$pkgdir"/usr/share/applications/
  install -dm755 "$pkgdir"/usr/bin/
  ln -s /opt/openboard/OpenBoard "$pkgdir"/usr/bin/openboard
}
