## Maintainer: Joe Groocock <ts3-aur@frebib.net>
# Contributor: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: J.W. Birdsong  <jwbirdsongATmailDOTcom>

_pkgname=teamspeak3
pkgname=$_pkgname-wbundled
pkgver=3.3.2
pkgrel=1
pkgdesc="TeamSpeak is software for quality voice communication via the Internet"
url="http://www.teamspeak.com"
license=('custom')
depends=('quazip' 'snappy' 'openssl-1.0' 'libudev0-shim' 'libc++' 'qt5-base' 'qt5-declarative' 'qt5-location' 'qt5-svg' 'qt5-webchannel' 'qt5-webengine')
optdepends=('libpulse')
provides=('teamspeak3')
conflicts=('teamspeak3')
arch=('x86_64')
# Stripping must be disabled to prevent patchelf'd binaries being corrupted.
# https://github.com/NixOS/patchelf/issues/10
makedepends=('patchelf')
options=(!strip)
source=('teamspeak3.desktop'
        'teamspeak3.png'
        'LICENSE'
       "https://files.teamspeak-services.com/releases/client/${pkgver}/TeamSpeak3-Client-linux_amd64-${pkgver}.run")
sha512sums=('4cac0b7446dc3e728b232fdd6c6d75be1d2a5530635eab5918a4e7dd6a4a3fc21d6a75055da919b56e5cf849f4c5ba26ece56759a45bc4850eba3eb73853759d'
            'af18ed36a3c8de90b60a7205ebf91a35d4b517f22f97d541c82debdb12697882469d9771fdf3fb8b081aeb74a01237f3afd4732daccf4b374dc6d39e7df5d444'
            'd6d03f1bda86c90390ce0032e4d30e889977f80ff76ba1e5c443109e93cbedbee92c6fc2759f58d23659c15dba4f2ac718861571239ba117dcfe11f136f556dc'
            '1dd8912120ba0e9e84849fd793d54aee56e98396f6228a4bcec5c79485b9902398eeefb8f276abd46bbe627e7bd3c8fc5d740d05807342f837ac226f475510d7')

prepare() {
  mkdir archive && cd archive
  sh "${srcdir}"/TeamSpeak3-Client-linux_amd64-${pkgver}.run --tar -xf 2>/dev/null

  # Remove bundled libraries..
  rm -rf qt.conf *.so* \
      platforms xcbglintegrations \
      iconengines imageformats \
      qtwebengine_locales \
      ts3client_runscript.sh

  # Fix libquazip.so name
  patchelf --replace-needed libquazip.so libquazip5.so ts3client_linux_amd64

  # Fix permissions
  find -type d | xargs chmod 755
  find -type f | xargs chmod 644
  find -name *.so | xargs chmod 755
  chmod +x ts3client*
  chmod +x package_inst
}

package() {
  install -d "${pkgdir}"/{usr/bin/,opt/teamspeak3}

  cp -r archive/* ${pkgdir}/opt/teamspeak3/

  install -D -m644 "${srcdir}"/teamspeak3.desktop "${pkgdir}"/usr/share/applications/teamspeak3.desktop
  install -D -m644 "${srcdir}"/teamspeak3.png "${pkgdir}"/usr/share/pixmaps/teamspeak3.png
  install -D -m644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  ln -s /opt/teamspeak3/ts3client_linux_amd64 "${pkgdir}"/usr/bin/teamspeak3
  chmod +x "$pkgdir"/opt/teamspeak3/ts3client_linux_amd64
}
# vim:set ts=2 sw=2 et:
