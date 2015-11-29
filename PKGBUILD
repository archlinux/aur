# Mantainer maz-1 < ohmygod19993 at gmail dot com >
pkgname=grub2-editor-frameworks
pkgver=0.6.4
pkgrel=1
pkgdesc="A KDE Control Module for configuring the GRUB2 bootloader.Unofficial KF5 port."
arch=('i686' 'x86_64')
url='https://ksmanis.wordpress.com/projects/grub2-editor/'
license=('GPL')
provides=grub2-editor
conflicts=grub2-editor
depends=('kdelibs4support' 'grub' 'kcmutils' 'kauth' 'hwinfo' 'imagemagick')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
source=("http://sourceforge.net/projects/kcm-grub2/files/kcm-grub2-$pkgver.tar.gz"
        "port_to_kf5.patch"
        "l10n_zh-cn.patch"
        "grub2-editor.desktop"
        "grub2-editor.gui.policy")
groups=('plasma')
md5sums=('b3ff8fb938be8112dcc6e42b3e56efc6'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')


prepare() {
  rm -rf build
  mkdir -p build
  cd kcm-grub2-$pkgver
  patch -p1 -i "$srcdir/port_to_kf5.patch"
  patch -p1 -i "$srcdir/l10n_zh-cn.patch"
}

build() {
  cd build
  cmake ../kcm-grub2-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/bin/"
  echo "#!/bin/sh" > "$pkgdir/usr/bin/grub2-editor"
  echo "exec kcmshell5 kcm_grub2" >> "$pkgdir/usr/bin/grub2-editor"
  chmod +x "$pkgdir/usr/bin/grub2-editor"
  install -Dm755 "$srcdir/grub2-editor.desktop" "$pkgdir/usr/share/applications/grub2-editor.desktop"
  install -Dm755 "${srcdir}/grub2-editor.gui.policy" "$pkgdir/usr/share/polkit-1/actions/grub2-editor.gui.policy"
}
