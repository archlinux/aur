# Maintainer: Keerthan Jaic <jckeerthan at gmail dot com>

# Uncomment the following line for altera starter edition
# _starter=1
pkgname=quartus-lite-modelsim
_rel=16.0
_patch=211
pkgver=${_rel}.0.${_patch}
pkgrel=1
pkgdesc="Simulation software for Altera FPGA's"

arch=('x86_64' 'i686')
url="http://www.altera.com"
license=('custom')

_alteradir="/opt/altera"
_modelsim_edition="modelsim_ae"
if [[ $_starter ]]; then
  pkgname+="-starter"
  _modelsim_edition="modelsim_ase"
fi

depends=('quartus-lite')

options=('!strip')
_sname=ModelSimSetup
_setup=${_sname}-${pkgver}-linux.run
_surl="http://download.altera.com/akdlm/software/acdsinst/${_rel}/${_patch}/ib_installers/${_setup}"
source=(${_surl} 'profile.sh')
md5sums=('7b4283e86760660c25cb5eb3160519ff'
         '66ba4d6142a4066fb262058e4c0ac66e')

PKGEXT='.pkg.tar'

prepare() {
  cd "${srcdir}"
    sed -i "s,_alteradir,${_alteradir},g" profile.sh
    sed -i "s,_modelsim_edition,${_modelsim_edition},g" profile.sh
}

package() {
    cd "${srcdir}"

    chmod a+x ${_setup}
    ./${_setup} --mode unattended --installdir  "${pkgdir}${_alteradir}" --modelsim_edition ${_modelsim_edition}

    rm -r "${pkgdir}${_alteradir}/uninstall"
    rm -r "${pkgdir}${_alteradir}/logs"

    install -Dm755 profile.sh "${pkgdir}/etc/profile.d/${pkgname}.sh"
}
