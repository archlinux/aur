# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Thanks to Slash's ioquake3-git package (https://aur.archlinux.org/packages/ioquake3-git)
# for install files and desktop icon, and general (indirect) guidance (I owe you a beer!).
# Also thanks to the creator, Zack Middleton, who provided a lot of good input on packaging. I owe you a case!

pkgname=spearmint-git
_pkgname=spearmint
pkgver=r4064.33b5758
pkgrel=7
_ioq3v1='1.36'
_ioq3v2='1.32-9'
_upver='0.2'  # upstream release- needed for some pk3's.

## What games do you want to build in support for?
## baseq3 should at the LEAST be enabled.
## See https://github.com/zturtleman/spearmint-patch-data.git
## and https://github.com/zturtleman/spearmint/wiki ("Engine Feature Support").
## "missionpack" is Q3:Team Arena
_games=("baseq3"
	"missionpack")

pkgdesc="An ioquake3-based engine with multiple improvements (note: requires pak files from original Q3 CD; incompatible with ioquake3)-git master:HEAD"
url="http://spearmint.pw"
license=("GPL3")
arch=('i686' 'x86_64')
depends=('sdl2')
optdepends=('curl: use native curl'
	    'openal: use native openal'
	    'mumble: support for positional audio (as alternative to in-game VOIP feature)')
makedepends=('sdl2')
conflicts=('spearmint')
provides=('spearmint')
install=spearmint.install
source=("upstream.tar.xz::https://github.com/zturtleman/${_pkgname}/releases/download/release-${_upver}/${_pkgname}-${_upver}-linux.tar.xz"
	"${_pkgname}-engine::git+https://github.com/zturtleman/spearmint.git"
	"${_pkgname}-game::git+https://github.com/zturtleman/mint-arena.git"
	"${_pkgname}-patch::git+https://github.com/zturtleman/spearmint-patch-data.git"
	"https://raw.githubusercontent.com/gabomdq/SDL_GameControllerDB/master/gamecontrollerdb.txt"
	"Makefile.local"
	"spearmint.desktop"
	"spearmint.service"
	"spearmint.launcher"
	"spearmint-server.launcher"
	"http://ioquake3.org/files/${_ioq3v1}/data/ioquake3-q3a-${_ioq3v2}.run"
	"Makefile.local.sig"
	"spearmint.desktop.sig"
	"spearmint.service.sig"
	"spearmint.launcher.sig"
	"spearmint-server.launcher.sig"
	"ioquake3-q3a-${_ioq3v2}.run.sig")
noextract=("upstream.tar.xz")
sha512sums=('53a3b3b2bb139b9e5ecbd12c5876048dd2b2cffab07acf2db5fd7697f5624af24d503539bfe4a9acf721fdb6886063ff24d848637781f6639550e79f4a1abd26'
            'SKIP'
            'SKIP'
            'SKIP'
            '950e7cd01fd272a7feed853f3bd9934ae050ccd1363d2d1d6a7fee78364ae697df9f4a1d98be949d8beb34afcb15de3908b267c1b19806cee996244ece7142fa'
            '2ca85a1fc28feaa0f7609d419f5ae81f830e9e9244bccfb8d881f1e44c6151af168bc5cc1e8ebcb1f212d345d34ea967b00763f682c35db720612b0b7162a522'
            '9e70a201f26265e29fb9ce2d198d943de8e12094b9d04b5e2fad630508787f036c0ee318604a2899ad4a74b4cef8ba3bffd1e7817de8bcbd512a6f80783aea1a'
            '84c60900e2db08e2e8dc39236d268fea392fcbc7cb51af051b5981301bfd5d6c10cafd29284096728048ed4b54baa580ee3f9824a2a1435ba42e91d644547cc0'
            '92fb1693b91fc7e7ba97612990369a0344b23dbdcfd0c3ecbfc5e7519f86caf9348b63e9a641f081ef8ba913fb1f50a4ca830a7107bc939be5c345e89223f640'
            '91b9af20e64223d7d7f21e7eb18cac168c9374409358e4e4d7ddad6576ceb68532d67ba82bc525833cd4ae4d8260ea44429299facbfb9186f72f16790f45a023'
            '2ff6eff394119697b1c0a76f9c6d70cec21f90aecd89b72f6459661d04821a799a9c70d80f390b2ae7822d5830e247033a79022cd6d3d1754f7780fadd2d418b'
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
  #( set -o pipefail
  #  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  #  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #)
  )
}

