# Maintainer  : Anish Bhatt anish [at] gatech [dot] edu
# Contributor : Jesus Alvarez <jeezusjr@gmail.com>
# Contributor : sxe <sxxe@gmx.de>
# Based on the wine-git in AUR

pkgname='netflix-desktop'
pkgver=0.8.2
pkgrel=3
pkgdesc="An automated script for viewing Netflix through Firefox and patched WINE"
url="https://launchpad.net/netflix-desktop/"
arch=('i686' 'x86_64')
license=('MIT')
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

source=("https://launchpad.net/netflix-desktop/trunk/${pkgver}/+download/${pkgname}.tar.gz"
netflix-desktop.desktop  
netflix-desktop.launcher
NetflixIcon.png)

md5sums=('7ce4580a463a61ab3dca713adc3c3bf4'
         'a41f098487affa1de34c8b44d52617b5'
         'aa3bf2a5686f1b038e1561f8cc28929e'
         '0a4c2ef50831a751dae74315eb066c01')

prepare() {
  cd "${srcdir}/${pkgname}"
  pushd wine-browser-installer
  sed -i '1s|python|python2|g' test-xattr
  sed -i -e 's/share\/wine-browser-installer/share\/netflix-desktop/g' download-missing-files
  sed -i -e '3s/\/var\/lib\/wine-browser-installer/${HOME}\/\.netflix-desktop/g' download-missing-files
  sed -i 's|var\/lib|usr\/share|g' download-missing-files
  sed -i '21i cat "${GLOBAL_SUMS}" >> "${SUMS}"' download-missing-files
  sed -i -e 's/GLOBAL_SUMS="${PKG_DIR/GLOBAL_SUMS="${PKG_DIR/g' download-missing-files
  echo "a67102a827cfd16430099cf923eb97dd72653d71e7ab1a27e0eab0fa60a7da83  FirefoxSetup.exe      775  http://download.mozilla.org/?product=firefox-18.0.1&os=win&lang=en-US                                                                
b0e476090206b2e61ba897de9151a31e0182c0e62e8abd528c35d3857ad6131c  SilverlightSetup.exe  775  http://silverlight.dlservice.microsoft.com/download/6/A/1/6A13C54D-3F35-4082-977A-27F30ECE0F34/10329.00/runtime/Silverlight.exe" > sha256sums
  popd
}

build() {
  cd "${srcdir}/${pkgname}"
  pushd po
  make
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

        # Install MIT license
        install -Dm644 "debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/Copyright.txt"

        pushd po
        make DESTDIR="${pkgdir}" install
        popd
        install -Dm755 wine-browser-installer/test-xattr ${pkgdir}/usr/share/netflix-desktop/
}

# vim:set ts=2 sw=2 et:
