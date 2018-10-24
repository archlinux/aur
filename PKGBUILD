# Maintainer: Que Quotion ( quequotion@bugmenot.com )
# Contributor: bartus ( aur\at\bartus.33mail.com )

pkgname=makepkg-optimize
pkgver=2
pkgrel=2
pkgdesc='Supplemental build and packaging optimizations for makepkg'
arch=('any')
license=('GPL')
url='https://wiki.archlinux.org/index.php/Makepkg-optimize'
conflicts=(makepkg-optimize{,2})
replaces=('makepkg-optimize2')
depends=('pacman-buildenv_ext-git')
optdepends=('upx' 'optipng' 'nodejs-svgo' 'graphite')
backup=(etc/makepkg-optimize.conf)
_buildenv_ext=({pgo,lto,graphite}.sh.in)
_tidy=({upx,optipng,svgo}.sh.in)
_conf=({{c,cxx,make,ld,debug-make,cmake-}flags,{buildenv,destdirs,pkgopts{,-param}}_ext,compress-param_max}.conf)
source=(${_buildenv_ext[@]}
        ${_tidy[@]}
        ${_conf[@]}
        )
sha1sums=('108b124167751bc975cc1bce5a2905956ed5c65b'
          'a95642b0b45d3c2f0b665806e016a52f9880195f'
          '0726a57eeb0c08bc4ba50b28ee5ea3b5e6dbd156'
          '0420fde975c623f788726a41da2c1311e625472f'
          '261dfa6707cc12159f99a567617f7183426dbaa3'
          'be019624f503380130994503b5169836edb83a35'
          '0999f5246a10235e886eff0977582dfed43ad30c'
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

  #Debugging flags for make
  sed -i "/^DEBUG_CXXFLAGS/r debug-makeflags.conf" makepkg-optimize.conf

  #CMAKE IS A BUILD OBFUSCATION SYSTEM
  sed -i "/^#DEBUG_MAKEFLAGS/r cmake-flags.conf" makepkg-optimize.conf

  #Additional BUIDENV options
  sed -i "/^#-- sign/r buildenv_ext.conf" makepkg-optimize.conf

  #Additional ~~DEST directories
  sed -i "/^#*SRCPKGDEST=/r destdirs_ext.conf" makepkg-optimize.conf

  #Additional OPTIONS options
  sed -i "/^#-- debug/r pkgopts_ext.conf" makepkg-optimize.conf

  #Additional OPTIONS options parameters
  sed -i "/^#*PURGE_TARGETS=/r pkgopts-param_ext.conf" makepkg-optimize.conf

  #Maximum COMPRESS~~ parameters
  sed -i "/^COMPRESSZ=/r compress-param_max.conf" makepkg-optimize.conf
}

package() {
  # BUILDENV extension scripts
  install -m755 -D -t ${pkgdir}/usr/share/makepkg/buildenv_ext/ ${_buildenv_ext[@]%.in}

  # Supplemental Tidy scripts
  install -m755 -D -t ${pkgdir}/usr/share/makepkg/tidy/ ${_tidy[@]%.in}

  # Separate config file
  install -m644 -D -t ${pkgdir}/etc/ makepkg-optimize.conf
}
