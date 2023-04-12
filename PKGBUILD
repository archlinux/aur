# Maintainer: Nicolas Derumigny nderumigny <at> gmail <dot> com
pkgname=spack
pkgver=0.19.2
pkgrel=1
pkgdesc="A flexible package manager for supercomputer that supports multiple versions, configurations, platforms, and compilers."
arch=('i686' 'x86_64')
url="https://spack.io/"
license=('MIT')
depends=('python' 'polkit')
optdepends=( 'env-modules-tcl' 'lmod' )
source=(
        spack-${pkgver}.tar.gz::https://github.com/spack/spack/archive/v${pkgver}.tar.gz
        spack.sysusers
        spack.tmpfiles
        spack.pkaction
        spack.pkrules
        spack.sh
        spack.csh
        spack.bin.py
        spack.env.sh.patch
      )
sha256sums=(
        '4978b37da50f5690f4e1aa0cfe3975a89ccef85d96c68d417ea0716a8ce3aa98'
        'e6d46e8f5140b4e86596d38f23af379d9adce8e9afc66f800571d7a4d9211e19'
        'db0cc4a4ab32e6ee2e5c32898c69a0f0ce05b4e3c605beb024b5463c46e3710f'
        '1f2c4c6b8841d927fa4056206b8e5603719c0d829586ff0937efaa935d054376'
        '7f593b7f9289972ae83ad11e0dd3281faf1c56bffa0428dd69641b36b8b94356'
        '0bddb0a0f1d470509f44c3031041ab0de5472de84f58c90d4b6c91e6782cb6a2'
        '7b427625d7890dbc0ae493da095a4d7de47742fd3b02e3f42d7ee52e3599a4ac'
        '70ac76748d40d93fb5e5597fbaae933756c4eeb0b8969255e16435d0fad60006'
        '3249ca591216ca118f5a778dc9c0ba27d2f66e1a685fa101511a06bfa09a0d13'
)
_spackroot=/opt/spack
_spackcfg=etc/spack/defaults/config.yaml
_spacksetenv_sh=share/spack/setup-env.sh

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i "s/root: *\$spack.*/root: \/var\/lib\/spack\/packages/g" ${_spackcfg}
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
  mkdir -p ${pkgdir}/${_spackroot}/bin/
  cp -dr --no-preserve=ownership share ${pkgdir}/${_spackroot}
  cp -dr --no-preserve=ownership lib ${pkgdir}/${_spackroot}
  cp -dr --no-preserve=ownership bin ${pkgdir}/${_spackroot}
  cp -dr --no-preserve=ownership etc ${pkgdir}/${_spackroot}
  cp -dr --no-preserve=ownership var ${pkgdir}/${_spackroot}
  find ./* -maxdepth 0 -type f \( ! -name ".*" \) -exec install -Dm 644 "{}" "${pkgdir}/${_spackroot}/{}" \;

  cd ${pkgdir}/${_spackroot}
  patch -p0 < ${srcdir}/spack.env.sh.patch

  cd ${srcdir}
  install -Dm 644  ${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh
  install -Dm 644  ${pkgname}.csh ${pkgdir}/etc/profile.d/${pkgname}.csh

  install -Dm 644 ${pkgname}.sysusers ${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm 644 ${pkgname}.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf
  install -Dm 755 ${pkgname}.bin.py ${pkgdir}/usr/bin/${pkgname}

  install -Dm 644 ${pkgname}.pkrules ${pkgdir}/usr/share/polkit-1/rules.d/${pkgname}.rules
  install -Dm 644 ${pkgname}.pkaction ${pkgdir}/usr/share/polkit-1/actions/org.archlinux.pkexec.spack.policy
  # Fix mode to match polkit.
  install -d -o root -g 102 -m 750 ${pkgdir}/usr/share/polkit-1/rules.d
}
