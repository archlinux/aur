# Maintainer: Nicolas Derumigny nderumigny <at> gmail <dot> com
pkgname=spack
pkgver=1.1.0
pkgrel=1
pkgdesc="A flexible package manager for supercomputer that supports multiple versions, configurations, platforms, and compilers."
arch=('i686' 'x86_64')
url="https://spack.io/"
license=('MIT')
depends=('python' 'polkit')
optdepends=( 'env-modules-tcl' 'lmod' )
makedepends=('python-build' 'python-hatchling' 'python-installer')
source=(
        spack-${pkgver}.tar.gz::https://github.com/spack/spack/archive/v${pkgver}.tar.gz
        spack.sysusers
        spack.tmpfiles
        spack.pkaction
        spack.pkrules
        spack.sh
        spack.csh
        spack.env.sh.patch
        spack.patch
      )
sha256sums=(
        '518474f546e87723c43b80143d83a51c065a8d54333c8140da6f48bc7d9e50c1'
        'e6d46e8f5140b4e86596d38f23af379d9adce8e9afc66f800571d7a4d9211e19'
        'db0cc4a4ab32e6ee2e5c32898c69a0f0ce05b4e3c605beb024b5463c46e3710f'
        '1f2c4c6b8841d927fa4056206b8e5603719c0d829586ff0937efaa935d054376'
        '7f593b7f9289972ae83ad11e0dd3281faf1c56bffa0428dd69641b36b8b94356'
        '0bddb0a0f1d470509f44c3031041ab0de5472de84f58c90d4b6c91e6782cb6a2'
        '7b427625d7890dbc0ae493da095a4d7de47742fd3b02e3f42d7ee52e3599a4ac'
        'd7a700e62d55008c11af88d368977a5947e541cb279c2ed6a70be967f8e699be'
        '55dc48adbba01c953e9be97c8dbca3c1e04fe11aecef37d7a5e0536ea8ea0132'
)
_spackcfg=etc/spack/defaults/base/config.yaml
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

  # Corresct error at build
  rm lib/spack/docs/_static/spack-logo-text.svg
  rm lib/spack/docs/_static/spack-logo-white-text.svg
  ln -s ../../../../share/spack/logo/spack-logo-text.svg lib/spack/docs/_static/spack-logo-text.svg
  ln -s ../../../../share/spack/logo/spack-logo-white-text.svg lib/spack/docs/_static/spack-logo-white-text.svg
}

build() {
  python3 -m build --wheel ${srcdir}/${pkgname}-${pkgver} --no-isolation
}

package() {
  warning "Remember to add yourself as member for the new \`spack\` group after installation!"
  python -m installer --destdir ${pkgdir}/ ${srcdir}/${pkgname}-${pkgver}/dist/spack-${pkgver}-py3-none-any.whl

  PYTHON_VERSION=`python -c "import sys; print (f'{sys.version_info[0]}.{sys.version_info[1]}', end='')"`
  pushd ${pkgdir}/usr/lib/python${PYTHON_VERSION}/site-packages/
  patch -p0 < ${srcdir}/spack.env.sh.patch
  patch -p0 < ${srcdir}/spack.patch
  popd

  pushd ${srcdir}
  install -Dm 644  ${pkgname}.sh ${pkgdir}/etc/profile.d/${pkgname}.sh
  install -Dm 644  ${pkgname}.csh ${pkgdir}/etc/profile.d/${pkgname}.csh

  install -Dm 644 ${pkgname}.sysusers ${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm 644 ${pkgname}.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf

  pushd ${pkgdir}
  rm usr/bin/spack
  ln -s /usr/lib/python${PYTHON_VERSION}/site-packages/bin/spack usr/bin/spack
  popd

  install -Dm 644 ${pkgname}.pkrules ${pkgdir}/usr/share/polkit-1/rules.d/${pkgname}.rules
  install -Dm 644 ${pkgname}.pkaction ${pkgdir}/usr/share/polkit-1/actions/org.archlinux.pkexec.spack.policy

  # Fix mode to match polkit.
  install -d -o root -g polkitd -m 755 ${pkgdir}/usr/share/polkit-1/rules.d
  popd
}