prepare() {

  if [[ "${CARCH}" == 'i686' ]];
  then
    _ARCH='x86'
    _MKARCH='i86pc'
  elif [[ "${CARCH}" == 'x86_64' ]];
  then
    _ARCH=${CARCH}
    _MKARCH='amd64'
  fi

  # soooo $pkgdir, if i recall correctly, isn't available in prepare(). which is kind of stoopit.
  # so i guess we cross our fingers.
  sed -i \
	-e "s@%%_MKARCH%%@${_MKARCH}@g" \
	-e "s@%%_ARCH%%@${_ARCH}@g" \
	-e "s@%%_SRCDIR%%@${pkgdir}@g" ${srcdir}/Makefile.local

  cp ${srcdir}/Makefile.local ${srcdir}/${_pkgname}-engine/.
  cp ${srcdir}/Makefile.local ${srcdir}/${_pkgname}-game/.
  mkdir -p ${srcdir}/${_pkgname}-{engine,game}/tmp

  ## Extra .pk3 files needed
  # Demo/ioq3
  cd ${srcdir}
  chmod 700 ioquake3-q3a-${_ioq3v2}.run
  install -d -m 750 ${srcdir}/${_pkgname}/{baseq3,missionpack}
  ./ioquake3-q3a-${_ioq3v2}.run --tar --wildcards -xO ./idpatch*.tar 2> /dev/null | tar -xC ${srcdir}/${_pkgname}/baseq3/. > /dev/null 2>&1  # i am ashamed to admit how long it took me to figure this out.
  ./ioquake3-q3a-${_ioq3v2}.run --tar --wildcards -xO ./idtapatch*.tar 2> /dev/null | tar -xC ${srcdir}/${_pkgname}/missionpack/. > /dev/null 2>&1
  # upstream
  cd ${srcdir}
  tar --strip-components=1 -C ${srcdir}/${_pkgname}/ --wildcards -xf upstream.tar.xz spearmint-*-linux/baseq3/* spearmint-*-linux/missionpack/*
  # done with these, let's save some disk space because these are big and a lot of people run makepkg in /tmp.
  rm -rf ${srcdir}/ioquake3-q3a-${_ioq3v2}.run ${srcdir}/upstream.tar.xz
}

build() {

  if [[ "${CARCH}" == 'i686' ]];
  then
    _ARCH='x86'
  elif [[ "${CARCH}" == 'x86_64' ]];
  then
    _ARCH=${CARCH}
  fi

  ## ENGINE ##
  cd ${srcdir}/${_pkgname}-engine
  make

  cd build/release-linux-${_ARCH}
  if [ ! -f "${_pkgname}-server" ];
  then
    if [[ "${CARCH}" == 'i686' ]];
    then
      rm -f ${_pkgname}{,-server}_x86_64
    elif [[ "${CARCH}" == 'x86_64' ]];
    then
      rm -rf ${_pkgname}{,-server}_x86
    fi
  fi


  ## GAME ##
  cd ${srcdir}/${_pkgname}-game
  make

  ## PATCH ##
  # does not require any building.

}

package() {
  if [[ "${CARCH}" == 'i686' ]];
  then
    _ARCH='x86'
  elif [[ "${CARCH}" == 'x86_64' ]];
  then
    _ARCH=${CARCH}
  fi

  ## Base dirs ##
  install -d -m 755 ${pkgdir}/usr/bin
  install -d -m 755 ${pkgdir}/usr/share/doc/${_pkgname}
  install -d -m 750 ${pkgdir}/opt/spearmint/{baseq3,missionpack}

  ## ENGINE ##
  install -m 750 ${srcdir}/${_pkgname}-engine/build/release-linux-${_ARCH}/${_pkgname}_${_ARCH} ${pkgdir}/opt/spearmint/${_pkgname}
  install -m 750 ${srcdir}/${_pkgname}-engine/build/release-linux-${_ARCH}/${_pkgname}-server_${_ARCH} ${pkgdir}/opt/spearmint/${_pkgname}-server
  install -m 750 ${srcdir}/${_pkgname}-engine/build/release-linux-${_ARCH}/mint-renderer-opengl1_${_ARCH}.so ${pkgdir}/opt/spearmint/
  install -m 750 ${srcdir}/${_pkgname}-engine/build/release-linux-${_ARCH}/mint-renderer-opengl2_${_ARCH}.so ${pkgdir}/opt/spearmint/
  # docs
  install -m 644 ${srcdir}/${_pkgname}-engine/id-readme.txt ${pkgdir}/usr/share/doc/${_pkgname}/
  install -m 644 ${srcdir}/${_pkgname}-engine/md4-readme.txt ${pkgdir}/usr/share/doc/${_pkgname}/
  install -m 644 ${srcdir}/${_pkgname}-engine/opengl2-readme.md ${pkgdir}/usr/share/doc/${_pkgname}/
  install -m 644 ${srcdir}/${_pkgname}-engine/README.md ${pkgdir}/usr/share/doc/${_pkgname}/README.engine
  install -m 644 ${srcdir}/${_pkgname}-engine/voip-readme.txt ${pkgdir}/usr/share/doc/${_pkgname}/
  # icons, etc.
  for i in ${srcdir}/${_pkgname}-engine/misc/*.{svg,png,ico};
  do
    install -D -m 644 ${i} ${pkgdir}/usr/share/pixmaps/$(basename ${i})
  done

  ## GAME ##
  cd ${srcdir}/${_pkgname}-game/build/release-linux-${_ARCH}
  # dirs
  for i in ${_games[@]};
  do
    install -d -m 750 ${pkgdir}/opt/${_pkgname}/${i}/vm
  done
  # files
  for g in ${_games[@]};
  do
    for f in $(find ${g} -type f -name "*.qvm");
    do
      install -m 640 ${f} ${pkgdir}/opt/${_pkgname}/${f}
    done
  done

  ## PATCH ##
  cd ${srcdir}/${_pkgname}-patch
  for g in ${_games[@]};
  do
    for i in $(find ${g} -type d);
    do
      install -d -m 750 ${pkgdir}/opt/spearmint/${i}
    done
    for i in $(find ${g} -type f);
    do
      # per upstream: these should be "loose", not zipped in a pk3. otherwise, version conflicts from clients and other nastiness.
      install -D -m 640 ${srcdir}/${_pkgname}-patch/${i} ${pkgdir}/opt/spearmint/${i}
    done
  done

  # PK3 PAKs from demo and upstream
  install -m 640 ${srcdir}/${_pkgname}/baseq3/* ${pkgdir}/opt/spearmint/baseq3/
  install -m 640 ${srcdir}/${_pkgname}/missionpack/* ${pkgdir}/opt/spearmint/missionpack/

  cd ${pkgdir}/usr/bin
  ln -sf /opt/spearmint/${_pkgname}.launcher ${_pkgname}
  ln -sf /opt/spearmint/${_pkgname}-server.launcher ${_pkgname}-server
  ln -sf /opt/spearmint/${_pkgname}.launcher spearmint 

  install -D -m 644 ${srcdir}/spearmint.service ${pkgdir}/usr/lib/systemd/system/spearmint.service
  install -D -m 644 ${srcdir}/spearmint.desktop ${pkgdir}/usr/share/applications/spearmint.desktop
  install -m 750 ${srcdir}/${_pkgname}.launcher ${pkgdir}/opt/spearmint/
  install -m 750 ${srcdir}/${_pkgname}-server.launcher ${pkgdir}/opt/spearmint/
  install -m 640 ${srcdir}/gamecontrollerdb.txt ${pkgdir}/opt/spearmint/

}
