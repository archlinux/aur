# Maintainer: Maximilian Hill <arch.pkgs@maxhill.eu>

pkgbase="nimiq"
pkgname=${pkgbase}
pkgver=1.4.3
pkgrel=1
_svc_tag=v${pkgver}
if [ ${pkgrel} -gt 1 ];
then
  _svc_tag=v${pkgver}-${pkgrel}
fi
pkgdesc="Nimiq core"
arch=('x86_64')
url="https://nimiq.com"
license=('Apache')
groups=('base-devel')
depends=(
  'nodejs>=8.0.0'
  'npm'
)
makedepends=(
  'yarn'
  'gulp'
  'gcc'
  'make'
)
source=(
  "${pkgbase}-core.git::git+https://github.com/nimiq-network/core.git#tag=${_svc_tag}"
  "${pkgbase}.sysusers"
)
noextract=("${source[@]##*/}")
backup=(
  "etc/nimiq/nimiq.conf"
)
sha256sums=(
  'SKIP'
  '8a24a02f92af8ed75b0405eefdd6b5ca33a91237e47111d93da0978df23720df'
)
install="${pkgbase}.install"

build()
{
  cd "${srcdir}/${pkgbase}-core.git"
  yarn && yarn build
  gulp --architecture=$(uname -m) prepare-packages
}

package()
{
  _builddir="${pkgbase}-core.git/packaging/BUILD"
  _sharedir="${pkgdir}/usr/share/${pkgbase}"
  _bindir="${pkgdir}/usr/bin"
  _cfgdir="${pkgdir}/etc/${pkgbase}"

  mkdir -p "${_bindir}"
  mkdir -p "${_cfgdir}"
  mkdir -p "${_sharedir}"

  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/var/lib/${pkgbase}"

  install -m 0755 "${_builddir}/${pkgbase}" "${_bindir}/"
  install -m 0600 "${_builddir}/fakeroot/etc/nimiq/sample.conf" "${_cfgdir}/nimiq.conf"
  install -m 0755 "${_builddir}/node" "${_sharedir}/node"
  install -m 0644 "${_builddir}"/*.js "${_builddir}/package.json" "${_builddir}/VERSION" "${_sharedir}/"
  cp -r "${_builddir}"/{build,lib,modules,node_modules,node-ui} "${_sharedir}"
  install -m 0644 "${_builddir}/systemd.service" "${pkgdir}/usr/lib/systemd/system/${pkgbase}.service"

  #install sysusers.conf
  install -Dm644 "${srcdir}/${pkgbase}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
}
