# Maintainer: petRUShka <petrushkin@yandex.ru>

pkgname=dwm-systray
pkgver=6.5
pkgrel=2
pkgdesc="DWM with patches: Dynamic window manager for X (systray+gaps custom build)"
url="https://github.com/petRUShka/dwm-config"
license=('MIT')
arch=('x86_64' 'i686')
options=(zipman)
provides=("dwm=${pkgver}")
conflicts=('dwm')
replaces=('dwm')

# ---- runtime deps ---------------------------------------------------
depends=(
  libx11 libxinerama libxft freetype2
  rofi        # launcher (Alt+F2)
  alacritty   # terminal (Alt+F1)
)
optdepends=(
  'slock: default locker for Super+Shift+L'
  'i3lock: alternative locker (edit lockcmd in config.h)'
)

source=(
  "dwm-${pkgver}.tar.gz::https://dl.suckless.org/dwm/dwm-${pkgver}.tar.gz"
  "https://dwm.suckless.org/patches/systray/dwm-systray-20230922-9f88553.diff"
  "git+https://github.com/petRUShka/dwm-config"
)
sha256sums=('21d79ebfa9f2fb93141836c2666cb81f4784c69d64e7f1b2352f9b970ba09729'
            '29e357bd74f180016898fffaf219637952c777d26f5f2f161d0fbaea741908a1'
            'SKIP')

_custom_patch="dwm-systray-20230922-9f88553.diff"
install="dwm.install"   # uses the file inside repo

prepare() {
  cd "${srcdir}/dwm-${pkgver}"

  # copy custom config.h
  cp "${srcdir}/dwm-config/config.h" .

  # apply systray patch
  patch -Np1 -i "${srcdir}/${_custom_patch}"
}

build() {
  cd "${srcdir}/dwm-${pkgver}"
  make X11INC=/usr/include/X11 \
       X11LIB=/usr/lib/X11 \
       FREETYPEINC=/usr/include/freetype2
}

package() {
  cd "${srcdir}/dwm-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install

  # docs & desktop entry from git repo
  install -Dm644 LICENSE \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README \
          "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 "${srcdir}/dwm-config/dwm.desktop" \
          "${pkgdir}/usr/share/xsessions/dwm.desktop"
}
