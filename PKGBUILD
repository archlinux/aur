# Maintainer:  jyantis <yantis@yantis.net>
# Contributor: Maximilien Noal <noal dot maximilien at gmail dot com> [AUR: xcomcmdr]
# Contributor: Kirill "reflexing" Churin <reflexing@reflexing.ru>
# Contributor: Wido <widowild [at] myopera [dot] com>

# Comments from jyantis:
# Because of a bug with the way it continously updates and creates a million lib
# Directories. And since it is GPL3
# I am going to host an easy to install version for now for x_86_64.
# I am assuming this is due to a programming bug and not the original PKGBUILD
# /opt/desura/lib/lib/lib/lib/lib/lib/lib/lib/lib/lib/lib/desura
# for the i686 user you will need to hit cancel after its second round of downloading

# This needs these older libs to work properly (which I have included)
# libcurl.so.3 # Using package libcurl-compat since it doesn't overwrite the newer version
# libboost_filesystem.so.1.54.0 # Downloading these as binaries since it would overwrite
# libboost_system.so.1.54.0 # Downloading these as binaries since it would overwrite

pkgname=desura
pkgver=120.25
pkgrel=4
pkgdesc='A community-driven digital distribution service for gamers (2750+ games)'
url='http://desura.com/'
license=('GPL3')
arch=('i686' 'x86_64')
install=desura.install
depends=('lsb-release'
         'orbit2'
         'gtk2'
         'libjpeg6-turbo'
         'libpng12'
         'libxpm'
         'libcurl-compat'
         'desktop-file-utils'
         'xdg-utils')
optdepends=('java-runtime: adds java support'
            'mono: Free implementation of the .NET platform'
            'glew1.5: if you have install M.A.R.S - a ridiculous shooter')

source=('desura.sh'
        'desura.desktop'
        'desura.png')

md5sums=('d3b192b3b27a09e4f3b62ac997e414e9'
         '83d0d30e9eefad49308d50d763f94dfd'
         'd74bf6e5275c0529470593872749a09d')


if [[ $CARCH == i686 ]]; then
  optdepends+=('nvidia-utils: If you have nvidia graphics'
               'catalyst-utils: If you have ATI graphics'
               'adobe-air: for Adobe Air-based games')

  source+=('http://www.desura.com/desura-i686.tar.gz'
           'http://yantis-scripts.s3.amazonaws.com/libboost_filesystem.so.1.54.0-i686'
           'http://yantis-scripts.s3.amazonaws.com/libboost_system.so.1.54.0-i686')

  md5sums+=('38a3aa1b69189418e823059072da7739'
            '5863dd55c4a96f9a96f8536b636e8c45'
            '77f77e3eaeece4ef3355c1d0b5055e90')

else
  optdepends+=('lib32-nvidia-utils: If you have nvidia graphics'
               'lib32-catalyst-utils: If you have ATI graphics'
               'lib32-curl: if you have install TRAUMA '
               'lib32-nss: if you have install TRAUMA'
               'bin32-adobe-air: for Adobe Air-based games')

  source+=('http://yantis-scripts.s3.amazonaws.com/desura_120_25.tar.gz'
           'http://yantis-scripts.s3.amazonaws.com/libboost_filesystem.so.1.54.0-x86_64'
           'http://yantis-scripts.s3.amazonaws.com/libboost_system.so.1.54.0-x86_64')


  md5sums+=('24cac15e63d6054266452dce00a3dc39'
            '321a267c8cbf7266a507728945509f4e'
            'cee97c1c861f1731a40436cb1f9f50c5')
fi

package(){

  # Find out what group user belongs to and install under that group
  # (Does work like the user that requested it wanted since if someone sudos it does root)
  # USERGROUP=$(id -gn)
  # msg $USERGROUP
  # install -dm 775 -g $USERGROUP ${pkgdir}/opt/${pkgname}

  # Change permissions
  install -d -m775 -g users ${pkgdir}/opt/${pkgname}

  # Install Desura
  if [[ $CARCH == i686 ]]; then
    # install -D -m755 desura ${pkgdir}/opt/${pkgname}/
    install -D -m755 desura/* ${pkgdir}/opt/${pkgname}/
  else
    cp -r desura/* $pkgdir/opt/desura
  fi
  # Install launcher
  install -D -m755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

  # Install older boost libraries without overwriting newer ones
  install -D -m644 libboost_filesystem.so.1.54.0-${CARCH} ${pkgdir}/usr/lib/libboost_filesystem.so.1.54.0
  install -D -m644 libboost_system.so.1.54.0-${CARCH} ${pkgdir}/usr/lib/libboost_system.so.1.54.0

  # Install bootstrapper icon
  install -m 644 -D \
    ${pkgname}.png \
    ${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png

  # Install bootstrapper desktop file
  desktop-file-install -m 644 --dir ${pkgdir}/usr/share/applications/ ${pkgname}.desktop
}
