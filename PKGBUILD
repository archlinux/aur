# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Thanks to Slash's ioquake3-git package (https://aur.archlinux.org/packages/ioquake3-git)
# for install files and desktop icon, and general (indirect) guidance (I owe you a beer!).
# Also thanks to the creator, Zack Middleton, who provided a lot of good input on packaging. I owe you a case!

pkgname=spearmint-git
_pkgname=spearmint
pkgver=r4735.b52f3cfe
_upver=r4627.232769ac
pkgrel=1
_ioq3v1='1.36'
_ioq3v2='1.32-9'
_upver='0.6'
pkgdesc="An ioquake3-based engine with multiple improvements (note: requires pak files from original Q3 CD; incompatible with ioquake3)"
url="http://${_pkgname}.pw"
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
source=("https://github.com/zturtleman/${_pkgname}/releases/download/release-${_upver}/${_pkgname}-${_upver}-data.tar.xz"
	"git+https://github.com/zturtleman/${_pkgname}.git"
	"${_pkgname}-engine::git+https://github.com/zturtleman/${_pkgname}.git"
	"${_pkgname}-game::git+https://github.com/zturtleman/mint-arena.git"
	"${_pkgname}-patch::git+https://github.com/zturtleman/${_pkgname}-patch-data.git"
	"http://ioquake3.org/files/${_ioq3v1}/data/ioquake3-q3a-${_ioq3v2}.run"
	"${_pkgname}.desktop"
	"${_pkgname}.service"
	"${_pkgname}.launcher"
	"${_pkgname}-server.launcher"
	"${_pkgname}-${_upver}-data.tar.xz.sig"
	"ioquake3-q3a-${_ioq3v2}.run.sig"
	"${_pkgname}.desktop.sig"
	"${_pkgname}.service.sig"
	"${_pkgname}.launcher.sig"
	"${_pkgname}-server.launcher.sig")
sha512sums=('008225a6bf6f4fa2acec7df05e43efc90ce17150d1cd4e00f1f5e96a3d4c5e9857ff855904fe8959da78f9ed8713bc108547e2b4a4ea6eb56923f727ead88998'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
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
            'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}-engine"
  (
     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
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
  cd ${srcdir}/${_pkgname}
  make

  cd ${srcdir}/${_pkgname}-game
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

  # stuff i wrote
  install -m 750 ${srcdir}/${_pkgname}.launcher ${pkgdir}/opt/${_pkgname}/
  install -m 750 ${srcdir}/${_pkgname}-server.launcher ${pkgdir}/opt/${_pkgname}/

  # https://github.com/zturtleman/${_pkgname}.git
  install -m 750 ${srcdir}/${_pkgname}/build/release-linux-${_ARCH}/${_pkgname}_${_ARCH} ${pkgdir}/opt/${_pkgname}/${_pkgname}
  install -m 750 ${srcdir}/${_pkgname}/build/release-linux-${_ARCH}/${_pkgname}-server_${_ARCH} ${pkgdir}/opt/${_pkgname}/${_pkgname}-server
  install -m 640 ${srcdir}/${_pkgname}/build/release-linux-${_ARCH}/${_pkgname}-renderer-opengl1_${_ARCH}.so ${pkgdir}/opt/${_pkgname}/
  install -m 640 ${srcdir}/${_pkgname}/build/release-linux-${_ARCH}/${_pkgname}-renderer-opengl2_${_ARCH}.so ${pkgdir}/opt/${_pkgname}/

  # https://github.com/zturtleman/${_pkgname}/releases/download/release-${_upver}/${_pkgname}-${_upver}-data.tar.xz
  install -m 640 ${srcdir}/${_pkgname}-${_upver}-data/gamecontrollerdb.txt ${pkgdir}/opt/${_pkgname}/
  install -m 640 ${srcdir}/${_pkgname}-patch/${_pkgname}-gamelist.txt ${pkgdir}/opt/${_pkgname}/
  install -D -m 644 ${srcdir}/${_pkgname}-patch/LIBERATION_LICENSE.txt ${pkgdir}/usr/share/licenses/${_pkgname}/fonts.license.txt
  find ${srcdir}/${_pkgname}-${_upver}-data/ -maxdepth 1 -type f -name "*.txt" -exec install -m 644 '{}' ${pkgdir}/usr/share/doc/${_pkgname}/. \;
  for d in baseq3 missionpack missionpackoa tademo baseoa demoq3 fonts;
  do
  	install -d -m 750 ${pkgdir}/opt/${_pkgname}/${d}
	install -m 640 ${srcdir}/${_pkgname}-${_upver}-data/${d}/* ${pkgdir}/opt/${_pkgname}/${d}/
  done

  # http://ioquake3.org/files/${_ioq3v1}/data/ioquake3-q3a-${_ioq3v2}.run
  for d in baseq3 missionpack;
  do
	install -m 640 ${srcdir}/q3a/${d}/pak?.pk3 ${pkgdir}/opt/${_pkgname}/${d}/
  done

  cd ${pkgdir}/usr/bin
  ln -sf /opt/${_pkgname}/${_pkgname}.launcher ${_pkgname}
  ln -sf /opt/${_pkgname}/${_pkgname}-server.launcher ${_pkgname}-server

  install -D -m 644 ${srcdir}/${_pkgname}.service ${pkgdir}/usr/lib/systemd/system/${_pkgname}.service
  install -D -m 644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # icon cleanup
  mkdir -p ${pkgdir}/usr/share/pixmaps/${pkgname}
  install -m 644 ${srcdir}/${_pkgname}-engine/misc/${_pkgname}_text.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  mv ${srcdir}/${_pkgname}-engine/misc/*.{svg,png} ${pkgdir}/usr/share/pixmaps/${pkgname}/.
  find ${pkgdir}/usr/share/${_pkgname}/ -type d -exec chmod 755 '{}' \;
  find ${pkgdir}/usr/share/${_pkgname}/ -type f -exec chmod 644 '{}' \;

}
