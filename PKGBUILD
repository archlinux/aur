# Maintainer: cozyOwl <cozyOw1@proton.me>
validpgpkeys=('85A129CD038220C44227EAB9C28D02D181F83532')

pkgname=opaquefiles
pkgver=0.9.9.4
pkgrel=1
pkgdesc='File encryption program'

arch=('any')
url="https://codeberg.org/cozyOwl/OpaqueFiles"
license=('GPL-3.0-or-later')

depends=('java-runtime=17' 'bash')
optdepends=('hicolor-icon-theme')
makedepends=('git')

source=(
  "${pkgname}::git+https://codeberg.org/cozyOwl/OpaqueFiles.git?signed#tag=v${pkgver}"
)

sha256sums=('SKIP')

package() {
  cd "${pkgname}/"

  echo "Installing /usr/bin/opaquefiles..."
  install -D -m0555 "$srcdir/$pkgname/packaging/archLinux/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"

  echo "Installing .jar..."
  install -D -m0555 "$srcdir/$pkgname/packaging/releases/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname.jar"

  echo "Installing /etc/opaqueFiles.properties..."
  install -D -m0644 "$srcdir/$pkgname/packaging/shared/opaqueFiles.properties" "${pkgdir}/etc/opaqueFiles.properties"

  echo "Installing icon..."
  install -D -m0444 "${srcdir}/${pkgname}/documentation/design/page.codeberg.cozyowl.OpaqueFiles.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/page.codeberg.cozyowl.OpaqueFiles.svg"
  echo "Installing .desktop..."
  install -D -m0644 "$srcdir/$pkgname/packaging/shared/page.codeberg.cozyowl.OpaqueFiles.desktop" "$pkgdir/usr/share/applications/page.codeberg.cozyowl.OpaqueFiles.desktop"

  echo "Installing MIME Type..."
  install -D -m0644 "$srcdir/$pkgname/packaging/shared/opaquefiles.xml" "$pkgdir/usr/share/mime/packages/opaquefiles.xml"
}

post_install() {
  xdg-icon-resource forceupdate --theme hicolor &>/dev/null
  update-mime-database usr/share/mime &>/dev/null
  update-desktop-database -q
}

post_upgrade() {
  post_install "$1"
}

post_remove() {
  post_install "$1"
}

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//'
}
