# Maintainer: sfs <sfslinux@gmail.com>

pkgname=lxappearance-wlr-labwc
_pkgname=lxappearance-obconf
pkgver=0.2.4
pkgrel=35
pkgdesc='Plugin for LXAppearance to configure labwc (GTK3 version)'
arch=('x86_64')
license=('GPL2')
url='https://github.com/lxde/lxappearance-obconf'
depends=('lxappearance-wlr' 'labwc' 'libxml2')
makedepends=('intltool' 'git')
provides=('lxappearance-obconf-gtk3')
conflicts=($_pkgname lxappearance-obconf-gtk3)
source=(
  git+https://github.com/lxde/lxappearance-obconf.git#tag=${pkgver}
  lxappearance-obconf-labwc.patch
  lxappearance-obconf-tabs-top-level.patch
  lxappearance-obconf-theme-live-preview.patch
  lxappearance-obconf-appearance-tooltips.patch
  lxappearance-obconf-ru-compact.patch
  CHANGELOG.en.md
  CHANGELOG.ru.md
  README.en.md
  README.ru.md
)
sha256sums=(
  '63299027fdce3acfc55eb1ae601f4a0ab4b0be0ebe055f21df46d80ff4d3f437'
  '43e15891855cf77747d187bee2b60d1f3b63e86886dc9e8b146528ced977fe2e'
  '434ae4915f9a87313ba636cbd967ca5e20832d71df470d95557082af19e1632f'
  '1c766ac169d312817769d1f3bea1dbf1a7209b2c67edd25298f25e8fc5474742'
  '6b5da0e47e7910a7b0f7e007337c97ade4f76f023de9e2bac3a8d5b515832ffe'
  'bba4c50d323bf9ecbe43cf6801c08f154c9efe10803426fd2e302cec7ca49afa'
  'fcfac1f316732385abf8c785b1dfd5b4e0f33dfd6922eb21ed24f07b6215e7c7'
  'ffb6f9e5721aefe688f88ca66d4a98148f5425e80bb69c80d41dffff5db69d5d'
  'ebcc00cbe5b5c0379fc4ecc5d59248189da2f4e0d95f7b06e68152f56739230f'
  '5af6ecadbad3988385f610dfe462deba9259da66fc7fbcc35ca37aee7a84c918'
)

prepare() {
  cd $_pkgname

  git apply -3 ../lxappearance-obconf-labwc.patch
  patch -p1 -i ../lxappearance-obconf-tabs-top-level.patch
  patch -p1 -i ../lxappearance-obconf-theme-live-preview.patch
  patch -p1 -i ../lxappearance-obconf-appearance-tooltips.patch
  patch -p1 -i ../lxappearance-obconf-ru-compact.patch

  ./autogen.sh
}

build() {
  cd $_pkgname
  CFLAGS+=' -Wno-implicit-function-declaration -Wno-int-conversion'
  ./configure --prefix=/usr --enable-gtk3

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install

  rm -f "$pkgdir/usr/lib/lxappearance/plugins/obconf.la"
  rm -f "$pkgdir/usr/lib/lxappearance/plugins/obconf.a"

  install -Dm644 ../CHANGELOG.en.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.en.md"
  install -Dm644 ../CHANGELOG.ru.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.ru.md"
  install -Dm644 ../README.en.md "$pkgdir/usr/share/doc/$pkgname/README.en.md"
  install -Dm644 ../README.ru.md "$pkgdir/usr/share/doc/$pkgname/README.ru.md"
}
