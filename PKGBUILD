# Maintainer: Jose Riha < jose 1711 gmail com >
# Contributor: Paweł (Smeagol) Bogut <aur(at)smg.int.pl>

pkgname=wink
pkgver=1.5
_pkgver=15
pkgrel=8
pkgdesc="Tutorial and Presentation creation software, primarily aimed at creating tutorials on how to use software."
arch=('i686' 'x86_64')
url="http://www.debugmode.com/wink/"
license=('freeware')
depends_i686=('lib32-libstdc++5' 'lib32-expat' 'lib32-gtk2' 'lib32-pangox-compat')
depends_x86_64=('libstdc++5' 'expat' 'gtk2' 'pangox-compat')

source=('http://www.afterdawn.com/software/general/download.cfm/wink_for_linux?mirror_id=0&version_id=2005&software_id=1047'
        'wink.desktop'
        'wink.png'
        'wink2.png'
	'wink.xml')
md5sums=('be2d80bcf3fdfe1a403674d789aed9db'
         '288f6c96306a8b5abb550ce042928644'
         'cb73aa077a68e2b79b8190eee69e5fbd'
         'ce60b4338d8525f772abbd20834aaaf7'
         'd6c216fb8efd5790d1175e679efe6a5c')

package() {
  mkdir -p ${pkgdir}/usr/{share/wink,bin}
  cd ${pkgdir}/usr/share/wink
  tar xzf ${srcdir}/installdata.tar.gz
  chown -R root:root ${pkgdir}/usr/share/wink
  install -Dm644 ${srcdir}/wink.desktop ${pkgdir}/usr/share/applications/wink.desktop
  install -Dm644 ${srcdir}/wink2.png ${pkgdir}/usr/share/pixmaps/wink.png

  if [[ "$CARCH" == "x86_64" ]] ; then
    ln -s /usr/lib32/libexpat.so.1 ${pkgdir}/usr/share/wink/libexpat.so.0
  else
    ln -s /usr/lib/libexpat.so.1 ${pkgdir}/usr/share/wink/libexpat.so.0
  fi

  cat > ${pkgdir}/usr/share/wink/wink.sh <<"HERE"
#!/bin/bash
mask=$(xset q|awk '/LED mask/{print $NF}')
maskb=$(printf "%08d" $(echo "ibase=10;obase=2;${mask}" | bc))
numlockstate=$(echo ${maskb} | cut -b 7-7)
if [ ${numlockstate} -eq 1 ]
then
	xmessage -xrm 'Xmessage*borderWidth:0' -xrm 'Xmessage*Foreground:red' -xrm 'Xmessage.form.message.Scroll:false' -fn "-urw-*-*-r-*--0-200-0-0-p-*-*-*" -timeout 4 -center -buttons "" "Make sure you disable Numlock when using Wink - otherwise shortcuts will not work! "
fi
cd /usr/share/wink
LD_LIBRARY_PATH=. ./wink "$@"
HERE
  chmod 0755 ${pkgdir}/usr/share/wink/wink.sh
  ln -s /usr/share/wink/wink.sh ${pkgdir}/usr/bin/wink.sh

  # install mime types and icons
  install -Dm644 $srcdir/wink.xml ${pkgdir}/usr/share/mime/packages/wink.xml
  install -Dm644 $srcdir/wink.png ${pkgdir}/usr/share/icons/hicolor/32x32/mimetypes/wink-mime.png
}
