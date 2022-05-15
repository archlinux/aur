# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
# Contributor: Skunnyk <skunnyk@archlinux.fr>

pkgname=playonlinux
pkgver=4.3.4
pkgrel=4
pkgdesc="GUI for managing Windows programs under linux"
url="https://www.playonlinux.com/"
license=('GPL')
depends=('wine' 'imagemagick' 'xterm' 'wxpython' 'cabextract' 'unzip' 'mesa-utils' 'gnupg'
         'icoutils' 'xdg-user-dirs' 'libxmu' 'netcat' 'wget' 'p7zip' 'jq' 'perl')
arch=('x86_64')
source=(https://www.playonlinux.com/script_files/PlayOnLinux/${pkgver/.0/}/PlayOnLinux_${pkgver/.0/}.tar.gz
        PlayOnLinuxUrlHandler.desktop)
options=(!strip)
sha256sums=('17c3dfd27962ce5a7a0c014850b33188e203d008c9dc71faa230e35fcada2d05'
            '304d8e998d271383c44acdf386c4664cd65463d5f7f5e3c1c7563fbd8f71a6a8')

package() {
  cd "$srcdir/$pkgname"

  sed -i "s/libexec/bin/g" Makefile

  make PREFIX=/usr
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/usr/share/playonlinux/lang
  mv -v "${pkgdir}"/usr/share/locale "${pkgdir}"/usr/share/playonlinux/lang/locale
  chmod 755 "${pkgdir}"/usr/share/playonlinux/lang

  install -m755 "${srcdir}"/PlayOnLinuxUrlHandler.desktop "${pkgdir}"/usr/share/applications/PlayOnLinuxUrlHandler.desktop
  install -m755 playonlinux-url_handler "${pkgdir}"/usr/bin/playonlinux-url_handler
  sed -i "s/python /python2 /g" "$pkgdir"/usr/{bin,share/playonlinux}/playonlinux-url_handler

#  sed -i "s/ %F//g" $pkgdir/usr/share/applications/playonlinux.desktop
}
