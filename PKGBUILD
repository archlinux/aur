# Maintainer: Guillaume Dolle  <dev at gdolle.com>
pkgname=spack
pkgver=0.16.1
pkgrel=2
pkgdesc="A flexible package manager for supercomputer that supports multiple versions, configurations, platforms, and compilers."
arch=('i686' 'x86_64')
url="https://spack.io/"
license=('MIT')
depends=('python' 'polkit')
optdepends=( 'env-modules-tcl' 'lmod' )
source=(spack-${pkgver}.tar.gz::https://github.com/spack/spack/archive/v${pkgver}.tar.gz
        spack.sysusers
        spack.tmpfiles
        spack.pkaction
        spack.pkrules
        spack.sh
        spack.csh
        spack.bin.sh
      )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
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
  sed -i "s%command spack%command pkexec --user spack ${_spackroot}/bin/spack%g" ${_spacksetenv_sh}
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

  cd ${srcdir}
  install -Dm 644  ${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh
  install -Dm 644  ${pkgname}.csh ${pkgdir}/etc/profile.d/${pkgname}.csh

  install -Dm 644 ${pkgname}.sysusers ${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm 644 ${pkgname}.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf
  install -Dm 755 ${pkgname}.bin.sh ${pkgdir}/usr/bin/${pkgname}

  install -Dm 644 ${pkgname}.pkrules ${pkgdir}/usr/share/polkit-1/rules.d/${pkgname}.rules
  install -Dm 644 ${pkgname}.pkaction ${pkgdir}/usr/share/polkit-1/actions/org.archlinux.pkexec.spack.policy
  # Fix mode to match polkit.
  install -d -o root -g 102 -m 750 ${pkgdir}/usr/share/polkit-1/rules.d
}
