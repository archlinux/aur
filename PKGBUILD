# Maintainer: zturtleman <zturtleman[at]gmail[dot]com>
# Contributors: sanerb (AUR)
# Thanks to ioquake3-git package contributors (https://aur.archlinux.org/packages/ioquake3-git)
# for general (indirect) guidance.

pkgname=spearmint-git
_pkgname=spearmint
pkgver=r5244.c48bdf60
pkgrel=1
_upver='1.0.3'
pkgdesc="An ioquake3-based engine with multiple improvements (note: requires pak files from original Q3 CD; incompatible with ioquake3)"
url="https://clover.moe/spearmint"
license=("GPL3" "custom")
arch=('i686' 'x86_64')
depends=('sdl2')
makedepends=('sdl2' 'git')
optdepends=('curl: use native curl'
	    'openal: use native openal'
	    'mumble: support for positional Mumble VoIP (as alternative to in-game VoIP feature)')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install=${_pkgname}.install
source=("git+https://github.com/clover-moe/${_pkgname}.git"
	"git+https://github.com/clover-moe/mint-arena.git"
	"https://github.com/clover-moe/${_pkgname}/releases/download/release-${_upver}/${_pkgname}-${_upver}-data.tar.xz"
	"${_pkgname}.desktop"
	"${_pkgname}.service"
	"${_pkgname}.launcher"
	"${_pkgname}-server.launcher"
	)
sha512sums=('SKIP'
            'SKIP'
            'ca35816efc68bd045919044b87eaa4c1486d7bd3d809725c009852f0f4f58fbd8085ab86316a5b53dbdca68317d5822d0dfad5a05b90dea77ed45177258a12c1'
            '9e70a201f26265e29fb9ce2d198d943de8e12094b9d04b5e2fad630508787f036c0ee318604a2899ad4a74b4cef8ba3bffd1e7817de8bcbd512a6f80783aea1a'
            '84c60900e2db08e2e8dc39236d268fea392fcbc7cb51af051b5981301bfd5d6c10cafd29284096728048ed4b54baa580ee3f9824a2a1435ba42e91d644547cc0'
            '92fb1693b91fc7e7ba97612990369a0344b23dbdcfd0c3ecbfc5e7519f86caf9348b63e9a641f081ef8ba913fb1f50a4ca830a7107bc939be5c345e89223f640'
            '91b9af20e64223d7d7f21e7eb18cac168c9374409358e4e4d7ddad6576ceb68532d67ba82bc525833cd4ae4d8260ea44429299facbfb9186f72f16790f45a023'
            )

pkgver() {
  cd "${srcdir}/${_pkgname}"
  (
     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${srcdir}/${_pkgname}
  make

  cd ${srcdir}/mint-arena
  make BUILD_GAME_SO=0 # baseq3, missionpack
  make BUILD_GAME_SO=0 BASEGAME=demoq3 MISSIONPACK=tademo
  make BUILD_GAME_SO=0 BASEGAME=baseoa MISSIONPACK=missionpackoa
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
  install -d -m 755 ${pkgdir}/usr/share/doc/${_pkgname}
  install -d -m 755 ${pkgdir}/usr/share/${_pkgname}
  install -d -m 750 ${pkgdir}/opt/${_pkgname}

  # launch scripts for this package
  install -m 750 ${srcdir}/${_pkgname}.launcher ${pkgdir}/opt/${_pkgname}/
  install -m 750 ${srcdir}/${_pkgname}-server.launcher ${pkgdir}/opt/${_pkgname}/

  # https://github.com/clover-moe/${_pkgname}.git
  install -m 750 ${srcdir}/${_pkgname}/build/release-linux-${_ARCH}/${_pkgname}_${_ARCH} ${pkgdir}/opt/${_pkgname}/${_pkgname}
  install -m 750 ${srcdir}/${_pkgname}/build/release-linux-${_ARCH}/${_pkgname}-server_${_ARCH} ${pkgdir}/opt/${_pkgname}/${_pkgname}-server
  install -m 640 ${srcdir}/${_pkgname}/build/release-linux-${_ARCH}/${_pkgname}-renderer-opengl1_${_ARCH}.so ${pkgdir}/opt/${_pkgname}/
  install -m 640 ${srcdir}/${_pkgname}/build/release-linux-${_ARCH}/${_pkgname}-renderer-opengl2_${_ARCH}.so ${pkgdir}/opt/${_pkgname}/

  # https://github.com/clover-moe/${_pkgname}/releases/download/release-${_upver}/${_pkgname}-${_upver}-data.tar.xz
  install -m 640 ${srcdir}/${_pkgname}-${_upver}-data/gamecontrollerdb.txt ${pkgdir}/opt/${_pkgname}/
  install -m 640 ${srcdir}/${_pkgname}-${_upver}-data/${_pkgname}-gamelist.txt ${pkgdir}/opt/${_pkgname}/
  install -D -m 644 ${srcdir}/${_pkgname}-${_upver}-data/LIBERATION_LICENSE.txt ${pkgdir}/usr/share/licenses/${_pkgname}/fonts.license.txt
  find ${srcdir}/${_pkgname}-${_upver}-data/ -maxdepth 1 -type f -name "*.txt" -exec install -m 644 '{}' ${pkgdir}/usr/share/doc/${_pkgname}/. \;
  for d in baseq3 missionpack missionpackoa tademo baseoa demoq3 fonts;
  do
    install -d -m 750 ${pkgdir}/opt/${_pkgname}/${d}
    install -m 640 ${srcdir}/${_pkgname}-${_upver}-data/${d}/* ${pkgdir}/opt/${_pkgname}/${d}/
  done

  # https://github.com/clover-moe/mint-arena.git
  for d in baseq3 missionpack missionpackoa tademo baseoa demoq3;
  do
    install -d -m 750 ${pkgdir}/opt/${_pkgname}/${d}
    install -d -m 750 ${pkgdir}/opt/${_pkgname}/${d}/vm

    # BUILD_GAME_SO=0 disabling building native libraries
    #install -m 640 ${srcdir}/mint-arena/build/release-linux-${_ARCH}/${d}/mint-game${_ARCH}.so ${pkgdir}/opt/${_pkgname}/${d}/
    #install -m 640 ${srcdir}/mint-arena/build/release-linux-${_ARCH}/${d}/mint-cgame${_ARCH}.so ${pkgdir}/opt/${_pkgname}/${d}/

    install -m 640 ${srcdir}/mint-arena/build/release-linux-${_ARCH}/${d}/vm/mint-game.qvm ${pkgdir}/opt/${_pkgname}/${d}/vm/
    install -m 640 ${srcdir}/mint-arena/build/release-linux-${_ARCH}/${d}/vm/mint-cgame.qvm ${pkgdir}/opt/${_pkgname}/${d}/vm/
  done

  cd ${pkgdir}/usr/bin
  ln -sf /opt/${_pkgname}/${_pkgname}.launcher ${_pkgname}
  ln -sf /opt/${_pkgname}/${_pkgname}-server.launcher ${_pkgname}-server

  install -D -m 644 ${srcdir}/${_pkgname}.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}.service
  install -D -m 644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  install -D -m 644 ${srcdir}/${_pkgname}/misc/${_pkgname}.svg ${pkgdir}/usr/share/pixmaps/${_pkgname}.svg

}
