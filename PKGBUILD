# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

[ ! -s 'PKGBUILD.local' ] && cat > 'PKGBUILD.local' << EOF
_opt_HylafaxPlus=1 # 1 for Hylafax+, 0 for Hylafax
_opt_Pagesize='Letter' # A4, Letter, Legal
EOF
source 'PKGBUILD.local'

# This was adapted from the Gentoo ebuild
# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-print/fax4cups/fax4cups-1.29-r1.ebuild,v 1.3 2015/04/19 09:59:29 ago Exp $

set -u
_pkgname='fax4CUPS'
pkgname="${_pkgname,,}"
pkgver='1.29'
pkgrel='1'
pkgdesc='Fax backend for CUPS supporting hylafax hylafaxplus mgetty-fax efax capisuite'
arch=('any')
url='http://vigna.di.unimi.it/fax4CUPS'
license=('GPLv2')
depends=('cups')
optdepends=('hylafax: enterprise fax server'
            'hylafaxplus: enterprise fax server'
            'mgetty-fax'
            'efax: simple fax send/receive')
install="${_pkgname}.install"
source=("${url}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}.sudo")
source[0]="https://www.joonet.de/sources/fax4cups/oldsrc/fax4CUPS-${pkgver}.tar.gz"
md5sums=('8d033b71f60afddbcd3f4f7ef316d356'
         '275fcb6c51141015bafd335b7fabb0c0')
sha256sums=('4e9ff3ec04a356b24412db4226630cfef82b88142e1566c867f2832f3ee6cfb3'
            '0a69cef5657d7f6787425f4609c5caa18b84af4609b92876c87bce8393925249')

prepare() {
  set -u
  cd "${_pkgname}-${pkgver}"

  # eliminate sbin
  sed -i -e 's:/usr/sbin/:/usr/bin/:g' 'hylafax'

  if [ "${_opt_HylafaxPlus}" -ne 0 ]; then
    sed -i -e 's:/var/log/hylafax$:/var/spool/hylafax/log:g' 'hylafax' 'fax4CUPS.1'
  fi

  # I don't know where Dialler is a valid spelling of Dialer.
  sed -i -e 's:diall:dial:g' 'fax4CUPS.1'
  set +u
}

package() {
  set -u
  cd "${_pkgname}-${pkgver}"
  install -Dpm644 'fax4CUPS.1' "${pkgdir}/usr/share/man/man1/fax4CUPS.1"

  local _backend
  local _outfile
  for _backend in 'capisuite-fax' 'hylafax' 'efax' 'mgetty-fax'; do
    # Backend
    _outfile="$(cups-config --serverbin)/backend/${_backend}"
    install -Dpm755 "${_backend}" "${pkgdir}${_outfile}"
    sed -i -e 's:^\(PAGE\)=a4$:\1='"${_opt_Pagesize}"':g' "${pkgdir}${_outfile}"
    # PPD
    _outfile="$(cups-config --datadir)/module/${_backend}.ppd"
    install -Dpm644 "${_backend}.ppd" "${pkgdir}${_outfile}"
    sed -i -e 's/^\(\*Default[^:]\+:\s\+\)A4$/\1'"${_opt_Pagesize}"'/g' "${pkgdir}${_outfile}"
  done
  _outfile="/etc/sudoers.d/${_pkgname}"
  install -Dpm600 "${srcdir}/${_pkgname}.sudo" "${pkgdir}${_outfile}"
  chmod 750 "$(dirname "${pkgdir}${_outfile}")"
  if [ "${_opt_HylafaxPlus}" -ne 0 ]; then
    sed -i -e 's:^lp :uucp :g' "${pkgdir}${_outfile}"
  fi
  cat >> "${pkgdir}/${_outfile}" << EOF

# Installed by ${pkgname}-${pkgver} PKGBUILD from Arch Linux AUR
# https://aur.archlinux.org/

# Install options:
# _opt_HylafaxPlus='${_opt_HylafaxPlus}' # 1 for Hylafax+, 0 for Hylafax
# _opt_Pagesize='${_opt_Pagesize}' # A4, Letter, Legal

# This file permits ${_pkgname} to run fax jobs as a user
# so that users can delete their own jobs. The username above
# should match the user name of Hylafax.
EOF
  set +u
}
set +u
