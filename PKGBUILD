# Maintainer: robertfoster

pkgname=pump.io
pkgver=5.1.4
pkgrel=2
pkgdesc="A stream server that does most of what people really want from a social network"
url='http://pump.io'
license=('Apache')
arch=('i686' 'x86_64')
depends=('nodejs' 'graphicsmagick')
optdepends=('mongodb' 'redis')
provides=('pumpio')
conflicts=('pumpio-git' 'pumpio')
install=${pkgname}.install
backup=(etc/webapps/${pkgname}/${pkgname}.json)
options=("!strip")
source=("https://github.com/pump-io/pump.io/archive/v${pkgver}.tar.gz"
  "${pkgname}.service"
  "${pkgname}.sysusers")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install --production
}

package() {
  cd "${srcdir}"
  local _npmdir="${pkgdir}/usr/lib"
  mkdir -p "${_npmdir}"
  mkdir -p "${pkgdir}/usr/bin"
  cp -rf "$pkgname-$pkgver" "${_npmdir}/${pkgname}"

  msg2 "Installing systemd service"
  install -Dm644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  install -D -m644 "${srcdir}/${pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  install -Dm755 -d "${pkgname}.json.sample" "${pkgdir}/etc/${pkgname}.json"
  rm -rf "${pkgdir}/usr/etc"
  rm -rf "${pkgdir}/usr/lib/node_modules/npm"
  rm -rf "${pkgdir}/usr/lib/pump.io/{test,utils}"
 
  ln -s "${_npmdir}/${pkgname}"/bin/pump "${pkgdir}/usr/bin/pump"
}

sha256sums=('d71f64f5b744f0b4bf4ce41689742a89ffc46189bb831494ec17de1b742cc917'
            'b65aebe25c89d36fc91cd64774b5d3b7688515ec6ea653bc9d59649184286841'
            '8e0c47c0639899bbbb97d8a1ff2b8834a99ab3235b551224aa3237dd48f220d4')
