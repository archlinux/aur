# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=theme-hospital-gog
pkgver=2.0.0.5
pkgrel=1
pkgdesc="Manage a hospital in this humoristic business simulation game (gog.com version)"
url="http://gog.com"
license=('custom: commercial')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('bash')
optdepends=('corsix-th: to play it natively'
            'dosbox=0.74: to play with the original executable')
install=$pkgname.install
# You need to download the gog.com installer file manually or with lgogdownloader.
# Or you can configure DLAGENTS in makepkg.conf to auto-search through a directory
# containing gog.com downloads:
# DLAGENTS=('gog::/usr/bin/find /path/to/downloads -name $(echo %u | cut -c 7-) -exec ln -s \{\} %o \; -quit')
DLAGENTS+=('gog::/usr/bin/echo "Could not find \"$(echo %u | cut -c 7-)\". Manually download it to \"$(pwd)\", or set up a gog:// DLAGENT."; exit 1')
source=("gog://setup_theme_hospital_$pkgver.exe"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('c41a77632ca1c33389b57d7210936eb5151ceb6d540707420a4de2d55bd47497'
            '22b24005cc952ae0a7ff92a63c9791567206ebde58740ebc66dfad65060a39b5'
            'e47f1ce9b24d1154d0748bbbefdc2a9979f90ff051404f666897968ec7d5c5aa')
PKGEXT=".pkg.tar"

prepare() {
  # extract installer (convert files to lowercase, as DOS does not care)
  innoextract -e -L -d "$srcdir" setup_theme_hospital_${pkgver}.exe
  # convert icon
  icotool -x app/gfw_high.ico
  # create launchers
  for _m in client server settings; do
    sed "s|Exec=theme-hospital|&-$_m|;s|Name=Theme Hospital|& (${_m^})|" \
      $pkgname.desktop > theme-hospital-$_m.desktop
  done
  # remove bundled dosbox and windows stuff
  rm -rf app/dosbox app/*.ico app/*.dll
  # fix mount directory
  sed 's|mount C ..|mount C .|' -i app/dosbox*.conf
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
  install -Dm644 gfw_high_7_48x48x32.png "$pkgdir"/usr/share/pixmaps/theme-hospital.png
}
