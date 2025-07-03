# Maintainer: lod <aur@cyber-anlage.de>

pkgname=spacecontrol
pkgver=2.9.3
pkgrel=1
pkgdesc="SpaceControl 3D Mouse Driver for Linux, creates a virtual device compatible with spacenavd for broad system use."
arch=('x86_64')
url="https://spacecontrol.de"
license=('LicenseRef-SpaceControl-EULA')
depends=(bash gcc-libs glibc hicolor-icon-theme java-runtime libx11 libxtst python python-evdev sh spacenavd)
makedepends=(git)
options=('!debug' '!emptydirs')
source=(https://spacecontrol.de/download/drivers/SpaceControl_Driver_293_LNX64_setup.sh
        git+https://github.com/lodriguez/SpaceBridge.git
        99-spacecontrol-usb-ftdi-unbind.rules
        sc_gui.sh
        sc_daemon.sh
        SpaceControl-Panel.desktop
        sc-daemon.service)
b2sums=('8bdd596aa234ccc15569c0ba97c9801f3cb04c4111d889366b6eeec831f8c52162a4d83b378bb479ea8e8627ff2cf625eeb740d0fcf4307963a49cc1a1fd7862'
        'SKIP'
        'ded37e320d3afb49bb5705273e21d1d117e6ece1ed5b59d0245d0f95437e706f4de2b13ab2a1642b1e812a9db956403b43353f3e7b39d0206ef23e597466865b'
        'ed8929d44eecfbe62b0f5bfaf0911e919c920d8248b7c363fe18038fa320b540554ab78ed014c2477c0875908aa70b352036b61800385ab5711d531bcf28940a'
        'cf0b4c0538d0d8079936cca93262fecc3fe0d6c452cab422bf03988cc705ee63a8de84d0b7a888434813b17bb12aa670c9a61ac0aff4888e8287256ee83f13e1'
        'c097d1d8d4c0a5775e97259c7acbab8e6cb3f737995afc8da2b60247ae292aad48aea4eea9c2aafa8e88fbfcc014366624e0cca4c7ef44fc8ca91c0d1041043b'
        '8b978b7ec447ca8b0a3cfae70ef263e894740be16d082dba36b929050cc0ba28be1c95838d0105cc631c0a992a25c6492bd242b68c0e9bdcdc195c46b5c57e47')

package() {
  sh SpaceControl_Driver_293_LNX64_setup.sh --target "$srcdir/$pkgname" --noexec --nox11 --keep --nodiskspace
  
  cd "$srcdir/$pkgname"
  
  install -d "$pkgdir/usr/lib/udev/rules.d/"
  install -d "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/lib/$pkgname/"
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -d "$pkgdir/usr/share/applications/"
  
  install -Dm644 {SC_GUI.jar,vks.ini,buildno.txt,translations_de.txt,sc_logo_splash.png} "$pkgdir/usr/lib/$pkgname/"
  install -Dm755 {sc_daemon,proc_observer,kill_processes} "$pkgdir/usr/lib/$pkgname/"

  install -Dm755 ../sc_daemon.sh "$pkgdir/usr/bin/sc_daemon"
  install -Dm755 ../sc_gui.sh "$pkgdir/usr/bin/sc_gui"
  
  cp -r {cfgs,lib} "$pkgdir/usr/lib/$pkgname/"
  
  cp -r doc/* "$pkgdir/usr/share/doc/$pkgname/"
  ln -s "../../share/doc/$pkgname" "$pkgdir/usr/lib/spacecontrol/doc"

  install -Dm644 lib/libspc_ctrl_64.so.2.9.2 "$pkgdir/usr/lib/$pkgname/lib/libspc_ctrl.so"
  install -Dm644 ../99-spacecontrol-usb-ftdi-unbind.rules "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 ../SpaceControl-Panel.desktop "$pkgdir/usr/share/applications/"
  install -Dm644 src/pics/sc512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/spacecontrol.png"
  
  install -Dm644 doc/license_en.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.en"
  install -Dm644 doc/license_de.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.de"
  
  install -Dm644 ../sc-daemon.service "$pkgdir/usr/lib/systemd/user/sc-daemon.service"
  
  install -Dm755 ../SpaceBridge/SpaceBridge.py "$pkgdir/usr/lib/spacecontrol/spacebridge.py"
  install -Dm644 ../SpaceBridge/spacebridge.service "$pkgdir/usr/lib/systemd/user/spacebridge.service"
}
