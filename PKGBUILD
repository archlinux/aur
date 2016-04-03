# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Thanks to Slash's ioquake3-git package (https://aur.archlinux.org/packages/ioquake3-git)
# for install files and desktop icon, and general guidance (I owe you a beer!).

pkgname=spearmint
pkgver=0.2
pkgrel=5
pkgdesc="An improved ioquake3-based Quake 3: Arena client (note: requires pak files from original CD)"
url="http://spearmint.pw"
license=("GPL3")
arch=('i686' 'x86_64')
depends=('sdl2')
conflicts=('quake3' 'ioquake3' 'ioquake3-git')
provides=('quake3' 'ioquake3')
install=spearmint.install
source=("${pkgname}.tar.xz::https://github.com/zturtleman/${pkgname}/releases/download/release-${pkgver}/${pkgname}-${pkgver}-linux.tar.xz"
	"https://raw.githubusercontent.com/zturtleman/${pkgname}/master/misc/${pkgname}.svg"
	"spearmint.desktop"
	"spearmint.service")
sha256sums=("40100f4e321a51661155ba78ae4432debb0e5454390be163595f78e4f27baeab"
            "51d2af17f344a5a38800b4a82d7be44ae79f2f4ab30201535b468b945ea69122"
	    "38c570ee9372f84d6a617e63c97d5b57ded6641fef442133dd68d9eb6d7ab615"
	    "179efb08accebc7be70e6656f79599049c74f0a4c5a0bae3b526fb70416a9aa6")

build() {
  cd ${srcdir}
  mv "${pkgname}-${pkgver}-linux" ${pkgname}
  cd ${pkgname}

if [ ! -f "${pkgname}-server" ];
then
  if [[ "${CARCH}" == 'i686' ]];
  then
    rm -f ${pkgname}{,-server}_x86_64
    mv ${pkgname}_x86 ${pkgname}
    mv ${pkgname}-server_x86 ${pkgname}-server
    _ARCH='x86'
  elif [[ "${CARCH}" == 'x86_64' ]];
  then
    rm -rf ${pkgname}{,-server}_x86
    mv ${pkgname}_x86_64 ${pkgname}
    mv ${pkgname}-server_x86_64 ${pkgname}-server
    _ARCH=${CARCH}
  fi
fi

  mv ${pkgname}-${pkgver}-readme.txt readme.txt
}

package() {
  cd ${srcdir}/${pkgname}
  if [[ "${CARCH}" == 'i686' ]];
  then
    _ARCH='x86'
  elif [[ "${CARCH}" == 'x86_64' ]];
  then
    _ARCH=${CARCH}
  fi

  install -d -m 755 ${pkgdir}/usr/bin
  install -d -m 755 ${pkgdir}/usr/share/doc/${pkgname}
  install -d -m 750 ${pkgdir}/opt/quake3/{baseq3,missionpack,settings}
  install -m 750 ${srcdir}/${pkgname}/${pkgname} ${pkgdir}/opt/quake3/
  install -m 750 ${srcdir}/${pkgname}/${pkgname}-server ${pkgdir}/opt/quake3/
  install -m 750 ${srcdir}/${pkgname}/mint-renderer-opengl*_${_ARCH}.so ${pkgdir}/opt/quake3/
  install -m 640 ${srcdir}/${pkgname}/baseq3/* ${pkgdir}/opt/quake3/baseq3/
  install -m 640 ${srcdir}/${pkgname}/missionpack/* ${pkgdir}/opt/quake3/missionpack/
  install -m 640 ${srcdir}/${pkgname}/settings/* ${pkgdir}/opt/quake3/settings/
  install -m 644 ${srcdir}/${pkgname}/*.txt ${pkgdir}/usr/share/doc/${pkgname}/
  # unneeded since we have the license tracked by pacman
  rm ${pkgdir}/usr/share/doc/${pkgname}/COPYING.txt

  cd ${pkgdir}/usr/bin
  ln -sf /opt/quake3/${pkgname}-server ${pkgname}
  ln -sf /opt/quake3/ioq3ded ${pkgname}-server
  ln -sf ${pkgname} quake3 
  ln -sf ${pkgname}-server q3ded 
  ln -s ${pkgname} ioquake3
  ln -s ${pkgname}-server ioq3ded
  cd ${srcdir}/${pkgname}

  install -D -m 644 ${srcdir}/spearmint.service ${pkgdir}/usr/lib/systemd/system/spearmint.service

  install -D -m 644 ${srcdir}/spearmint.desktop ${pkgdir}/usr/share/applications/spearmint.desktop

  install -D -m 644 ${srcdir}/${pkgname}.svg ${pkgdir}/usr/share/pixmaps/spearmint.svg

}
