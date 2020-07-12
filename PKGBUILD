# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Thanks to Slash's ioquake3-git package (https://aur.archlinux.org/packages/ioquake3-git)
# for install files and desktop icon, and general (indirect) guidance (I owe you a beer!).
# Also thanks to the creator, Zack Middleton, who provided a lot of good input on packaging. I owe you a case!

pkgname=spearmint
pkgver=1.0.3
pkgrel=1
_ioq3v1='1.36'
_ioq3v2='1.32-9'
pkgdesc="An ioquake3-based engine with multiple improvements (note: requires pak files from original Q3 CD; incompatible with ioquake3)"
url="https://clover.moe/spearmint"
license=("GPL3" "custom")
arch=('i686' 'x86_64')
depends=('sdl2')
makedepends=('sdl2' 'git')
optdepends=('curl: use native curl'
	    'openal: use native openal'
	    'mumble: support for positional Mumble VoIP (as alternative to in-game VoIP feature)')
conflicts=("${pkgname}-git")
install=${pkgname}.install
source=("git+https://github.com/zturtleman/${pkgname}.git"
	"https://github.com/zturtleman/${pkgname}/releases/download/release-${pkgver}/${pkgname}-${pkgver}-data.tar.xz"
	"http://ioquake3.org/files/${_ioq3v1}/data/ioquake3-q3a-${_ioq3v2}.run"
	"${pkgname}.desktop"
	"${pkgname}.service"
	"${pkgname}.launcher"
	"${pkgname}-server.launcher"
	"${pkgname}-${pkgver}-data.tar.xz.sig"
	"ioquake3-q3a-${_ioq3v2}.run.sig"
	"${pkgname}.desktop.sig"
	"${pkgname}.service.sig"
	"${pkgname}.launcher.sig"
	"${pkgname}-server.launcher.sig")
sha512sums=('SKIP'
            'ca35816efc68bd045919044b87eaa4c1486d7bd3d809725c009852f0f4f58fbd8085ab86316a5b53dbdca68317d5822d0dfad5a05b90dea77ed45177258a12c1'
            '2ff6eff394119697b1c0a76f9c6d70cec21f90aecd89b72f6459661d04821a799a9c70d80f390b2ae7822d5830e247033a79022cd6d3d1754f7780fadd2d418b'
            '9e70a201f26265e29fb9ce2d198d943de8e12094b9d04b5e2fad630508787f036c0ee318604a2899ad4a74b4cef8ba3bffd1e7817de8bcbd512a6f80783aea1a'
            '84c60900e2db08e2e8dc39236d268fea392fcbc7cb51af051b5981301bfd5d6c10cafd29284096728048ed4b54baa580ee3f9824a2a1435ba42e91d644547cc0'
            '0ab0b8ee4b5c1952b098a99c58073623c9001a8fe4cb135b6795050b27f3fbf4713a0309135ad6d7b2c3bf2e15f3aaedf71b9b0ba3b6c01bd93e9cdbb6ff2b0d'
            'a30de6726c5b797e8f1dbc49487a1ca29ddabf5ba2eb42665c68a4d2033d284dd2ab3817c84cabdb4152e4e43162f6b7dd072c05514fb2f3c284505127b01fd7'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd ${srcdir}/${pkgname}
  git checkout release-${pkgver}

  # Quake 3 point release pk3s
  cd ${srcdir}
  mkdir -p paks
  chmod 700 ioquake3-q3a-${_ioq3v2}.run
  ./ioquake3-q3a-${_ioq3v2}.run --tar xfC ${srcdir}/paks/.
  for d in baseq3 missionpack;
  do
    mkdir -p ${srcdir}/q3a/${d}
  done
  tar -C ${srcdir}/q3a/baseq3 -xf ${srcdir}/paks/idpatchpk3s.tar
  tar -C ${srcdir}/q3a/missionpack -xf ${srcdir}/paks/idtapatchpk3s.tar
  cd ${srcdir}
  # don't need this anymore.
  rm -rf ${srcdir}/paks
}

