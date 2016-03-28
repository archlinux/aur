# Maintainer: MKzero <info at linux-web-development dot de>
# Contributor: Bitwig GmbH <support at bitwig dot com>

pkgname='bitwig-studio'
pkgver='1.3.8'
pkgrel='3'
pkgdesc='Music production system for production, remixing and performance'
arch=('x86_64')
url='http://www.bitwig.com/'
license=('custom')
# This list is not anywhere near what it should be and misses a lot of package
# names. If you find yourself in a situation where you are missing something,
# please tell me via mail or Github:
# https://github.com/mkzero/bitwig-studio-demo-aur
depends=('jack' 'xdg-utils' 'zenity' 'xcb-util-wm' 'libbsd')
optdepends=('alsa-lib' 'oss' 'ffmpeg: MP3 support')
provides=('bitwig-studio')
replaces=('bitwig-studio-demo')
conflicts=('bitwig-studio-demo' 'bitwig-studio-demo-rc')
options=(!strip)
source=("https://downloads.bitwig.com/stable/${pkgver}/bitwig-studio-${pkgver}.deb"
        'bitwig-studio.desktop'
        'bitwig-studio.launcher')
md5sums=('062f57caa81af1e1168680f24ec12370'
         '6bbd6aedc339a634f089ecc9c8df1537'
         '32411d3b742f15addef7b86681825fee')

package() {
  # Create pkgdir folders
  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/opt/bitwig-studio/libexec
  install -d ${pkgdir}/usr/share/{applications,icons}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}

  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/

  # Replace the launcher
  install -m755 ${srcdir}/bitwig-studio.launcher ${pkgdir}/usr/bin/bitwig-studio

  # Replace the desktop launcher
  install -m755 ${srcdir}/bitwig-studio.desktop ${pkgdir}/usr/share/applications/bitwig-studio.desktop

  # Workaround MP3 support by providing symlinks to ffmpeg
  ln -s /usr/bin/ffmpeg ${pkgdir}/opt/bitwig-studio/libexec/avconv
  ln -s /usr/bin/ffprobe ${pkgdir}/opt/bitwig-studio/libexec/avprobe

  # Install license
  install -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
