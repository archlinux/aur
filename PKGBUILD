# Maintainer: Jose Riha < jose 1711 gmail com >
# Contributor: Paweł (Smeagol) Bogut <aur(at)smg.int.pl>

pkgname=wink
pkgver=1.5
_pkgver=15
pkgrel=7
pkgdesc="Tutorial and Presentation creation software, primarily aimed at creating tutorials on how to use software."
arch=('i686' 'x86_64')
url="http://www.debugmode.com/wink/"
license=('freeware')

if [[ "$CARCH" == "x86_64" ]] ; then
  depends=('lib32-libstdc++5' 'lib32-expat' 'lib32-gtk2' 'lib32-pangox-compat')
else
  depends=('libstdc++5' 'expat' 'gtk2' 'pangox-compat')
fi

source=('http://www.afterdawn.com/software/general/download.cfm/wink_for_linux?mirror_id=0&version_id=2005&software_id=1047'
wink.desktop
wink.png)
md5sums=('be2d80bcf3fdfe1a403674d789aed9db'
         '440d2b916de8db5ee009f0815df013ec'
         'cb73aa077a68e2b79b8190eee69e5fbd')

build() {
true
}

package() {
  mkdir -p ${pkgdir}/usr/{share/wink,bin}
  cd ${pkgdir}/usr/share/wink
  tar xzf ${srcdir}/installdata.tar.gz
  chown -R root:root ${pkgdir}/usr/share/wink
  install -Dm644 ${srcdir}/wink.desktop ${pkgdir}/usr/share/applications/wink.desktop
  install -Dm644 ${srcdir}/wink.png ${pkgdir}/usr/share/pixmaps/wink.png

  if [[ "$CARCH" == "x86_64" ]] ; then
    ln -s /usr/lib32/libexpat.so.1 ${pkgdir}/usr/share/wink/libexpat.so.0
  else
    ln -s /usr/lib/libexpat.so.1 ${pkgdir}/usr/share/wink/libexpat.so.0
  fi

  cat > ${pkgdir}/usr/share/wink/wink.sh <<HERE
#!/bin/bash
cd /usr/share/wink
LD_LIBRARY_PATH=. ./wink
HERE
  chmod 0755 ${pkgdir}/usr/share/wink/wink.sh
  ln -s /usr/share/wink/wink.sh ${pkgdir}/usr/bin/wink.sh
}
