# Maintainer: coderkun <olli AT coderkun DOT de>

pkgname=rssowl
pkgver=2.2.1
pkgrel=4
pkgdesc="A java based RSS feed reader with Google Reader synchronization"
arch=('i686' 'x86_64')
url="http://rssowl.org/"
license=('EPL')
depends=('java-runtime' 'alsa-lib' 'gtk2' 'gconf' 'hunspell' 'libxt' 'nss')
install=rssowl.install

if [[ "$CARCH" = "x86_64" ]]; then
	source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.linux.x86_64.zip")
	md5sums=('7751803db518b267b0dca121c1532747')
else
	source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.linux.x86.zip")
	md5sums=('7295bbce792dc921ac89781ac717e6f6')
fi
source+=("${pkgname}.desktop")
md5sums+=('8cdc03eb95a959e4196d1995783e24b1')

build() {
  cd "${srcdir}/${pkgname}"

  echo -e "#!/bin/sh\n\n/usr/share/${pkgname}/RSSOwl \"\${@}\"" > "${pkgname}"
  sed -i -e 's:moz_libdir=.*:moz_libdir=/usr/share/rssowl/xulrunner:' xulrunner/xulrunner
}

package() {
  cd "${srcdir}"
  # xulrunner 1.9 (shipped by RSSOwl) expects /lib/libhunspell-1.2.so.0
  if ! [ -e "libhunspell-1.2.so.0" ]; then
    ln -s "/usr/lib/libhunspell.so" "libhunspell-1.2.so.0"
  fi
  install -D "libhunspell-1.2.so.0" "${pkgdir}/usr/lib/libhunspell-1.2.so.0"

  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r * "${pkgdir}/usr/share/${pkgname}"
  chmod +x "${pkgdir}/usr/share/${pkgname}/xulrunner/xulrunner"
  chmod +x "${pkgdir}/usr/share/${pkgname}/xulrunner/xulrunner-bin"
  chmod +x "${pkgdir}/usr/share/${pkgname}/xulrunner/run-mozilla.sh"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
