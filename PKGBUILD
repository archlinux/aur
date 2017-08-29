# Maintainer:  Max le Fou <max at maxlefou.com>
# Contributor: Nascher <kevin at nascher.org>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Victor Feight <vrfeight3 at gmail dot com>
# Contributor: Frozen Fox <frozenfoxz at gmail dot com>

pkgname=doukutsu-fr
pkgver=1.2
pkgrel=6
pkgdesc='Japanese freeware PC side-scrolling platformer game (aka Cave Story). French ver.'
url='http://cavestory.maxlefou.com/'
arch=('i686' 'x86_64')
license=('custom:freeware')
depends=('bash' 'sdl' 'fltk' 'libxinerama' 'libxft')

source=('http://cavestory.maxlefou.com/files/linuxDoukutsu-1.21FR.tar.xz'
		'http://www.cavestory.org/downloads/linuxDoukutsu-1.2.zip'
        'http://www.cavestory.org/downloads/DoConfigure-r2.zip'
        'configure-gamepad-fix.patch'
        'doukutsu.desktop'
        'doukutsu-config.desktop'
        'doukutsu.png'
        'doukutsu')

md5sums=('ff63588fa1bbd5b3c16c603b5074a37e'
         'e73d7330fba3cc5c15f0eeb239df586f'
         '9f5e96d5ff9671691b7c8a41f8fa5880'
         'd4f9cdcd06058177671bd741b5bf5fa4'
         'ddd04fb93154c3cfa41589102c1b2487'
         '663a634c5edecad78db9d33f58f1d636'
         '5262f9ff9bc528c790bf424016e6305f'
         '33e725f0fd06ae89fbf2290cbae79d9e')

prepare() {
  cd "$srcdir"

  # Fix DoConfigure utility bug where gamepad configurations are not saved correctly
  # source: http://www.desura.com/games/cave-story/forum/thread/problems-remapping-the-joystick-under-linux
  patch -Np0 -i "$srcdir/configure-gamepad-fix.patch"
}

build() {
  cd "${srcdir}"
  rm DoConfigure
  g++ DoConfig.cpp -o DoConfigure -s $(fltk-config --cxxflags --ldflags)
}

package() {
  cd "${srcdir}/linuxDoukutsu-1.21FR"

  install -dm755 "${pkgdir}"/{opt/${pkgname},usr/share/{doc/${pkgname},applications}}
  cp -r {Config.dat,data,doc,doukutsu} "${pkgdir}/opt/${pkgname}/"

  if [ "$CARCH" == "i686" ]; then
    install -Dm755 "${srcdir}/linuxDoukutsu-1.2/doukutsu_32bits" "${pkgdir}/opt/${pkgname}/doukutsu.bin"
  else
    install -Dm755 "${srcdir}/linuxDoukutsu-1.2/doukutsu_64bits" "${pkgdir}/opt/${pkgname}/doukutsu.bin"
  fi

  install -Dm644 "${srcdir}"/*.desktop "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}/doukutsu.png" "${pkgdir}/usr/share/pixmaps/doukutsu.png"
  install -Dm644 doc/* "${pkgdir}/usr/share/doc/${pkgname}/"

  install -Dm755 "${srcdir}/DoConfigure" "${pkgdir}/opt/${pkgname}/DoConfigure"
  install -Dm755 "${srcdir}/doukutsu" "${pkgdir}/usr/bin/doukutsu"
}
