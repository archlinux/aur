# Maintainer: Jan Neumann <neum dot ja at gmail dot com>
# Contributor: James Bunton <jamesbunton@delx.net.au>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgbase=handbrake-fdkaac-git
pkgname=('handbrake-fdkaac-git' 'handbrake-cli-fdkaac-git')
gitname=('HandBrake')
pkgver=1.0.0.r495.g2123622dd
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/HandBrake/HandBrake"
license=('GPL2' 'custom:FDKAAC')
makedepends=('intltool' 'python2' 'yasm' 'wget' 'cmake' 'bzip2' 'gcc-libs'
             'zlib' 'libnotify' 'gst-plugins-base' 'gtk3' 'dbus-glib' 'libass'
             'lame' 'libxml2' 'opus' 'libvorbis' 'libtheora' 'libsamplerate'
             'x264' 'libx264' 'jansson' 'librsvg' 'libgudev')
source=(git+${url}.git)
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${gitname}

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${gitname}

  ./configure \
    --prefix=/usr \
    --disable-gtk-update-checks \
    --enable-fdk
  make -C build
}

package_handbrake-fdkaac-git() {
  pkgdesc="Multithreaded video transcoder - Fraunhofer AAC enabled (git version)"
  conflicts=('handbrake' 'handbrake-fdkaac')
  provides=('handbrake')
  depends=('bzip2' 'gcc-libs' 'zlib' 'gst-plugins-base' 'libnotify' 'dbus-glib'
           'gtk3' 'libass' 'lame' 'libxml2' 'opus' 'libvorbis' 'libtheora'
           'libsamplerate' 'libx264' 'jansson' 'librsvg' 'libgudev'
           'desktop-file-utils' 'hicolor-icon-theme')
  optdepends=('gst-plugins-good: for video previews'
              'gst-libav: for video previews'
              'libdvdcss: for decoding encrypted DVDs')

  cd ${srcdir}/${gitname}/build
  make DESTDIR=${pkgdir} install
  
  mkdir -pm755 ${pkgdir}/usr/share/licenses/fdkaac-ghb
  install -Dm644 ${srcdir}/${gitname}/build/contrib/fdkaac/fdk-aac-0.1.5/NOTICE ${pkgdir}/usr/share/licenses/fdkaac-ghb/LICENSE
  
  rm ${pkgdir}/usr/bin/HandBrakeCLI
}

package_handbrake-cli-fdkaac-git() {
  pkgdesc="Multithreaded video transcoder (CLI) - Fraunhofer AAC enabled (git version)"
  conflicts=('handbrake-cli' 'handbrake-cli-fdkaac')
  provides=('handbrake-cli')
  depends=('bzip2' 'gcc-libs' 'zlib' 'libass' 'lame' 'libxml2' 'opus'
           'libvorbis' 'libtheora' 'libsamplerate' 'libx264' 'jansson')
  optdepends=('libdvdcss: for decoding encrypted DVDs')

  cd ${srcdir}/${gitname}/build
  install -D HandBrakeCLI ${pkgdir}/usr/bin/HandBrakeCLI
   
  mkdir -pm755 ${pkgdir}/usr/share/licenses/fdkaac-ghb-cli
  install -Dm644 ${srcdir}/${gitname}/build/contrib/fdkaac/fdk-aac-0.1.5/NOTICE ${pkgdir}/usr/share/licenses/fdkaac-ghb-cli/LICENSE
}



