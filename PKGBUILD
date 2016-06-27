pkgname=janusvr
pkgdesc='JanusVR is a 3D VR internet browser'
url='http://www.dgp.toronto.edu/~mccrae/projects/firebox/'
pkgver=50.5
pkgrel=1
arch=('x86_64')
license=('custom')
janusver=$(curl http://www.janusvr.com/version.html)
source=("janusvr${janusver}.gz::http://downloads.janusvr.com/janusvr_linux.tar.gz"
        "janusvr.sh" "http://www.dgp.toronto.edu/~mccrae/projects/firebox/img/janus_logo5.jpg"
        "janusvr.desktop")
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'sqlite' 'dbus-glib' 'qt5-multimedia')
optdepends=("oculus-rift-sdk-jherico-git: For libOVR including a fix for mesa. Don't forget to Replace /opt/janusvr/libOVRRT64_0.so.5.0.1")
makedepends=("imagemagick") #only for converting the icon

pkgver() {
  echo "$janusver"
}

package() {
  install -d "$pkgdir/opt"
  install -d "$pkgdir/usr/share/icons/"
  install -d "$pkgdir/usr/share/applications"

  cp -ra JanusVRBin/ "$pkgdir/opt/janusvr"
#  chmod a+x "$pkgdir/opt/janusvr"/*.sh
  chmod a+x "$pkgdir/opt/janusvr/janusvr"
  chmod -R a+rX "$pkgdir/opt/janusvr"
  
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/janusvr.sh" "$pkgdir/usr/bin/janusvr"

  # segfaults for me with mesa with OpenCL. WAT
  MAGICK_OCL_DEVICE=OFF convert "$srcdir/janus_logo5.jpg" -resize 128x128 "$pkgdir/usr/share/icons/janusvr.png" # screw the aspect ratio

  install "${srcdir}/janusvr.desktop" "${pkgdir}/usr/share/applications/janusvr.desktop"

  # CAUTION: Everyone in the group "games" can replace the whole thing e.g. with malware
  # But for now there doesn't seem to be a better way, because it needs write accessess error_log.txt in its base directory, also temporary files are created there....
  chown -R root:games ${pkgdir}/opt/janusvr
  chmod -R g+w ${pkgdir}/opt/janusvr

  #mv "$pkgdir/opt/janusvr/libOVRRT64_0.so.5.0.1" "$pkgdir/opt/janusvr/libOVRRT64_0.so.5.0.1.bak"
  #install -m755 "$srcdir/libovr.so" "$pkgdir/opt/janusvr/libOVRRT64_0.so.5.0.1"
}

md5sums=('SKIP'
         'c05bb2fbfce12c89db560ed8b8bb036a'
         'caa1d06e46c684365cb8cddcac29ee21'
         'a8a2ce8e4dfa4e4e87a6af811b5627a4')
