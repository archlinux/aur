# Maintainer: Que Quotion ( quequotion@bugmenot.com )
# Contributor: bartus ( aur\at\bartus.33mail.com )

pkgname=makepkg-optimize
pkgver=12
pkgrel=1
pkgdesc='Supplemental build and packaging optimizations for makepkg'
arch=('any')
license=('GPL')
url='https://wiki.archlinux.org/index.php/Makepkg-optimize'
conflicts=(makepkg-optimize{,2} pacman-buildenv_ext-git)
replaces=('makepkg-optimize2' pacman-buildenv_ext-git)
depends=('pacman-git')
optdepends=('upx' 'optipng' 'nodejs-svgo')
backup=(etc/makepkg-optimize.conf)
_buildenv=({pgo,ZZ-lto,graphite,rice}.sh.in)
_executable=({upx,optipng,svgo}-exec.sh.in)
_tidy=({upx,optipng,svgo}.sh.in)
_conf=({{c,cxx,make,ld,debug-make,cmake-}flags,{buildenv,destdirs,pkgopts{,-param}}_ext,compress-param_max}.conf)
source=(${_buildenv[@]}
        ${_executable[@]}
        ${_tidy[@]}
        ${_conf[@]})
sha1sums=('dae91a563dd767f3e3059240009b40106aadbc35'
          '7a0118bc4fef1e136211a8b28af731344df30f67'
          '17b601c832b4af263d6ebdc894ee3ef59f9ee8b4'
          '891c616c4f2414c503ea88ed60242e67677d88da'
          'a893c32f2a3fff8b279025ec60f0c3d88143dc1e'
          '9270b5e33d4508a959688a10c20dec3732763937'
          '34a33b47a8b667f9dc810737c0f598660b962d4c'
          '68292bac87e22885069330dbdc198e13be88ab95'
          '5801de7cd6e2bd462b7e051aa3aa818a30dc7af5'
          '368342c7891345bdbcc4c21e79aa4840ab5b76b9'
          'f7da4e29ea24c85870ff0e55864f7bafbce7ad8f'
          '83a6d62b19184cac1de02c957cd4ea7bbdac9ddb'
          'dea4d727d81ac040846555e59ac7c34eb0978233'
          '202d11e49a611bb400029512cf159a0f8645a6db'
          '2e2cd8c680a86518652543fda9092bf2ab594660'
          '981eab856abb43c5e093620cdf4d8bfa2d690805'
          '8775a34738b8c19238bcedd41180bf113049ed41'
          '357102cec0aa56d74955bbf66ae694db74627dab'
          '1fc8035e64b739e20c70fbb4eaa5cb7aa1c63c90'
          '5d0cde13b50641371e4ec4d813d6b2dfae493889'
          'f5fe14a39dd4fe2117bf764d67cf2609ca48229b')

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
  sed -i "/^COMPRESSZ=/r compress-param_max.conf" makepkg-optimize.conf
}

package() {
  # BUILDENV extension scripts
  install -m644 -D -t ${pkgdir}/usr/share/makepkg/buildenv/ ${_buildenv[@]%.in}

  # Executable finding scripts
  install -m644 -D -t ${pkgdir}/usr/share/makepkg/executable/ ${_executable[@]//-exec.sh.in/.sh}

  # Supplemental Tidy scripts
  install -m644 -D -t ${pkgdir}/usr/share/makepkg/tidy/ ${_tidy[@]%.in}

  # Separate config file
  install -m644 -D -t ${pkgdir}/etc/ makepkg-optimize.conf
}
