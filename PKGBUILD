# Maintainer: Uwe Koloska <kolewu@koloro.de>
# Contributor: Necoro <arch@necoro.dev>

_appname=sieve-app
pkgname=${_appname}-bin
pkgver=0.6.1
pkgrel=3
pkgdesc="Sieve script editor app version"
arch=('x86_64')
url="https://github.com/thsmi/sieve/"
license=('AGPL3')
depends=(alsa-lib nss gtk3)

_zip="sieve-${pkgver}-linux-x64.zip"
source=("https://github.com/thsmi/sieve/releases/download/${pkgver}/${_zip}"
		"${_appname}.desktop")
sha256sums=('8b146c4681d6395c146d20e6337db6ad58d098bf6621b7c79d48cc81d7c82abe'
            'cdd12628fcd3ff6d23cbb746e6cbdacc441fc93ed223796ef6db144b152f14a1')

package() {
  install -d -m0755 "${pkgdir}/"{opt/"${_appname}",usr/bin}
  install -D -m0644 "${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  
  # the contents of the source file are extracted directly at the top level...
  # thus, remove the sources so we can install the rest
  rm ${source[@]##*/}
  cp -a --no-preserve=ownership * "${pkgdir}/opt/${_appname}"
  
  chmod -R o+rX "${pkgdir}/opt/${_appname}"
  # make the chrome-sandbox wrapper SUID, although we can't really test
  # if it's the one it's supposed to be
  chmod u+s "${pkgdir}/opt/${_appname}/chrome-sandbox"
  ln -s "/opt/${_appname}/sieve" "${pkgdir}/usr/bin/sieve"
}
