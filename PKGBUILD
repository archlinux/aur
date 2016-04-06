# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Thanks to Slash's ioquake3-git package (https://aur.archlinux.org/packages/ioquake3-git)
# for install files and desktop icon, and general guidance (I owe you a beer!).

pkgname=spearmint-git
_pkgname=spearmint
pkgver=1
pkgrel=1
_ioq3v1='1.36'
_ioq3v2='1.32-9'

## What games do you want to build in support for?
## baseq3 should at the LEAST be enabled.
## See https://github.com/zturtleman/spearmint-patch-data.git
## and https://github.com/zturtleman/spearmint/wiki ("Engine Feature Support").
## "missionpack" is Q3:Team Arena
_games=("baseq3"
	"missionpack")

pkgdesc="An improved ioquake3-based Quake 3: Arena client (note: requires pak files from original CD) - Git master:HEAD"
url="http://spearmint.pw"
license=("GPL3")
arch=('i686' 'x86_64')
depends=('sdl2')
makedepends=('sdl2')
conflicts=('spearmint' 'quake3' 'ioquake3' 'ioquake3-git')
provides=('quake3' 'ioquake3' 'spearmint' 'ioquake3-git')
install=spearmint.install
source=("${_pkgname}-engine::git+https://github.com/zturtleman/spearmint.git"
	"${_pkgname}-game::git+https://github.com/zturtleman/mint-arena.git"
	"${_pkgname}-patch::git+https://github.com/zturtleman/spearmint-patch-data.git"
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
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '7a5db71f2c9d8630f9cfbe8f345e076344e05791f5ef47f7c2abc232f0c5b4c3d344dba7c4b7defd94e88d1bc77ef55c68c89b53480c61e688cb410f5a1c6d4c'
            '0c192c23cc180181f5edee12cd085e78f0cdd2d6e8f18dbd27532b76c36f2b0e731b764119a0a44df90411f94d3b7475bd40ae0d9b8f5bb3867442f93172746b'
            'fd75d6633015057c49fdb1cd29dfa16b8b30fd49df2deb0bbbb9da1a5e84179672ee7fee5df6dc57b0e4b6931ab5200f9e6ada5127e57aec5bf29b3e1b020073'
            '894a0b07399ea7fcf60c97516e5cf19740693192e896e687fba0aeedee675684d94968e69dc927bdb4a44b4298c82d5b4bdca0cc86e707c21cb44f4f9876aea9'
            'c7611bf35ace821dcf5829e729c1b0e2f2cc858f2e8ffb491c94990b72990148a8700c1797d715ee2002b3acc10c599d69fa6bc0059c0f9117f64707b6745445'
            '2ff6eff394119697b1c0a76f9c6d70cec21f90aecd89b72f6459661d04821a799a9c70d80f390b2ae7822d5830e247033a79022cd6d3d1754f7780fadd2d418b'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

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
  mkdir ${srcdir}/${_pkgname}-engine/tmp
  mkdir ${srcdir}/${_pkgname}-game/tmp

  cd ${srcdir}
  mkdir paks
  chmod 700 ioquake3-q3a-${_ioq3v2}.run
  ./ioquake3-q3a-${_ioq3v2}.run --tar xfC ${srcdir}/paks/.
  install -d -m 750 ${srcdir}/${_pkgname}/{baseq3,missionpack}
  tar -C ${srcdir}/${_pkgname}/baseq3 -xf ${srcdir}/paks/idpatchpk3s.tar
  tar -C ${srcdir}/${_pkgname}/missionpack -xf ${srcdir}/paks/idtapatchpk3s.tar
  cd ${srcdir}
  # don't need this anymore.
  rm -rf ${srcdir}/paks

  
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
  install -d -m 750 ${pkgdir}/opt/quake3/{baseq3,missionpack,settings}

  ## ENGINE ##
  install -m 750 ${srcdir}/${_pkgname}-engine/build/release-linux-${_ARCH}/${_pkgname}_${_ARCH} ${pkgdir}/opt/quake3/${_pkgname}
  install -m 750 ${srcdir}/${_pkgname}-engine/build/release-linux-${_ARCH}/${_pkgname}-server_${_ARCH} ${pkgdir}/opt/quake3/${_pkgname}-server
  install -m 750 ${srcdir}/${_pkgname}-engine/build/release-linux-${_ARCH}/mint-renderer-opengl1_${_ARCH}.so ${pkgdir}/opt/quake3/
  install -m 750 ${srcdir}/${_pkgname}-engine/build/release-linux-${_ARCH}/mint-renderer-opengl2_${_ARCH}.so ${pkgdir}/opt/quake3/
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
  for i in tools/{lburg,cpp,rcc,etc,asm} baseq3/{,vm,common,ui,game,cgame} missionpack/{,vm,qcommon,q3ui,ui,game,cgame};
  do
    install -d -m 750 ${pkgdir}/opt/quake3/${i}
  done
  for i in baseq3 tools missionpack;
  do
    for f in $(find ${i} -type f);
    do
      install -D -m 640 ${f} ${pkgdir}/opt/quake3/${f}
    done
    for x in $(find ${i} -type f -executable);
    do
      chmod 750 ${pkgdir}/opt/quake3/${x}
    done
  done

  ## PATCH ##
  cd ${srcdir}/${_pkgname}-patch
  for g in ${_games};
  do
    for i in $(find ${g} -type d);
    do
      install -d -m 750 ${pkgdir}/opt/quake3/${i}
    done
    for i in $(find ${g} -type f);
    do
      # TODO: should this be in .pk3 (zip) format?
      install -D -m 640 ${srcdir}/${_pkgname}-patch/${i} ${pkgdir}/opt/quake3/${i}
    done
  done

  # PK3 PAKs from demo
  install -m 640 ${srcdir}/${_pkgname}/baseq3/* ${pkgdir}/opt/quake3/baseq3/
  install -m 640 ${srcdir}/${_pkgname}/missionpack/* ${pkgdir}/opt/quake3/missionpack/
  if [[ -d "${srcdir}/${_pkgname}/settings}" ]];
  then
    install -m 640 ${srcdir}/${_pkgname}/settings/* ${pkgdir}/opt/quake3/settings/
  else
    install -d -m 750 ${pkgdir}/opt/quake3/settings
  fi

  cd ${pkgdir}/usr/bin
  ln -sf /opt/quake3/${_pkgname}.launcher ${_pkgname}
  ln -sf /opt/quake3/${_pkgname}-server.launcher ${_pkgname}-server
  ln -sf /opt/quake3/${_pkgname}.launcher quake3 
  ln -sf /opt/quake3/${_pkgname}-server.launcher q3ded 
  ln -sf /opt/quake3/${_pkgname}.launcher ioquake3
  ln -sf /opt/quake3${_pkgname}-server.launcher ioq3ded
  cd ${pkgdir}/opt/quake3
  ln -sf ${_pkgname} ioquake3
  ln -sf ${_pkgname}-server ioq3ded

  install -D -m 644 ${srcdir}/spearmint.service ${pkgdir}/usr/lib/systemd/system/spearmint.service
  install -D -m 644 ${srcdir}/spearmint.desktop ${pkgdir}/usr/share/applications/spearmint.desktop
  install -m 750 ${srcdir}/${_pkgname}.launcher ${pkgdir}/opt/quake3/
  install -m 750 ${srcdir}/${_pkgname}-server.launcher ${pkgdir}/opt/quake3/

}
