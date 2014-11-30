# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=wings2
pkgver=1.3.6
pkgrel=1
pkgdesc="Fly small and agile ships in varied maps"
arch=('i686' 'x86_64')
url="http://www.wings2.net/"
license=('custom: "Wings 2 License"')
depends=('sdl' 'sdl_image' 'sdl_net' 'sdl_mixer' 'libgl' 'libstdc++5' 'desktop-file-utils')
optdepends=('wings2-levelpack: for more levels in the game'
            'wings2-musicpack: more game music')
options=('!strip' 'docs')
install=$pkgname.install
source=(${pkgname}_v${pkgver}_linux.tar.gz::http://www.wings2.net/util/download.php?file=${pkgname}_v${pkgver}_linux.tar.gz
        $pkgname.desktop
        Wings
        Wings64)
md5sums=('4adb5b270a410225c240da0c9a429018'
         '6958819bc2ba835e355a5ae38f10e663'
         'e0118af926a36776aaa7b79853486373'
         'bc7e663ba893172400285e36ffc19fb4')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/opt/Wings2 "${pkgdir}"/usr/bin "${pkgdir}"/usr/share/licenses/wings2
  cp -r "${srcdir}"/Wings2 "${pkgdir}"/opt/
  find "${pkgdir}"/opt -type d -exec chmod 755 "{}" \;
  find "${pkgdir}"/opt -type f -exec chmod 644 "{}" \;

#config.xml and stdout.txt files must be writable by all
  touch "${pkgdir}"/opt/Wings2/bin/{config.xml,stdout.txt}
  chmod a+w "${pkgdir}"/opt/Wings2/bin/{config.xml,stdout.txt}

#directory for received levels from server writable
  chmod a+w "${pkgdir}"/opt/Wings2/levels/received

#.desktop file
  install -D -m644 "${srcdir}"/wings2.desktop "${pkgdir}"/usr/share/applications/wings2.desktop

#license
  install -D -m644 "${pkgdir}"/opt/Wings2/doc/License.txt "${pkgdir}"/usr/share/licenses/wings2/LICENSE

#remove playlist
   rm "${pkgdir}"/opt/Wings2/music/menu_music.txt


# ---------------------- i686 architecture ----------------------
if [ "$CARCH" = "i686" ]; then

#install run file for i686
  install -D -m755 "${srcdir}"/Wings "${pkgdir}"/usr/bin/Wings

#making files for i686 executable
  chmod 775 "${pkgdir}"/opt/Wings2/bin/Wings "${pkgdir}"/opt/Wings2/bin/Makelev

#remove binaries for x86_64
   rm "${pkgdir}"/opt/Wings2/bin/{Wings64,Makelev64}


# ---------------------- x86_64 architecture ----------------------
elif [ "$CARCH" = "x86_64" ]; then

#install run file for x86_64
  install -D -m755 "${srcdir}"/Wings64 "${pkgdir}"/usr/bin/Wings

#making files for x86_64 executable
  chmod 775 "${pkgdir}"/opt/Wings2/bin/Wings64 "${pkgdir}"/opt/Wings2/bin/Makelev64

#remove i686 binaries
  rm "${pkgdir}"/opt/Wings2/bin/{Wings,Makelev}

fi
}
