# Maintainer: Jesus Alvarez <jeezusjr@gmail.com>
# Contributor: sxe <sxxe@gmx.de>
# Based on the wine-git in AUR

pkgname='netflix-desktop'
pkgver=0.8
pkgrel=2
pkgdesc="An automated script for viewing Netflix through Firefox and patched WINE"
url="https://launchpad.net/netflix-desktop/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('wine-silverlight' 'ttf-ms-fonts' 'zenity' 'wget')

if [[ "$CARCH" == "x86_64" ]]; then
  depends+=(
    'lib32-libsm' 'lib32-alsa-lib' 'lib32-openal' 'lib32-mpg123'
    'lib32-libpng12' 'lib32-libpng' 'lib32-libxcomposite'
  )
  optdepends=(
    'lib32-ati-dri: for open source ATI driver users'
    'lib32-catalyst-utils: for AMD Catalyst users'
    'lib32-intel-dri: for open source Intel driver users'
    'lib32-nouveau-dri: for Nouveau users'
    'lib32-nvidia-utils-bumblebee: for NVIDIA + Bumblebee users'
    'lib32-nvidia-utils: for NVIDIA proprietary blob users'
    'xorg-xset: for screensaver/DPMS toggling'
  )
else
  depends+=('libsm' 'libpng12' 'libpng' 'alsa-lib' 'openal' 'mpg123'
            'libxcomposite')
fi

install=netflix-desktop.install

source=("https://github.com/anish/archlinux/raw/master/netflix-desktop/netflix-desktop.tar.gz"
#source=("https://launchpad.net/netflix-desktop/trunk/${pkgver}.0/+download/${pkgname}.tar.gz"
netflix-desktop.desktop  
netflix-desktop.launcher
NetflixIcon.png)

md5sums=('c6da1fd128cfbe35423fe86ad01f7db3'
         'a41f098487affa1de34c8b44d52617b5'
         'aa3bf2a5686f1b038e1561f8cc28929e'
         '0a4c2ef50831a751dae74315eb066c01')

build() {
  cd "${srcdir}/${pkgname}"
  pushd po
  make
  popd
  pushd wine-browser-installer/test-xattr
  make
  popd
  pushd wine-browser-installer
  sed -i -e 's/share\/wine-browser-installer/share\/netflix-desktop/g' download-missing-files
  sed -i -e 's/\/usr\/share\/n/${HOME}\/\.n/g' download-missing-files
  sed -i -e 's/GLOBAL_SUMS="${INST/GLOBAL_SUMS="${NETF/g' download-missing-files
  sed -i '4i NETFDIR="/usr/share/netflix-desktop";' download-missing-files
  popd
}

package() {

        install -dm755 ${pkgdir}/usr/bin
        install -dm755 ${pkgdir}/usr/share/netflix-desktop
        install -dm755 ${pkgdir}/usr/share/applications
        install -m755 netflix-desktop.launcher ${pkgdir}/usr/bin/netflix-desktop
        pwd
        install -m644 ${srcdir}/${pkgname}/wine-browser-installer/sha256sums ${pkgdir}/usr/share/netflix-desktop/wine-browser-installer.sha256sums
        install -m644 ${srcdir}/${pkgname}/wine-browser-installer/sha256sums ${pkgdir}/usr/share/netflix-desktop/
        install -m644 ${srcdir}/${pkgname}/wine-browser-installer/browser-settings.ini ${pkgdir}/usr/share/netflix-desktop/
        install -m644 NetflixIcon.png ${pkgdir}/usr/share/netflix-desktop/
        install -m644 netflix-desktop.desktop ${pkgdir}/usr/share/applications/
        install -m755 ${srcdir}/${pkgname}/wine-browser-installer/download-missing-files ${pkgdir}/usr/share/netflix-desktop/install-file-downloader
        install -dm755 ${pkgdir}/usr/share/netflix-desktop/browser-profile
        cp -R ${srcdir}/${pkgname}/wine-browser-installer/browser-profile/* ${pkgdir}/usr/share/netflix-desktop/browser-profile/
        install -dm755 ${pkgdir}/usr/share/netflix-desktop/fullscreen-close-plugin
        cp -R ${srcdir}/${pkgname}/wine-browser-installer/fullscreen-close-plugin/* ${pkgdir}/usr/share/netflix-desktop/fullscreen-close-plugin/
        cd "${srcdir}/${pkgname}"
        pushd po
        make DESTDIR="${pkgdir}" install
        popd
        pushd wine-browser-installer/test-xattr
        make DESTDIR="${pkgdir}/usr/share/netflix-desktop/" install
        popd
}

# vim:set ts=2 sw=2 et:
