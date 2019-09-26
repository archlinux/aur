# Maintainer: nightuser <nightuser at ya dot ru>

pkgname=plata-theme
pkgver=0.9.0
pkgrel=4
pkgdesc='A Gtk+ theme based on Material Design Refresh'
arch=('any')
url='https://gitlab.com/tista500/plata-theme'
license=('CCPL' 'GPL2')
makedepends=('git' 'inkscape' 'libxml2' 'parallel' 'sassc' 'zip')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'ttf-roboto: Recommended font')
source=("git+https://gitlab.com/tista500/plata-theme.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  # Dirty hack for aur:
  # mate support will be built only if marco is present
  if LC_ALL=C pacman -Qq marco > /dev/null 2>&1
  then
    MARCO_FLAGS=""
  else
    MARCO_FLAGS="--disable-mate"
  fi

  cd plata-theme

  ./autogen.sh \
    --prefix='/usr' \
    --enable-parallel \
    --enable-plank \
    --enable-telegram \
    "$MARCO_FLAGS"
  make
}

package() {
  cd plata-theme

  make DESTDIR="${pkgdir}" install

  install -dm 755 "${pkgdir}"/usr/share/plank/themes
  ln -s /usr/share/themes/Plata/plank "${pkgdir}"/usr/share/plank/themes/Plata

  install -Dm 644 LICENSE_CC_BY_SA4 -t "${pkgdir}"/usr/share/licenses/plata-theme/
}

# vim: ts=2 sw=2 et:
