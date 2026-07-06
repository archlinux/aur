# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Kohei Suzuki <eagletmt@gmail.com>
# Contributor: Daniel Wallace < danielwallace at gtmanfred dot com >
# Contributor: Yoel Lion <yoel3ster at gmail dot com>
# Contributor: Netanel Shine <Netanelshine@gmail.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Gatekeeper <cool_work@yahoo.com>
# Contributor: aksr <aksr at t-com dot me>

pkgauthor=arakiken
pkgname=mlterm
pkgver=3.9.5
pkgrel=1
pkgdesc="Multi Lingual TERMinal emulator on X"
url="https://github.com/${pkgauthor}/${pkgname}"
arch=('i686' 'x86_64')
license=('BSD')
depends=('gtk2' 'gtk3' 'm17n-lib' 'libutempter')
makedepends=('intltool' 'librsvg' 'ncurses')
options=(!libtool)
source=(${url}/archive/${pkgver}.tar.gz ${pkgname}.desktop)
md5sums=('075249c886f9ea9025dc75b378a54069'
         '90b831e025ce03a96b290d8df1ba377d')
sha1sums=('e6cca6c058ad70bc01caac019dea8ae6b2949df3'
          '05f47be966a3ba923dbfe6f96b07c9d4b9a3d5e5')
sha256sums=('7d28678aa90dade72cea4e1e5fffb5e4c343487d60ca36c88dc615134613af39'
            '5527b8b246ae27730f9eda3bd77344d8310e397d1353599041dca0f094bc86e8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/"

  ./configure --prefix=/usr --libexecdir=/usr/lib/mlterm --sysconfdir=/etc --mandir=/usr/share/man \
              --enable-fribidi \
              --enable-optimize-redrawing \
              --enable-utmp \
              --enable-m17nlib \
              --disable-static \
              --with-type-engines=xft,cairo,xcore \
              --with-gtk=2.0,3.0 \
              --with-scrollbars \
              --with-tools=mlconfig,mlterm-zoom,mlterm-menu,mlclient,mlcc,mlfc \
              --with-imagelib=gdk-pixbuf
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"

  make DESTDIR="${pkgdir}" install

  echo 'conf_menu_path_2 = mlterm-zoom' >> "${pkgdir}/etc/mlterm/main"

  # install some freedesktop.org compatibility
  install -D -m644 "$srcdir/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -e 's:mlterm:mlclient:' \
   < "${pkgdir}/usr/share/applications/${pkgname}.desktop" \
   > "${pkgdir}/usr/share/applications/mlclient.desktop"
  install -D -m644 "contrib/icon/${pkgname}-icon.svg" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
  install -D -m644 "contrib/icon/${pkgname}-icon-trans.svg" \
    "${pkgdir}/usr/share/pixmaps/mlclient.svg"

  # finally we render a png as fallback for not svg aware menu applications
  # Attention: always make sure you check the dimensions of the source-svg,
  # you can read the dimensions via inkscapes export funktion
  cd "${pkgdir}/usr/share/pixmaps/"

  rsvg-convert -w 48 -h 38 -f png -o mlterm.png mlterm.svg
  rsvg-convert -w 48 -h 38 -f png -o mlclient.png mlclient.svg
}

