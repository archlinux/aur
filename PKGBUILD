# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Thanks to Slash's ioquake3-git package (https://aur.archlinux.org/packages/ioquake3-git)
# for install files and desktop icon, and general guidance (I owe you a beer!).

pkgname=spearmint
pkgver=0.2
pkgrel=10
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
	"${pkgname}.svg"
	"http://ioquake3.org/files/${_ioq3v1}/data/ioquake3-q3a-${_ioq3v2}.run"
	"spearmint.desktop"
	"spearmint.service"
	"spearmint.launcher"
	"spearmint-server.launcher"
	"${pkgname}.tar.xz.sig"
	"${pkgname}.svg.sig"
	"ioquake3-q3a-${_ioq3v2}.run.sig"
	"spearmint.desktop.sig"
	"spearmint.service.sig"
	"spearmint.launcher.sig"
	"spearmint-server.launcher.sig")
sha512sums=('53a3b3b2bb139b9e5ecbd12c5876048dd2b2cffab07acf2db5fd7697f5624af24d503539bfe4a9acf721fdb6886063ff24d848637781f6639550e79f4a1abd26'
            'a6991edf1821403be965a40d1534b23b1248c9c6c0aaa23ea7d67e93f03d65610637ac417d6beb9d69c7609249ed68afe90d9a1ce1ad26237dc8e64f072d6d79'
            '2ff6eff394119697b1c0a76f9c6d70cec21f90aecd89b72f6459661d04821a799a9c70d80f390b2ae7822d5830e247033a79022cd6d3d1754f7780fadd2d418b'
            '0c192c23cc180181f5edee12cd085e78f0cdd2d6e8f18dbd27532b76c36f2b0e731b764119a0a44df90411f94d3b7475bd40ae0d9b8f5bb3867442f93172746b'
            'fd75d6633015057c49fdb1cd29dfa16b8b30fd49df2deb0bbbb9da1a5e84179672ee7fee5df6dc57b0e4b6931ab5200f9e6ada5127e57aec5bf29b3e1b020073'
            '894a0b07399ea7fcf60c97516e5cf19740693192e896e687fba0aeedee675684d94968e69dc927bdb4a44b4298c82d5b4bdca0cc86e707c21cb44f4f9876aea9'
            'c7611bf35ace821dcf5829e729c1b0e2f2cc858f2e8ffb491c94990b72990148a8700c1797d715ee2002b3acc10c599d69fa6bc0059c0f9117f64707b6745445'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

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