build() {
  cd ${srcdir}/${pkgname}
  make
}

package() {
  if [[ "${CARCH}" == 'i686' ]];
  then
    _ARCH='x86'
  elif [[ "${CARCH}" == 'x86_64' ]];
  then
    _ARCH=${CARCH}
  fi

  # Base dirs
  install -d -m 755 ${pkgdir}/usr/bin
  install -d -m 755 ${pkgdir}/usr/share/doc/${pkgname}
  install -d -m 755 ${pkgdir}/usr/share/${pkgname}
  install -d -m 750 ${pkgdir}/opt/${pkgname}

  # stuff i wrote
  install -m 750 ${srcdir}/${pkgname}.launcher ${pkgdir}/opt/${pkgname}/
  install -m 750 ${srcdir}/${pkgname}-server.launcher ${pkgdir}/opt/${pkgname}/

  # https://github.com/zturtleman/${pkgname}.git
  install -m 750 ${srcdir}/${pkgname}/build/release-linux-${_ARCH}/${pkgname}_${_ARCH} ${pkgdir}/opt/${pkgname}/${pkgname}
  install -m 750 ${srcdir}/${pkgname}/build/release-linux-${_ARCH}/${pkgname}-server_${_ARCH} ${pkgdir}/opt/${pkgname}/${pkgname}-server
  install -m 640 ${srcdir}/${pkgname}/build/release-linux-${_ARCH}/${pkgname}-renderer-opengl1_${_ARCH}.so ${pkgdir}/opt/${pkgname}/
  install -m 640 ${srcdir}/${pkgname}/build/release-linux-${_ARCH}/${pkgname}-renderer-opengl2_${_ARCH}.so ${pkgdir}/opt/${pkgname}/

  # https://github.com/zturtleman/${pkgname}/releases/download/release-${pkgver}/${pkgname}-${pkgver}-data.tar.xz
  install -m 640 ${srcdir}/${pkgname}-${pkgver}-data/gamecontrollerdb.txt ${pkgdir}/opt/${pkgname}/
  install -m 640 ${srcdir}/${pkgname}-${pkgver}-data/${pkgname}-gamelist.txt ${pkgdir}/opt/${pkgname}/
  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}-data/LIBERATION_LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/fonts.license.txt
  find ${srcdir}/${pkgname}-${pkgver}-data/ -maxdepth 1 -type f -name "*.txt" -exec install -m 644 '{}' ${pkgdir}/usr/share/doc/${pkgname}/. \;
  for d in baseq3 missionpack missionpackoa tademo baseoa demoq3 fonts;
  do
  	install -d -m 750 ${pkgdir}/opt/${pkgname}/${d}
	install -m 640 ${srcdir}/${pkgname}-${pkgver}-data/${d}/* ${pkgdir}/opt/${pkgname}/${d}/
  done

  # http://ioquake3.org/files/${_ioq3v1}/data/ioquake3-q3a-${_ioq3v2}.run
  for d in baseq3 missionpack;
  do
	install -m 640 ${srcdir}/q3a/${d}/pak?.pk3 ${pkgdir}/opt/${pkgname}/${d}/
  done

  cd ${pkgdir}/usr/bin
  ln -sf /opt/${pkgname}/${pkgname}.launcher ${pkgname}
  ln -sf /opt/${pkgname}/${pkgname}-server.launcher ${pkgname}-server

  install -D -m 644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  install -D -m 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # icon cleanup
  mkdir -p ${pkgdir}/usr/share/pixmaps/${pkgname}
  install -m 644 ${srcdir}/${pkgname}/misc/${pkgname}_text.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  mv ${srcdir}/${pkgname}/misc/*.{svg,png} ${pkgdir}/usr/share/pixmaps/${pkgname}/.
  find ${pkgdir}/usr/share/${pkgname}/ -type d -exec chmod 755 '{}' \;
  find ${pkgdir}/usr/share/${pkgname}/ -type f -exec chmod 644 '{}' \;

}
