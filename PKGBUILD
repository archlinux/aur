# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Jiabao Lin <me at leolin dot cn>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: Alexander Baldeck <lex@tentriplenine.com>

pkgname=charles
_name=charles-proxy5
pkgver=5.0.1
pkgrel=1
pkgdesc="Web debugging proxy application"
arch=(x86_64)
url="http://www.charlesproxy.com"
license=('LicenseRef-Charles-EULA')
depends=('java-runtime>=8' 'hicolor-icon-theme')
provides=('charles')
conflicts=('charles-bin')
source=(http://www.charlesproxy.com/assets/release/${pkgver}/charles-proxy-${pkgver}_$arch.tar.gz)
md5sums=('a87143d39d6abc36548c16d4ca022f6d')

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
    install -D -m644 ${srcdir}/${pkgname}/icon/${dim}/apps/$_name.png \
      ${pkgdir}/usr/share/icons/hicolor/${dim}/apps/charles.png
    for mimetype in $_name-har.png $_name-pcap.png $_name-savedsession.png $_name-trace.png; do
      install -D -m644 ${srcdir}/${pkgname}/icon/${dim}/mimetypes/$mimetype \
        ${pkgdir}/usr/share/icons/hicolor/${dim}/mimetypes/$mimetype
    done
  done
  install -D -m644 ${srcdir}/${pkgname}/icon/128x128/apps/$_name.png \
    ${pkgdir}/usr/share/icons/charles128.png

  install -D -m644 ${srcdir}/${pkgname}/etc/$_name.desktop \
    ${pkgdir}/usr/share/applications/$_name.desktop

  sed -i 's/Icon=\.\..\+/Icon=charles/' ${pkgdir}/usr/share/applications/$_name.desktop
  #Stop ^- from appearing in home directory
  sed -i 's/\^-/\/dev\/null/' ${pkgdir}/usr/bin/charles
  #Use XDG_CONFIG_HOME and if unset use ~/.config/charles rather than ~/ for .charles.config
  sed -i 's/\~\/\.charles\.config\"/$\{XDG\_CONFIG\_HOME\:\-\~\/\.config\/charles\}\"\/\.charles\.config/' ${pkgdir}/usr/bin/charles
}
