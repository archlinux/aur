# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Thanks to Slash's ioquake3-git package (https://aur.archlinux.org/packages/ioquake3-git)
# for install files and desktop icon, and general (indirect) guidance (I owe you a beer!).
# Also thanks to the creator, Zack Middleton, who provided a lot of good input on packaging. I owe you a case!

pkgname=spearmint
pkgver=0.2
pkgrel=15
_ioq3v1='1.36'
_ioq3v2='1.32-9'
pkgdesc="An ioquake3-based engine with multiple improvements (note: requires pak files from original Q3 CD; incompatible with ioquake3)"
url="http://spearmint.pw"
license=("GPL3")
arch=('i686' 'x86_64')
depends=('sdl2')
optdepends=('curl: use native curl'
	    'openal: use native openal'
	    'mumble: support for positional audio (as alternative to in-game VOIP feature)')
conflicts=('spearmint-git')
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
            '9e70a201f26265e29fb9ce2d198d943de8e12094b9d04b5e2fad630508787f036c0ee318604a2899ad4a74b4cef8ba3bffd1e7817de8bcbd512a6f80783aea1a'
            '84c60900e2db08e2e8dc39236d268fea392fcbc7cb51af051b5981301bfd5d6c10cafd29284096728048ed4b54baa580ee3f9824a2a1435ba42e91d644547cc0'
            '92fb1693b91fc7e7ba97612990369a0344b23dbdcfd0c3ecbfc5e7519f86caf9348b63e9a641f081ef8ba913fb1f50a4ca830a7107bc939be5c345e89223f640'
            '91b9af20e64223d7d7f21e7eb18cac168c9374409358e4e4d7ddad6576ceb68532d67ba82bc525833cd4ae4d8260ea44429299facbfb9186f72f16790f45a023'
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
  mkdir -p paks
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
  install -d -m 750 ${pkgdir}/opt/spearmint/{baseq3,missionpack}
  install -m 750 ${srcdir}/${pkgname}.launcher ${pkgdir}/opt/spearmint/
  install -m 750 ${srcdir}/${pkgname}-server.launcher ${pkgdir}/opt/spearmint/
  install -m 750 ${srcdir}/${pkgname}/${pkgname} ${pkgdir}/opt/spearmint/
  install -m 750 ${srcdir}/${pkgname}/${pkgname}-server ${pkgdir}/opt/spearmint/
  install -m 750 ${srcdir}/${pkgname}/mint-renderer-opengl*_${_ARCH}.so ${pkgdir}/opt/spearmint/
  install -m 640 ${srcdir}/${pkgname}/settings/gamecontrollerdb.txt ${pkgdir}/opt/spearmint/
  install -m 640 ${srcdir}/${pkgname}/baseq3/* ${pkgdir}/opt/spearmint/baseq3/
  install -m 640 ${srcdir}/${pkgname}/missionpack/* ${pkgdir}/opt/spearmint/missionpack/
  install -m 644 ${srcdir}/${pkgname}/*.txt ${pkgdir}/usr/share/doc/${pkgname}/
  # unneeded since we have the license tracked by pacman
  rm ${pkgdir}/usr/share/doc/${pkgname}/{COPYING,${pkgname}-${pkgver}-readme}.txt

  cd ${pkgdir}/usr/bin
  ln -sf /opt/spearmint/${pkgname}.launcher ${pkgname}
  ln -sf /opt/spearmint/${pkgname}-server.launcher ${pkgname}-server

  install -D -m 644 ${srcdir}/spearmint.service ${pkgdir}/usr/lib/systemd/system/spearmint.service

  install -D -m 644 ${srcdir}/spearmint.desktop ${pkgdir}/usr/share/applications/spearmint.desktop

  install -D -m 644 ${srcdir}/${pkgname}.svg ${pkgdir}/usr/share/pixmaps/spearmint.svg

}
