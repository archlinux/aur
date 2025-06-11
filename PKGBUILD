# Maintainer: envolution
# Contributor: Jingbei Li <i@jingbei.li>
# Contributor: Xwang <xwaang1976@gmail.com>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Andrew Fischer <andrew_at_apastron.co>
# shellcheck shell=bash disable=SC2034,SC2154

pkgbase=openfoam
pkgname=openfoam-org
pkgver=12.20250206
_pkgver="${pkgver%.*}"
_subver="${pkgver#*.}"
[[ "$pkgver" = "$_subver" ]] && _subver="version-$pkgver"
pkgrel=8
pkgdesc="The open source CFD toolbox (www.openfoam.org)"
_distpkgbase=OpenFOAM
_gitname=$_distpkgbase-$_pkgver
arch=('x86_64')
url="http://www.openfoam.org"
license=("GPL-3.0-or-later")
depends=(
  bzip2
  paraview
  parmetis
  scotch
  boost
  cgal
  zoltan
  openmpi
  gnuplot
  libxt
  libxml2
  freetype2
  double-conversion
  glew
  utf8cpp
  gl2ps
  python
  hdf5
  zlib
)
makedepends=(cli11 nlohmann-json fast_float qt5-svg qt5-x11extras qt5-tools qt5-xmlpatterns flex)
provides=(openfoam)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/OpenFOAM/$_gitname/archive/refs/tags/$_subver.tar.gz"
  paraview.arch
)
install="${pkgbase}.install"
md5sums=('3907dd4f5e2c5cb793ecf5666f89b917'
         'e93ff7ff9b92b01216c41164c09caa48')

_cache_notify() {
  local yellow='\033[1;33m'
  local red='\033[1;31m'
  local nc='\033[0m'
  echo -e "${yellow}==> Using build cache:${nc}"
  echo "    ${srcdir}/${_distpkgbase}-${_pkgver}"
  echo
  echo -e "${yellow}==> To build from scratch, run:${nc}"
  echo -e "    ${red}rm -rf ${srcdir}/${_distpkgbase}-${_pkgver}${nc}"
}

prepare() {
  _cachefile=${_distpkgbase}-${_pkgver}/.arch_cache
  if [[ -f "$_cachefile" ]] && grep -q "$pkgver" "$_cachefile"; then
    _cache_notify
  else
    rm -rf $_distpkgbase-$_pkgver
    mv $_gitname-$_subver $_distpkgbase-$_pkgver

    _bashrc=${_distpkgbase}-${_pkgver}/etc/bashrc
    sed -i 's/export SCOTCH_TYPE=.*/export SCOTCH_TYPE=system/' $_bashrc
    sed -i 's/export METIS_TYPE=.*/export METIS_TYPE=system/' $_bashrc
    sed -i 's/export PARMETIS_TYPE=.*/export PARMETIS_TYPE=system/' $_bashrc
    sed -i 's/export ZOLTAN_TYPE=.*/export ZOLTAN_TYPE=system/' $_bashrc
    cp ${_bashrc} ${_bashrc}.prepared

    # we'll be using $bashrc while building, and replace it with $bashrc.prepared
    # (below) during install - so we have to modify the FOAM_INST_DIR for post-install use
    sed -i 's|^# export FOAM_INST_DIR=.*|export FOAM_INST_DIR=/opt/\$WM_PROJECT|' \
      ${_bashrc}.prepared

    echo $pkgver >$_cachefile
  fi

  # Drop in Arch paraview environment script
  cp paraview.arch ${_distpkgbase}-${_pkgver}/etc/config.sh/paraview
}

build() {
  cd ${_distpkgbase}-${_pkgver}

  # Setup the build environment
  source etc/bashrc || true

  # see if we have extra threads available in /etc/makepkg.conf MAKEFLAGS
  [[ $MAKEFLAGS =~ -j[[:space:]]*([0-9]+) ]] &&
    _jval="${BASH_REMATCH[1]}" || _jval=1

  wmakeLnIncludeAll
  ./Allwmake -s -q -j ${_jval:=1}
}

package() {
  # Create destination directories
  install -d "${pkgdir}/opt/${_distpkgbase}" "${pkgdir}/etc/profile.d"

  # Copy package to pkgdir
  cp -r "${_distpkgbase}-${_pkgver}" "${pkgdir}/opt/${_distpkgbase}"

  # Clean up build files
  # https://openfoamwiki.net/index.php/Installation/Delete_intermediate_files#OpenFOAM_v1706_and_newer
  _baseclean="${pkgdir}/opt/${_distpkgbase}/${_distpkgbase}-${_pkgver}"
  rm -rf ${_baseclean}/platforms/*/applications ${_baseclean}/platforms/*/src

  # Add bash profile
  _bash_profile=${pkgdir}/etc/profile.d/openfoam-${_pkgver}.sh
  echo "export FOAM_INST_DIR=/opt/${_distpkgbase}" >$_bash_profile
  echo "export PATH=/opt/paraview/bin:\$PATH" >>$_bash_profile
  echo "alias ofoam=\"source \${FOAM_INST_DIR}/${_distpkgbase}-${_pkgver}/etc/bashrc\"" \
    >>$_bash_profile
  chmod 755 $_bash_profile

  # Add stub thirdparty directory to keep openfoam happy
  install -d "${pkgdir}/opt/${_distpkgbase}/ThirdParty-${_pkgver}"

  install -Dm755 "${_distpkgbase}-${_pkgver}/etc/bashrc.prepared" \
    "${pkgdir}/opt/${_distpkgbase}/${_distpkgbase}-${_pkgver}/etc/bashrc"
  install -Dm644 ${_distpkgbase}-${_pkgver}/COPYING -t $pkgdir/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
