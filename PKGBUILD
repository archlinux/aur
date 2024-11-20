# Maintainer: oatmealraisin <archlinux at oatmealrais dot in>

pkgname=dmenu-fuzzymatch
pkgver=5.3
pkgrel=2
pkgdesc='Generic menu for X with fuzzymatch patch'
url='https://tools.suckless.org/dmenu/'
arch=('x86_64')
license=('MIT')
makedepends=('git')
depends=('sh' 'glibc' 'coreutils' 'libx11' 'libxinerama' 'libxft' 'freetype2' 'fontconfig' 'libfontconfig.so')
source=(
  "git+https://git.suckless.org/dmenu#tag=${pkgver}"
  "https://tools.suckless.org/dmenu/patches/fuzzymatch/dmenu-fuzzymatch-5.3.diff"
  )
sha512sums=(
  '781f4aab2bb32c39e79a2269b62fdb8cacdcebc162f73844e0ff86f8d084fd151eb63811e0f4de906ae5b3ca3a02f12c82fbf4d9f5f3e4a9b5d847de787aefd4'
  'ab9512b86e63871d03e746466e029038e4373d899d93401cc14584514032239f7ff54641c4468ccfe287c973f4840c853d287b5931398c3fce26fc4bfb8d91bf'
)
b2sums=(
  '6da7112a8975c152038f7694f1a658674f92c2d5a9340f97e8b64430a2fce612c87effd361078b66ce77510d6bb6478c47ea3b1d6ee0adfafa1e8c0d62f1adb5'
  'c9f36a394d240c6f193bdbb3574f6c84025cf5a8f57f6cbc909b9909837e360e9275da55cbdab61d8afea90355702c5e984e946268c7b5dc260f6d1aad373ab5'
)
conflicts=("dmenu")
provides=("dmenu")

prepare() {
  cd "dmenu"
  echo "CPPFLAGS+=${CPPFLAGS}" >> config.mk
  echo "CFLAGS+=${CFLAGS}" >> config.mk
  echo "LDFLAGS+=${LDFLAGS}" >> config.mk

  cp "${srcdir}/dmenu-fuzzymatch-5.3.diff" .
  git apply dmenu-fuzzymatch-5.3.diff
}

build() {
  cd dmenu
  make \
	  X11INC=/usr/include/X11 \
	  X11LIB=/usr/lib/X11 \
	  FREETYPEINC=/usr/include/freetype2
}

package() {
  cd dmenu
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
