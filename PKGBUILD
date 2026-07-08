# Maintainer: Nicolas Derumigny nderumigny <at> gmail <dot> com
pkgname=spack
pkgver=1.2.1
pkgrel=1
pkgdesc="A flexible package manager for supercomputers."
arch=('i686' 'x86_64')
url="https://spack.io/"
license=('MIT')
depends=('python' 'polkit')
optdepends=( 'env-modules-tcl' 'lmod' )
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-pip')
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
        environment.py.patch
      )
sha256sums=(
        '17c833b6935fceab87423f00b5548d38788656ebd5ef3ead8a628ced67f2c019'
        'e6d46e8f5140b4e86596d38f23af379d9adce8e9afc66f800571d7a4d9211e19'
        '8f4ae16577e17ea497daca03228ab532886b8e89482f03ca770e809909a17867'
        '1f2c4c6b8841d927fa4056206b8e5603719c0d829586ff0937efaa935d054376'
        '7f593b7f9289972ae83ad11e0dd3281faf1c56bffa0428dd69641b36b8b94356'
        '0bddb0a0f1d470509f44c3031041ab0de5472de84f58c90d4b6c91e6782cb6a2'
        '7b427625d7890dbc0ae493da095a4d7de47742fd3b02e3f42d7ee52e3599a4ac'
        'fab69677830f668bda5f7a324a1e94af83ae46d6e259168f430f2cd02b37376f'
        '55dc48adbba01c953e9be97c8dbca3c1e04fe11aecef37d7a5e0536ea8ea0132'
        '733c9631ca354210722998094a1ca0e7c17a5a0a016e04d465fb872dee434683'
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
  patch -p0 < ${srcdir}/environment.py.patch

  # Correct errors at build stage
  rm lib/spack/docs/_static/spack-logo-text.svg
  rm lib/spack/docs/_static/spack-logo-white-text.svg
  ln -s ../../../../share/spack/logo/spack-logo-text.svg lib/spack/docs/_static/spack-logo-text.svg
  ln -s ../../../../share/spack/logo/spack-logo-white-text.svg lib/spack/docs/_static/spack-logo-white-text.svg
}

build() {
  python -m build --wheel ${srcdir}/${pkgname}-${pkgver}
}

package() {
  warning "Remember to add yourself as member for the new \`spack\` group after installation!"
  # Avoid a regression in installer that prevent installation
  pip install --break-system-packages 'installer<1.0'
  python -m installer --destdir ${pkgdir}/ ${srcdir}/${pkgname}-${pkgver}/dist/spack-${pkgver}-py3-none-any.whl
  pip uninstall -y --break-system-packages 'installer'

  PYTHON_VERSION=`python -c "import sys; print (f'{sys.version_info[0]}.{sys.version_info[1]}', end='')"`
  pushd ${pkgdir}/usr/lib/python${PYTHON_VERSION}/site-packages/
  patch -p0 < ${srcdir}/spack.env.sh.patch
  patch -p0 < ${srcdir}/spack.patch

  mkdir -p ${pkgdir}/opt/spack/
  mv etc ${pkgdir}/opt/spack/
  ln -s /opt/spack/etc etc
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
