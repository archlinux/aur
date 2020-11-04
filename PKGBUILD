# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Jiabao Lin <me at leolin dot cn>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: Alexander Baldeck <lex@tentriplenine.com>

pkgname=charles
pkgver=4.5.6
pkgrel=2
pkgdesc="Web debugging proxy application"
arch=(any)
url="http://www.charlesproxy.com"
license=('custom' 'custom:bounce' 'APACHE')
depends=('java-runtime>=8' 'hicolor-icon-theme')
source=(http://www.charlesproxy.com/assets/release/${pkgver}/charles-proxy-${pkgver}_amd64.tar.gz)
md5sums=('b7dd7490ee1c9dc36e858f68e7ec5b23')

build() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m755 ${srcdir}/${pkgname}/bin/charles \
    ${pkgdir}/usr/bin/charles

  for fn in ${srcdir}/${pkgname}/lib/*.jar; do
    install -D -m644 ${fn} \
      ${pkgdir}/usr/share/java/${pkgname}/$(basename ${fn})
  done

  for dim in 16x16  32x32  64x64  128x128  256x256  512x512; do
    install -D -m644 ${srcdir}/${pkgname}/icon/${dim}/apps/charles-proxy.png \
      ${pkgdir}/usr/share/icons/hicolor/${dim}/apps/charles.png
    for mimetype in application-har+json.png application-vnd.tcpdump.pcap.png application-x-charles-savedsession.png application-x-charles-trace.png; do
      install -D -m644 ${srcdir}/${pkgname}/icon/${dim}/mimetypes/$mimetype \
        ${pkgdir}/usr/share/icons/hicolor/${dim}/mimetypes/$mimetype
    done
  done
  install -D -m644 ${srcdir}/${pkgname}/icon/128x128/apps/charles-proxy.png \
    ${pkgdir}/usr/share/icons/charles128.png

  install -D -m644 ${srcdir}/${pkgname}/doc/licenses/bounce-license.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/bounce-license.txt
  install -D -m644 ${srcdir}/${pkgname}/etc/charles-proxy.desktop \
    ${pkgdir}/usr/share/applications/charles-proxy.desktop

  sed -i 's/Icon=\.\..\+/Icon=charles/' ${pkgdir}/usr/share/applications/charles-proxy.desktop
  #Stop ^- from appearing in home directory
  sed -i 's/\^-/\/dev\/null/' ${pkgdir}/usr/bin/charles
  #Use XDG_CONFIG_HOME and if unset use ~/.config/charles rather than ~/ for .charles.config
  sed -i 's/\~\/\.charles\.config\"/$\{XDG\_CONFIG\_HOME\:\-\~\/\.config\/charles\}\"\/\.charles\.config/' ${pkgdir}/usr/bin/charles
}
