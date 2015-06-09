# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Cyberpunk <apocalipsisfull-2011@outlook.com>

pkgname=webcamstudio-git
pkgver=20150307
pkgrel=1
pkgdesc="Webcam desktop recording suite for producing professional looking broadcasts"
arch=('i686' 'x86_64')
depends=('clutter-gst'
         'farstream'
         'ffmpeg'
         'gksu'
         'gnome-video-effects'
         'gnonlin'
         'gst-editing-services'
         'gst-libav'
         'gst-plugins-bad'
         'gst-plugins-base'
         'gst-plugins-base-libs'
         'gst-plugins-good'
         'gst-plugins-ugly'
         'gstreamer'
         'gstreamer0.10'
         'gstreamer0.10-bad'
         'gstreamer0.10-bad-plugins'
         'gstreamer0.10-base'
         'gstreamer0.10-base-plugins'
         'gstreamer0.10-ffmpeg'
         'gstreamer0.10-fluendo'
         'gstreamer0.10-gnonlin'
         'gstreamer0.10-good'
         'gstreamer0.10-good-plugins'
         'gstreamer0.10-ugly'
         'gstreamer0.10-ugly-plugins'
         'java-runtime'
         'libnice'
         'ttf-ubuntu-font-family'
         'v4l2loopback'
         'wmctrl')
         #'gstreamer0.10-espeak' (doesn't compile)
makedepends=('apache-ant' 'git')
url="https://github.com/WebcamStudio/webcamstudio"
license=('GPL3')
source=(git+https://github.com/WebcamStudio/webcamstudio
        webcamstudio.sh)
sha256sums=('SKIP'
            '903336d75ffb49999bf7a9287a22c3d4382cb59cb073b8005792178b75627d8e')
provides=('webcamstudio')
conflicts=('webcamstudio')
install=webcamstudio.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  ant clean jar
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/webcamstudio/COPYING"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/webcamstudio"
  for _doc in docs/* AUTHORS CHANGELOG README TODO; do
    cp -dpr --no-preserve=ownership $_doc "$pkgdir/usr/share/doc/webcamstudio"
  done

  msg2 'Installing...'
  install -dm 755 "$pkgdir/usr/share/webcamstudio/lib"
  cp -dpr --no-preserve=ownership libraries/* \
    "$pkgdir/usr/share/webcamstudio/lib"
  install -Dm 644 dist/WebcamStudio.jar \
    "$pkgdir/usr/share/webcamstudio/WebcamStudio.jar"

  msg2 'Installing executable...'
  install -Dm 755 "$srcdir/webcamstudio.sh" "$pkgdir/usr/bin/webcamstudio"

  msg2 'Installing desktop files...'
  install -Dm 644 debian/webcamstudio.desktop \
    "$pkgdir/usr/share/applications/webcamstudio.desktop"
  install -Dm 644 debian/webcamstudio.png \
    "$pkgdir/usr/share/pixmaps/webcamstudio.png"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
