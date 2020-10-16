# Maintainer: dszryan <dszryan@local>
pkgname=edrawinfo-bin
pkgver=8.6
pkgrel=3
epoch=1
pkgdesc="Edraw Infographic is a graphic design and data visualization software compatible with different OS."
arch=('x86_64')
url="https://www.edrawsoft.com/archives/${pkgname/-bin/}-${arch/x86_/}.run.gz"
license=('custom:"Copyright EdrawSoft 2004-2018; All Rights Reserved."')
groups=()
depends=(qt5-base)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=(
  https://www.edrawsoft.com/archives/${pkgname/-bin/}-${arch/x86_/}.run.gz)
sha256sums=(
  '6ff695c83de59e3964d607aa52c6ab75321472600013d3877f3fa9d5cf4d4deb')

prepare() {
  echo "Extracting files..."
  cd "${srcdir}" && mkdir -p "${srcdir}/$pkgname-$pkgver"
  grep -a "line=" "${pkgname/-bin/}-${arch/x86_/}.run" | sed "s|line=||g" | xargs -I {} tail -n +{} "${pkgname/-bin/}-${arch/x86_/}.run" > "${pkgname/-bin/}-${arch/x86_/}.tar.gz"
  tar zxf "${pkgname/-bin/}-${arch/x86_/}.tar.gz" --directory "${srcdir}/$pkgname-$pkgver" --strip 1
}

check() {
  cd "${srcdir}/$pkgname-$pkgver"
}

package() {
  mkdir -p \
    "$pkgdir/opt/${pkgname/-bin/}" \
    "$pkgdir/usr/share/applications/" \
    "$pkgdir/usr/share/mime/packages/" \
    "$pkgdir/usr/share/icons/gnome/scalable/mimetypes/" \
    "$pkgdir/usr/bin/"

  cp  -R  "${srcdir}/$pkgname-$pkgver/."                                 "$pkgdir/opt/${pkgname/-bin/}/"
  cp  -f  "${srcdir}/$pkgname-$pkgver/${pkgname/-bin/}.desktop"          "$pkgdir/usr/share/applications/"
  cp  -f  "${srcdir}/$pkgname-$pkgver/${pkgname/-bin/}.png"              "$pkgdir/usr/share/icons/edinfo.png"
  cp  -f  "${srcdir}/$pkgname-$pkgver/eddx.svg"                          "$pkgdir/usr/share/icons/gnome/scalable/mimetypes/edinfo.svg"
  cp  -f  "${srcdir}/$pkgname-$pkgver/${pkgname/-bin/}.xml"              "$pkgdir/usr/share/mime/packages/"
  ln  -fs "/opt/${pkgname/-bin/}/EdrawInfo"                              "$pkgdir/usr/bin/${pkgname/-bin/}"
  sed -i  's|eddx|edinfo|g'                                              "$pkgdir/usr/share/mime/packages/${pkgname/-bin/}.xml"
  sed -iE 's|eddx|edinfo|g; s|Icon.*|Icon=/usr/share/icons/edinfo.png|g' "$pkgdir/usr/share/applications/${pkgname/-bin/}.desktop"
}

post_install() {
  update-desktop-database   /usr/share/applications
  update-mime-database      /usr/share/mime
  gtk-update-icon-cache -f  /usr/share/icons/gnome/
  ldconfig
}

post_upgrade() {
  update-desktop-database   /usr/share/applications
  update-mime-database      /usr/share/mime
  gtk-update-icon-cache -f  /usr/share/icons/gnome/
  ldconfig
}

# vim:set ts=2 sw=2 et:
