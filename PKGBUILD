# Maintainer: zturtleman <zturtleman[at]gmail[dot]com>
# Contributors: sanerb (AUR)
# Thanks to ioquake3-git package contributors (https://aur.archlinux.org/packages/ioquake3-git)
# for general (indirect) guidance.

pkgname=spearmint
pkgver=1.0.3
pkgrel=2
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
source=("git+https://github.com/clover-moe/${pkgname}.git"
	"https://github.com/clover-moe/${pkgname}/releases/download/release-${pkgver}/${pkgname}-${pkgver}-data.tar.xz"
	"${pkgname}.desktop"
	"${pkgname}.service"
	"${pkgname}.launcher"
	"${pkgname}-server.launcher"
	"spearmint-fix-crash.patch"
	)
sha512sums=('SKIP'
            'ca35816efc68bd045919044b87eaa4c1486d7bd3d809725c009852f0f4f58fbd8085ab86316a5b53dbdca68317d5822d0dfad5a05b90dea77ed45177258a12c1'
            '9e70a201f26265e29fb9ce2d198d943de8e12094b9d04b5e2fad630508787f036c0ee318604a2899ad4a74b4cef8ba3bffd1e7817de8bcbd512a6f80783aea1a'
            '84c60900e2db08e2e8dc39236d268fea392fcbc7cb51af051b5981301bfd5d6c10cafd29284096728048ed4b54baa580ee3f9824a2a1435ba42e91d644547cc0'
            '0ab0b8ee4b5c1952b098a99c58073623c9001a8fe4cb135b6795050b27f3fbf4713a0309135ad6d7b2c3bf2e15f3aaedf71b9b0ba3b6c01bd93e9cdbb6ff2b0d'
            'a30de6726c5b797e8f1dbc49487a1ca29ddabf5ba2eb42665c68a4d2033d284dd2ab3817c84cabdb4152e4e43162f6b7dd072c05514fb2f3c284505127b01fd7'
            '44a28e0b84cd7148387afb6f3b6e7757331f8446fa3ef449a1adc343ccdfd4ae173a21c40a8d0987a79c9f4cf13149bad48d0ee35c20aa31b9ed2947ace9c0be'
            )

prepare() {
  cd ${srcdir}/${pkgname}
  git checkout release-${pkgver}
  patch -Np1 -i ../spearmint-fix-crash.patch
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

  # launch scripts for this package
  install -m 750 ${srcdir}/${pkgname}.launcher ${pkgdir}/opt/${pkgname}/
  install -m 750 ${srcdir}/${pkgname}-server.launcher ${pkgdir}/opt/${pkgname}/

  # https://github.com/clover-moe/${pkgname}.git
  install -m 750 ${srcdir}/${pkgname}/build/release-linux-${_ARCH}/${pkgname}_${_ARCH} ${pkgdir}/opt/${pkgname}/${pkgname}
  install -m 750 ${srcdir}/${pkgname}/build/release-linux-${_ARCH}/${pkgname}-server_${_ARCH} ${pkgdir}/opt/${pkgname}/${pkgname}-server
  install -m 640 ${srcdir}/${pkgname}/build/release-linux-${_ARCH}/${pkgname}-renderer-opengl1_${_ARCH}.so ${pkgdir}/opt/${pkgname}/
  install -m 640 ${srcdir}/${pkgname}/build/release-linux-${_ARCH}/${pkgname}-renderer-opengl2_${_ARCH}.so ${pkgdir}/opt/${pkgname}/

  # https://github.com/clover-moe/${pkgname}/releases/download/release-${pkgver}/${pkgname}-${pkgver}-data.tar.xz
  install -m 640 ${srcdir}/${pkgname}-${pkgver}-data/gamecontrollerdb.txt ${pkgdir}/opt/${pkgname}/
  install -m 640 ${srcdir}/${pkgname}-${pkgver}-data/${pkgname}-gamelist.txt ${pkgdir}/opt/${pkgname}/
  install -D -m 644 ${srcdir}/${pkgname}-${pkgver}-data/LIBERATION_LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/fonts.license.txt
  find ${srcdir}/${pkgname}-${pkgver}-data/ -maxdepth 1 -type f -name "*.txt" -exec install -m 644 '{}' ${pkgdir}/usr/share/doc/${pkgname}/. \;
  for d in baseq3 missionpack missionpackoa tademo baseoa demoq3 fonts;
  do
  	install -d -m 750 ${pkgdir}/opt/${pkgname}/${d}
	install -m 640 ${srcdir}/${pkgname}-${pkgver}-data/${d}/* ${pkgdir}/opt/${pkgname}/${d}/
  done

  cd ${pkgdir}/usr/bin
  ln -sf /opt/${pkgname}/${pkgname}.launcher ${pkgname}
  ln -sf /opt/${pkgname}/${pkgname}-server.launcher ${pkgname}-server

  install -D -m 644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  install -D -m 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

  install -D -m 644 ${srcdir}/${pkgname}/misc/${pkgname}.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg

}
