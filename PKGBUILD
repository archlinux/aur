# Maintainer: Guillaume Dolle  <dev at gdolle.com>
pkgname=spack
pkgver=0.14.1
pkgrel=1
pkgdesc="A flexible package manager for supercomputer that supports multiple versions, configurations, platforms, and compilers."
arch=('i686' 'x86_64')
url="https://spack.io/"
license=('MIT')
depends=('python' 'polkit')
optdepends=( 'env-modules-tcl' 'lmod' ) 
source=(https://github.com/spack/spack/archive/v${pkgver}.tar.gz
        spack.sysusers
        spack.tmpfiles
        spack.pkaction
        spack.pkrules
        spack.sh
        spack.csh
        spack.binsh)
sha256sums=('10968bc77c9e1e27d69dea6d1c7f1ea754d6a871ad34a13988dd57cfd9a457e4'
    'e6d46e8f5140b4e86596d38f23af379d9adce8e9afc66f800571d7a4d9211e19'
    '1d0a241779d3d165ddf7c1350091eb96c6dec7cf1fa6141485585f4b72c968ea'
    'c9d79463721f5006ae6129e175ca8038bb13b9beb9b584a890662110fcf0579a'
    '7f593b7f9289972ae83ad11e0dd3281faf1c56bffa0428dd69641b36b8b94356'
    '163202be92788f98283d1b0b7c365d736a1675b16ef91f27d2a58617f17030f7'
    '7fb67101a9095a05006862e478cedf1a5771725ae2c8420c248e1ad5d3b504e2'
    'a82a14f51519f8f3ea594845e5f9bf61988f3ba79d55099409acd7730debb6a0')
_spackroot=/opt/spack
_spackcfg=etc/spack/defaults/config.yaml

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i "s/install_tree:.*/install_tree: \/var\/lib\/spack\/packages/g" ${_spackcfg}
  sed -i "s/source_cache:.*/source_cache: \/var\/lib\/spack\/cache\/source/g" ${_spackcfg}
  sed -i "s/misc_cache:.*/misc_cache: \/var\/lib\/spack\/cache\/misc/g" ${_spackcfg}
  sed -i "s/tcl:.*/tcl: \/var\/lib\/spack\/modules\/tcl/g" ${_spackcfg}
  sed -i "s/lmod:.*/lmod: \/var\/lib\/spack\/modules\/lmod/g" ${_spackcfg}
  sed -i "s/dotkit:.*/dotkit: \/var\/lib\/spack\/modules\/dotkit/g" ${_spackcfg}
  sed -i "s/\$spack\/var\/spack\/stage/\/var\/lib\/spack\/stage/g" ${_spackcfg}
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/${_spackroot}/
  mkdir -p ${pkgdir}/${_spackroot}/libexec/
  mkdir -p ${pkgdir}/${_spackroot}/bin/
  cp -dr --no-preserve=ownership share ${pkgdir}/${_spackroot}
  cp -dr --no-preserve=ownership lib ${pkgdir}/${_spackroot}
  cp -dr --no-preserve=ownership bin/* ${pkgdir}/${_spackroot}/libexec
  cp -dr --no-preserve=ownership etc ${pkgdir}/${_spackroot}
  cp -dr --no-preserve=ownership var ${pkgdir}/${_spackroot}
  find ./* -maxdepth 0 -type f \( ! -name ".*" \) -exec install -Dm 644 "{}" "${pkgdir}/${_spackroot}/{}" \;

  cd ${srcdir}
  install -Dm 644  ${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh
  install -Dm 644  ${pkgname}.csh ${pkgdir}/etc/profile.d/${pkgname}.csh

  install -Dm 644 ${pkgname}.sysusers ${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm 644 ${pkgname}.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf

  install -Dm 644 ${pkgname}.pkrules ${pkgdir}/usr/share/polkit-1/rules.d/${pkgname}.rules
  install -Dm 644 ${pkgname}.pkaction ${pkgdir}/usr/share/polkit-1/actions/org.archlinux.pkexec.spack.policy
  # Fix mode to match polkit.
  install -d -o root -g 102 -m 750 ${pkgdir}/usr/share/polkit-1/rules.d
  
  # Script using polkit.
  install -Dm 755 ${pkgname}.binsh ${pkgdir}/${_spackroot}/bin/${pkgname}
}

