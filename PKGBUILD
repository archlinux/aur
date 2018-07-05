# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: max_meyer
# Based on vde2 PKGBUILD
# Contributor: Sergej Pupykin
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

set -u
_pkgname='vde2'
pkgname="${_pkgname}-svn"
pkgver=2.3.2.r588
pkgrel=1
pkgdesc='Virtual Distributed Ethernet for emulators like qemu'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/vde/'
license=('GPL' 'LGPL' 'CUSTOM')
depends=('bash' 'libpcap' 'openssl')
makedepends=('python')
makedepends+=('subversion')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
backup=('etc/conf.d/vde')
options=('!makeflags')
install='vde2.install' # curl -o 'vde2.install' 'https://projects.archlinux.org/svntogit/packages.git/plain/trunk/vde2.install?h=packages/vde2'
_srcdir="${pkgname^^}"
source=("${_srcdir}::svn://svn.code.sf.net/p/vde/svn/trunk"
        'vde.conf'
        'vde.rc' # no longer needed
)
_srcdir="${_srcdir}/vde-2"
_archsource=(
        'dhcpd.conf.sample'
        'iptables.rules.sample'
        'vde-config.sample'
        'vde-connection.sample'
)
_archlink="@@@::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/@@@?h=packages/${_pkgname}"
for _src in "${_archsource[@]}"; do
  source+=("${_archlink//@@@/${_src}}")
done
unset _src _archlink _archsource
sha256sums=('SKIP'
            '0b8c1c98f108601a8bd62b21a0575159a5237907dc301769909a7aeebd06a9fd'
            '860fc7eb299da175fa0521a7d751ee15cd3b7febfbc4af60f55604564c705f91'
            'da0e2766dc63069da929c28126831ad5fdddcc4a04105a21217d78832c7ca1bc'
            '99076d7466cd99673dbe91ef83865187e7868177959b38e125df63eea957f83e'
            '5727c215646333c37b26388146cd3e6b3814b88d60d54051d7da99e00c0aef87'
            '5139110ed6d5d1174bf12971512dac5196d9d07df46dd393d7b1cd083118fe9b')

pkgver() {
  set -u
  cd "${_srcdir}"
  local _svnver="$(svnversion)"
  local _srcver="$(sed -n -e 's:^AC_INIT(\[vde2\],\[\([0-9\.]\+\)\].*$:\1:p' 'configure.ac')"
  printf '%s.r%s' "${_srcver}" "${_svnver//[[:alpha:]]}"
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"

  autoreconf --install

  #PYTHON='/usr/bin/python2'
  ./configure --prefix='/usr' --sbindir='/usr/bin' --sysconfdir='/etc' --libexecdir='/usr/lib/vde2' \
    --enable-experimental
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j1 # Not multi threaded make compatible
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 prefix="${pkgdir}/usr" sysconfdir="${pkgdir}/etc" sbindir="${pkgdir}/usr/bin" libexecdir="${pkgdir}/usr/lib/vde2" install
  #install -Dpm755 "${srcdir}/vde.rc" "${pkgdir}/etc/rc.d/vde"
  #install -Dpm644 "${srcdir}/vde.conf" "${pkgdir}/etc/conf.d/vde"
  install -Dpm644 "${srcdir}/vde-config.sample" -t "${pkgdir}/etc/vde/"
  install -Dpm644 "${srcdir}/vde-connection.sample" -t "${pkgdir}/etc/vde/"
  install -Dpm644 "${srcdir}/dhcpd.conf.sample" -t "${pkgdir}/usr/share/vde2/"
  install -Dpm644 "${srcdir}/iptables.rules.sample" -t "${pkgdir}/usr/share/vde2/"
  # install slirp license
  install -Dpm644 'COPYING.slirpvde' -t "${pkgdir}/usr/share/licenses/vde2/"
  set +u
}
set +u
