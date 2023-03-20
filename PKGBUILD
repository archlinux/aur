# Maintainer: Nemo <aur@captnemo.in>

_electron=electron22
_appname=insomnia
_upkgname=Insomnia
pkgname="$_appname-bin-electron"
_dirname="Insomnia.Core"
makedepends=('asar')
pkgver=2023.1.0
pkgrel=1
pkgdesc='API Client and Design Platform for GraphQL and REST'
arch=(any)
url='https://insomnia.rest'
_url_source='https://github.com/Kong/insomnia'
license=('MIT')
depends=("$_electron")
provides=("$_appname")
conflicts=("$_appname")
OPTIONS=(!strip)
source=("${_url_source}/releases/download/core@${pkgver}/${_upkgname}.Core-${pkgver}.deb"
  "${_url_source}/raw/core@${pkgver}/LICENSE"
  "${_appname}.desktop")
sha256sums=('b2b63292e1835c2a6315e06050530eec80fa204fad446f6047b190c5e100fd46'
            'cc91b5641bbbf592a69ca5f7b45807efba470068e815fc7682a42022bbd3cbb9'
            '05518f8a162253949c508642dd9c01a1f23d1cf772cc31b225de99b9ca52382f')

# All extraction scripts go here
prepare() {
  tar -xvf 'data.tar.xz'
  asar extract "opt/${_upkgname}/resources/app.asar" "resources"
}

build() {
  cat > "insomnia.sh" <<EOF
#!/bin/sh
cd /usr/lib/${pkgname}
exec $_electron . "\$@"
EOF
  chmod +x insomnia.sh
}

package() {
  # Licenses
  install -Dvm644 "${srcdir}/opt/${_upkgname}/"{'LICENSE.electron.txt','LICENSES.chromium.html'} \
    "${srcdir}/opt/${_upkgname}/resources/opensource-licenses.txt" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Exec Scripts
  install -Dm755 "$_appname.sh" "$pkgdir/usr/bin/$_appname"
  install -Dm644 "$_appname.desktop" -t "$pkgdir/usr/share/applications"

  # Icons
  mkdir "${pkgdir}/usr/share/icons"
  cp -r "${srcdir}/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/512x512/apps/${_appname}.png" "$pkgdir/usr/share/pixmaps/$_appname.png"

  # Resources
  # Remove exec status from resources
  find "${srcdir}/resources" -type f -exec chmod 644 {} \;
  # Remove map files
  find "${srcdir}/resources" -type f -iname '.*.map' -exec rm {} \;
  mkdir -p "${pkgdir}/usr/lib/"
  cp -r "${srcdir}/resources" "${pkgdir}/usr/lib/${pkgname}"
}