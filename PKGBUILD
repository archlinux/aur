# Maintainer: ptr1337 (ptr1337@cachyos.org)
# Contributor: Que Quotion ( quequotion@bugmenot.com )
# Contributor: bartus ( aur\at\bartus.33mail.com )

pkgname=makepkg-optimize-mold
pkgver=27
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
            "polly: Polyhedral model optimization for clang"
            "mold: a modern fast linker"
            "lld: the clang linker"
            "llvm-bolt: use yourself bolted toolchain for compiling"
            "aocc: use amd's llvm compiler for compiling"
            "aocl: use amd's compiler libary for compiling"
            "buildcache: a alternative to ccache")
backup=(etc/makepkg-optimize.conf)
_buildenv=({pgo,graphite,rice,mold,bolt,buildcache,lld,aocc,relocs}.sh.in)
_executable=({upx,optipng,svgo}-exec.sh.in)
_tidy=({upx,optipng,svgo}.sh.in)
_conf=({{c,cxx,make,ld,cmake-}flags,{buildenv,destdirs,pkgopts{,-param}}_ext,compress-param_max}.conf)
source=(${_buildenv[@]}
        ${_executable[@]}
        ${_tidy[@]}
        ${_conf[@]})
sha1sums=('4c5f0be71638a6ec2f18c01675d99f19eb6dd45d'
          '996ed46bddb2898bc8d4a26c019df62721acfea3'
          '14cb27e5e45dacf8e59cfb498235036716393014'
          'd67cd4d15c2f011f7b478c645db70afc5d72dc70'
          '1adc3bb98e67336db63fd39baf4daab606870d57'
          '22aeaf0766c4de926633f93bfa9aa2ab64bc50f3'
          '69beb2d05cf850fcbf8a1127a450424a855ab517'
          '64ffc9141af0e2c44d327e019c8d4d4a09585259'
          '5a5bc8d8d317ff35b8a26e645bb78e2dbc69a16e'
          'a893c32f2a3fff8b279025ec60f0c3d88143dc1e'
          '9270b5e33d4508a959688a10c20dec3732763937'
          '34a33b47a8b667f9dc810737c0f598660b962d4c'
          '4def44ef53ba3b579bed40af897d6f0c038ec78d'
          '0022423564ed30dfe91bb3faa7f0c03ddcf4f25f'
          'fbd6ee512b6486320d41a007b9670dcf5a3430b6'
          '55170acd48805465d6b0c45b3a29eee2a2523de8'
          '4cd8012f8946761d7288a198af7edb3ebaf0ece0'
          'df4dea649b6ca775dbd4fa8590fa285517710429'
          'c64344daf52acf5efa20b1b74facea448b3edf21'
          '981eab856abb43c5e093620cdf4d8bfa2d690805'
          'ec44d7d20cb8f576dc263e29d5ea20e906e0a80f'
          'efb3ed7d7d5516259709149d7bcd6ec208c07593'
          '1fc8035e64b739e20c70fbb4eaa5cb7aa1c63c90'
          '5d0cde13b50641371e4ec4d813d6b2dfae493889'
          '8f54d9798899123aa28085ce74ae9dd34b84c075')

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
