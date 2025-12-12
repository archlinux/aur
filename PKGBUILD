# Contributor: Monika Schrenk <moni@random-access.org>
# Contributor: Alexandre Teles (afterSt0rm) <ateles.1@gmail.com>
# Contributor: Emanuel Fernandes <efernandes@tektorque.com>
# Maintainer: Erik Bender <erik.bender@develerik.dev>
# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>
# Maintainer: Andy Brennan <andy@hund.io>

pkgname=studio-3t
pkgver=2025.22.0
pkgrel=1
pkgdesc="The Professional Client, IDE and GUI for MongoDB"
arch=('x86_64')
url="https://studio3t.com"
license=("custom")
depends=('gtk2')
makedepends=('gendesk')
provides=('studio-3t')
replaces=('mongochef')

source=("$pkgname-$pkgver.tar.gz::https://download.studio3t.com/studio-3t/linux/${pkgver}/${pkgname}-linux-x64.tar.gz")

sha256sums=('c7b5298dbc4c67a08bd1b4d4fb88fddf5e3ca142ad256948175a706af6aac122')

prepare() {
  # Extract, rename and add execution permision
  tar xzvf ${pkgname}-${pkgver}.tar.gz && for file in *.sh; do mv "$file" ${pkgname}.sh; done && chmod +x ${pkgname}.sh

  # unattended mode
  sh ./${pkgname}.sh -q -dir ${srcdir}/${pkgname} -overwrite

  # Generate Desktop File
  cd ${srcdir}
  gendesk -f -n \
    --name "Studio 3T" \
    --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc" \
    --categories="Science;Education;Development;Application"
}

package() {
  cd ${srcdir}
  mkdir -p $pkgdir/opt/$pkgname
  install -Dm644 ${pkgname}/.install4j/Studio-3T.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  cp -R ${pkgname}/. ${pkgdir}/opt/${pkgname}

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

  ln -s "/opt/$pkgname/Studio-3T" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
