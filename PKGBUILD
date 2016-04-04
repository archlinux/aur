# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Thanks to Slash's ioquake3-git package (https://aur.archlinux.org/packages/ioquake3-git)
# for install files and desktop icon, and general guidance (I owe you a beer!).

pkgname=spearmint
pkgver=0.2
pkgrel=9
_ioq3v1='1.36'
_ioq3v2='1.32-9'
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
	"http://ioquake3.org/files/${_ioq3v1}/data/ioquake3-q3a-${_ioq3v2}.run"
	"spearmint.desktop"
	"spearmint.service"
	"spearmint.launcher"
	"spearmint-server.launcher")
sha256sums=("40100f4e321a51661155ba78ae4432debb0e5454390be163595f78e4f27baeab"
            "51d2af17f344a5a38800b4a82d7be44ae79f2f4ab30201535b468b945ea69122"
	    "fd871b4437212f7e0f3a74d650ef9412c39aff5e265ca5f8939ec2d86b35a109"
	    "38c570ee9372f84d6a617e63c97d5b57ded6641fef442133dd68d9eb6d7ab615"
	    "ce4622186434d54429eee500d4f1494b4d099ee06bf805e0713be596e19273c9"
            "037fc0000ce83ebf26d2097ab3676500aea85274548eea7665d318a0bfcd1ef9"
	    "859625c05dfb451bb36963d10bc250d20e03853bef03243bcf85b8d0ff12b561")

prepare() {
  cd ${srcdir}
  mv "${pkgname}-${pkgver}-linux" ${pkgname}
  mkdir paks
  chmod 700 ioquake3-q3a-${_ioq3v2}.run
  ./ioquake3-q3a-${_ioq3v2}.run --tar xfC ${srcdir}/paks/.
  tar -C ${srcdir}/${pkgname}/baseq3 -xf ${srcdir}/paks/idpatchpk3s.tar
  tar -C ${srcdir}/${pkgname}/missionpack -xf ${srcdir}/paks/idtapatchpk3s.tar
  cd ${srcdir}
  # don't need this anymore.
  rm -rf ${srcdir}/paks
}

build() {
  cd ${srcdir}/${pkgname}

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

  cp ${pkgname}-${pkgver}-readme.txt readme.txt
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
  install -m 750 ${srcdir}/${pkgname}.launcher ${pkgdir}/opt/quake3/
  install -m 750 ${srcdir}/${pkgname}-server.launcher ${pkgdir}/opt/quake3/
  install -m 750 ${srcdir}/${pkgname}/${pkgname} ${pkgdir}/opt/quake3/
  install -m 750 ${srcdir}/${pkgname}/${pkgname}-server ${pkgdir}/opt/quake3/
  install -m 750 ${srcdir}/${pkgname}/mint-renderer-opengl*_${_ARCH}.so ${pkgdir}/opt/quake3/
  install -m 640 ${srcdir}/${pkgname}/baseq3/* ${pkgdir}/opt/quake3/baseq3/
  install -m 640 ${srcdir}/${pkgname}/missionpack/* ${pkgdir}/opt/quake3/missionpack/
  install -m 640 ${srcdir}/${pkgname}/settings/* ${pkgdir}/opt/quake3/settings/
  install -m 644 ${srcdir}/${pkgname}/*.txt ${pkgdir}/usr/share/doc/${pkgname}/
  # unneeded since we have the license tracked by pacman
  rm ${pkgdir}/usr/share/doc/${pkgname}/{COPYING,${pkgname}-${pkgver}-readme}.txt

  cd ${pkgdir}/usr/bin
  ln -sf /opt/quake3/${pkgname}.launcher ${pkgname}
  ln -sf /opt/quake3/${pkgname}-server.launcher ${pkgname}-server
  ln -sf /opt/quake3/${pkgname}.launcher quake3 
  ln -sf /opt/quake3/${pkgname}-server.launcher q3ded 
  ln -sf /opt/quake3/${pkgname}.launcher ioquake3
  ln -sf /opt/quake3${pkgname}-server.launcher ioq3ded
  cd ${pkgdir}/opt/quake3
  ln -sf ${pkgname} ioquake3
  ln -sf ${pkgname}-server ioq3ded

  install -D -m 644 ${srcdir}/spearmint.service ${pkgdir}/usr/lib/systemd/system/spearmint.service

  install -D -m 644 ${srcdir}/spearmint.desktop ${pkgdir}/usr/share/applications/spearmint.desktop

  install -D -m 644 ${srcdir}/${pkgname}.svg ${pkgdir}/usr/share/pixmaps/spearmint.svg

}
