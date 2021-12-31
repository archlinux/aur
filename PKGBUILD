# Maintainer: ptr1337 (ptr1337@cachyos.org)
# Contributor: Que Quotion ( quequotion@bugmenot.com )
# Contributor: bartus ( aur\at\bartus.33mail.com )

pkgname=makepkg-optimize
pkgver=19
pkgrel=1
pkgdesc='Supplemental build and packaging optimizations for makepkg'
arch=('any')
license=('GPL')
url='https://wiki.archlinux.org/index.php/Makepkg-optimize'
depends=('pacman')
optdepends=("upx: Compress executables"
            "optipng: Optimize PNG files"
            "svgo: Optimize SVG files"
            "openmp: Parallelize loops"
            "mold: a modern fast linker")
backup=(etc/makepkg-optimize.conf)
_buildenv=({pgo,ZZ-lto,graphite,rice,mold}.sh.in)
_executable=({upx,optipng,svgo}-exec.sh.in)
_tidy=({upx,optipng,svgo}.sh.in)
_conf=({{c,cxx,make,ld,debug-make,cmake-}flags,{buildenv,destdirs,pkgopts{,-param}}_ext,compress-param_max}.conf)
source=(${_buildenv[@]}
        ${_executable[@]}
        ${_tidy[@]}
        ${_conf[@]})
sha1sums=('4c5f0be71638a6ec2f18c01675d99f19eb6dd45d'
          '8a29f5b36fd191f5ca061625f006dfe822148281'
          'd7a3801037333c582dba976db27cf8896bc1b401'
          '3a356f52131e39f59d360c54a572d678c7208b42'
          '9ea51e4cade43db60a43ebc7f41bdb19f881c94b'
          'a893c32f2a3fff8b279025ec60f0c3d88143dc1e'
          '9270b5e33d4508a959688a10c20dec3732763937'
          '34a33b47a8b667f9dc810737c0f598660b962d4c'
          '4def44ef53ba3b579bed40af897d6f0c038ec78d'
          '2efb74a7743764205d20e0dd74fb5f948673f825'
          '0dbba257ec59dc55583a74da0319d6c210cf717a'
          '1a4f26170da04998f9cba088a63a95fd75c1113e'
          '386cb4a2c52247bdd1b4a2cd2f804fa8bc8b0b4e'
          '9cb1a46ca7c3c6fab8a44ca5355528e9eb9e0650'
          'f17b1a8ccbd807fd59fbc716cc695be32e261e38'
          '3c61762a183a2f76cc2ff2e55cfffb68b6a8320c'
          '981eab856abb43c5e093620cdf4d8bfa2d690805'
          '02b26a3abf1102fb9d1c746575b570265b10f11d'
          'efb3ed7d7d5516259709149d7bcd6ec208c07593'
          '1fc8035e64b739e20c70fbb4eaa5cb7aa1c63c90'
          '5d0cde13b50641371e4ec4d813d6b2dfae493889'
          '67801619b39ea4542829a4b715034a9f7ac7cf2c')

prepare() {
  # Use the current makepkg config as a base
  cp /etc/makepkg.conf ./makepkg-optimize.conf

  # How to check for the unlikely possiblity that the directory was changed?
  sed -i "s|@libmakepkgdir@|/usr/share/makepkg|g"  *.sh.in
  for file in *.sh.in; do mv $file ${file%.in}; done

  #Extra ricer and debugging CFLAGS
  sed -i "/^CFLAGS/r cflags.conf" makepkg-optimize.conf

  #Mirror CFLAGS into CXXFLAGS
  sed -i "/^CXXFLAGS/r cxxflags.conf" makepkg-optimize.conf

  #Extra ricer Makeflags
  sed -i "/^MAKEFLAGS/r makeflags.conf" makepkg-optimize.conf

  #Extra ricer LDFLAGS
  sed -i "/^LDFLAGS/r ldflags.conf" makepkg-optimize.conf

  #Debugging flags for make (note, DEBUG_MAKEFLAGS isn't a real thing)
  sed -i "/^DEBUG_CXXFLAGS/r debug-makeflags.conf" makepkg-optimize.conf

  #Cmake is a build obfuscation system
  sed -i "/^#DEBUG_MAKEFLAGS/r cmake-flags.conf" makepkg-optimize.conf

  #Additional BUIDENV macros
  sed -i "/^#-- sign/r buildenv_ext.conf" makepkg-optimize.conf

  #Additional DEST directories
  sed -i "/^#*SRCPKGDEST=/r destdirs_ext.conf" makepkg-optimize.conf

  #Additional OPTIONS macros
  sed -i "/^#-- debug/r pkgopts_ext.conf" makepkg-optimize.conf

  #Additional OPTIONS parameters
  sed -i "/^#*PURGE_TARGETS=/r pkgopts-param_ext.conf" makepkg-optimize.conf

  #Maximum COMPRESS parameters
  sed -i "/^COMPRESSLZ=/r compress-param_max.conf" makepkg-optimize.conf
}

package() {
  # BUILDENV extension scripts
  install -m644 -D -t ${pkgdir}/usr/share/makepkg/buildenv/ ${_buildenv[@]%.in}

  # Executable finding scripts
  for i in ${_executable[@]%.in}; do
    install -m644 -D -T ${i} ${pkgdir}/usr/share/makepkg/executable/${i//-exec.sh/.sh}; done

  # Supplemental Tidy scripts
  install -m644 -D -t ${pkgdir}/usr/share/makepkg/tidy/ ${_tidy[@]%.in}

  # Separate config file
  install -m644 -D -t ${pkgdir}/etc/ makepkg-optimize.conf
}
