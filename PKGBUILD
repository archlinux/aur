# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=theme-hospital-gog
pkgver=2.1.0.8
pkgrel=1
pkgdesc="Manage a hospital in this humoristic business simulation game (gog.com version)"
url="http://gog.com/game/theme_hospital"
license=('custom: commercial')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('bash')
optdepends=('corsix-th: to play it natively'
            'dosbox=0.74: to play with the original executable')
install=$pkgname.install
source=("setup_theme_hospital_$pkgver.exe"::"gogdownloader://theme_hospital/installer_win_en"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('8e4f35ca9751866f48a81cd53c54aeed85e1fb5f9212339b2a3e849a0022df65'
            '22b24005cc952ae0a7ff92a63c9791567206ebde58740ebc66dfad65060a39b5'
            'e47f1ce9b24d1154d0748bbbefdc2a9979f90ff051404f666897968ec7d5c5aa')
PKGEXT=".pkg.tar"

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
  # extract installer (convert files to lowercase, as DOS does not care)
  innoextract -e -L -d "$srcdir" setup_theme_hospital_${pkgver}.exe
  # convert icon
  icotool -x app/goggame-1207659026.ico
  # create launchers
  for _m in client server settings; do
    sed "s|Exec=theme-hospital|&-$_m|;s|Name=Theme Hospital|& (${_m^})|" \
      $pkgname.desktop > theme-hospital-$_m.desktop
  done
  cd app
  # remove bundled dosbox, windows stuff and gog client files
  rm -rf dosbox/ *.ico *.dll goggame-1207659026.* *.zip __support
  # fix mount directory
  sed 's|mount C "\.\."|mount C "."|' -i dosboxth*.conf
}

package() {
  # data
  install -d "$pkgdir"/opt/theme-hospital
  cp -r app/* "$pkgdir"/opt/theme-hospital
  # fix permissions
  chgrp -R games "$pkgdir"/opt/theme-hospital/{save,hospital.cfg}
  chmod -R g+w "$pkgdir"/opt/theme-hospital/{save,hospital.cfg}
  # doc + licenses
  install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
  ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/theme-hospital/{manual.pdf,readme.txt,netplay.txt}
  install -m644 tmp/{gog_,}eula.txt "$pkgdir"/usr/share/licenses/$pkgname
  # .desktop files and launchers
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/theme-hospital.desktop
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/theme-hospital
  for _m in client server settings; do
    ln -s theme-hospital "$pkgdir"/usr/bin/theme-hospital-$_m
    install -m644 theme-hospital-$_m.desktop "$pkgdir"/usr/share/applications
  done
  # icon
  install -Dm644 goggame-1207659026_7_48x48x32.png "$pkgdir"/usr/share/pixmaps/theme-hospital.png
}
