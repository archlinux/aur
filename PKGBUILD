# Maintainer: Que Quotion ( quequotion@bugmenot.com )
# Contributor: bartus ( aur\at\bartus.33mail.com )

pkgname=makepkg-optimize
pkgver=6
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
_buildenv=({pgo,lto,graphite}.sh.in)
_executable=({upx,optipng,svgo}-exec.sh.in)
_tidy=({upx,optipng,svgo}.sh.in)
_conf=({{c,cxx,make,ld,debug-make,cmake-}flags,{buildenv,destdirs,pkgopts{,-param}}_ext,compress-param_max}.conf)
source=(${_buildenv[@]}
        ${_executable[@]}
        ${_tidy[@]}
        ${_conf[@]}
        )
sha1sums=('da515153d456ed53f6744c3ce4e6dd9a9ea3b892'
          '2c993f086adc635e15313b45008cfe6d56c79cdc'
          '6b719a47146aedae186a7e63b6058507c4948d9f'
          'a079a302708342cc0549f56e2b5e17f483fbbbd1'
          '62bebfa9c71aea4107598d065e91e1ab8b6c43bc'
          '9c27d5cef8a12385b385b64e65fce39244e1be4b'
          'd6c364bac3be28a39ba9d902e8492acd35fbee13'
          '1a815037390c67195ed831b7887884a42785010a'
          'cff1d2b6e81226de7ece5369005c392fa8083bf2'
          'f7da4e29ea24c85870ff0e55864f7bafbce7ad8f'
          '83a6d62b19184cac1de02c957cd4ea7bbdac9ddb'
          'dea4d727d81ac040846555e59ac7c34eb0978233'
          '202d11e49a611bb400029512cf159a0f8645a6db'
          '2e2cd8c680a86518652543fda9092bf2ab594660'
          '981eab856abb43c5e093620cdf4d8bfa2d690805'
          'a2d4cc385d2395ec35094f63dc17847e73bbd565'
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
  install -m755 -D -t ${pkgdir}/usr/share/makepkg/buildenv/ ${_buildenv[@]%.in}

  # Executable finding scripts
  install -m755 -D -t ${pkgdir}/usr/share/makepkg/executable/ ${_executable[@]%.in}

  # Supplemental Tidy scripts
  install -m755 -D -t ${pkgdir}/usr/share/makepkg/tidy/ ${_tidy[@]%.in}

  # Separate config file
  install -m644 -D -t ${pkgdir}/etc/ makepkg-optimize.conf
}
