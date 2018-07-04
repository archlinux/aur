# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Based on the Arch Linux PKGBUILD by:
# Contributor: Sergej Pupykin
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

set -u
_pkgname='vde2'
pkgname='vde2-dosemu2'
pkgver='2.3.2'
pkgrel='2'
pkgdesc='Virtual Distributed Ethernet for emulators like qemu, patched for dosemu2'
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/vde/'
license=('GPL' 'LGPL' 'custom')
depends=('bash' 'libpcap' 'openssl')
makedepends=('python')
provides=("vde2=${pkgver}")
conflicts=('vde2')
options=('!makeflags')
install="${_pkgname}.install"
_srcdir="${_pkgname}-${pkgver}"
_archlink="@@@::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/@@@?h=packages/${_pkgname}"
source=(
  "https://downloads.sourceforge.net/project/vde/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
  "${_archlink//@@@/vde_cryptcab-compile-against-openssl-1.1.0.patch}"
  "${_archlink//@@@/dhcpd.conf.sample}"
  "${_archlink//@@@/iptables.rules.sample}"
  "${_archlink//@@@/vde-config.sample}"
  "${_archlink//@@@/vde-connection.sample}"
  "https://github.com/stsp/dosemu2/archive/dosemu2-2.0pre6.tar.gz" # the patches don't change very often
)
sha256sums=('cbea9b7e03097f87a6b5e98b07890d2275848f1fe4b9fcda77b8994148bc9542'
            '110370a5f48f1e241d43f8bb5e3ea6d2ca7d2c1949e1cf672d03bfc897f2e11f'
            'da0e2766dc63069da929c28126831ad5fdddcc4a04105a21217d78832c7ca1bc'
            '99076d7466cd99673dbe91ef83865187e7868177959b38e125df63eea957f83e'
            '5727c215646333c37b26388146cd3e6b3814b88d60d54051d7da99e00c0aef87'
            '5139110ed6d5d1174bf12971512dac5196d9d07df46dd393d7b1cd083118fe9b'
            'bebe81ec0bfca80ed34a7a53237bb4729246a6605a0e365e84c15243b3d2f569')

prepare() {
  set -u
  cd dosemu2*/
  local _dosemu2="${PWD}"
  cd "${srcdir}/${_srcdir}"
  patch -Np1 -i '../vde_cryptcab-compile-against-openssl-1.1.0.patch'
  patch -d 'src/slirpvde/' -b -p2 -i "${_dosemu2}/src/plugin/vde/patches/0001-slirp-Forward-ICMP-echo-requests-via-unprivileged-so.patch"
  local _ptf
  for _ptf in 'atty.diff' 'flags.diff' 'msg.diff'; do
    patch -b -p0 -i "${_dosemu2}/src/plugin/vde/patches/${_ptf}"
  done
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    CFLAGS="${CFLAGS} -Wno-unused-result" \
    ./configure --prefix='/usr' --sbindir='/usr/bin' --sysconfdir='/etc' --libexecdir='/usr/lib/vde2' \
               --enable-experimental
  fi
  make -s -j1 # V=1
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make prefix="${pkgdir}/usr" sysconfdir="${pkgdir}/etc" sbindir="${pkgdir}/usr/bin" libexecdir="${pkgdir}/usr/lib/vde2" install
  install -Dpm644 "${srcdir}/"{vde-config.sample,vde-connection.sample} -t "${pkgdir}/etc/vde/"
  install -Dpm644 "${srcdir}/"{dhcpd.conf.sample,iptables.rules.sample} -t "${pkgdir}/usr/share/vde2/"
  # install slirp license
  install -Dpm644 'COPYING.slirpvde' -t "${pkgdir}/usr/share/licenses/vde2/"
  set +u
}
set +u
