# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: AXVill
# Contributor: dacoit <dacoit at tuta.io>
# Contributor: xjpvictor Huang <ke [AT] xjpvictor [DOT] info>
# Contributor: uuwe

set -u
_pkgname='Openswan'
pkgname="${_pkgname,,}"
pkgver='3.0.0'
pkgrel='1'
pkgdesc='Open Source implementation of IPsec for Linux'
arch=('i686' 'x86_64')
arch+=('aarch64') # buzz
url='https://www.openswan.org'
_giturl='https://github.com/xelerance/Openswan'
license=('GPL' 'custom')
depends=('gmp' 'perl' 'iproute2')
#optdepends=('python2')
makedepends=('flex' 'bison')
#makedepends+=('xmlto' 'docbook-xsl')
conflicts=('ipsec-tools' 'strongswan')
backup=(
  'etc/ipsec.conf'
  'etc/ipsec.d/policies/'{block,clear,clear-or-private,private,private-or-clear}
)
options=('!makeflags')
_srcdir="${_pkgname}-${pkgver}"
source=(
  #"https://download.openswan.org/openswan/openswan-${pkgver}.tar.gz"
  "${_srcdir,,}.tar.gz::${_giturl}/archive/v${pkgver}.tar.gz"
  'openswan.service'
)
md5sums=('d4952668703e28692016c18039c86f97'
         'e428e61ba81048eef92475dffa2ffc23')
sha256sums=('69fe7a71e54aaf0ea93b874db4963057c1ff4904b3617b36f2c9be2010c23331'
            '9f42bc005d4c361b31d41c7186a19ed8dbd1f95be31c16663bd2a1a8da8a29f0')
sha512sums=('fda8e4a4d22b2d028475eb05ee0e799ee4cda20bee111ac487fa7045a9d839445b9d90ebbe1b1378058453a8eca7ea76ed131f76744400a7f16aa11e352cb975'
            'a234e97a4fe10fb85a8a1b69d0b55b7c7a4a9ef44c199f876f64bb7290e9f161b20e4c721112e26c6a5636a898a27a36b525aae0944cf6217ff81c36389d5803')

prepare() {
  set -u
  cd "${_srcdir}"

  #cp -p 'Makefile.inc' 'Makefile.Arch.inc'
  local _seds=(
    -e '# Change install paths to Arch defaults'
    -e 's|/usr/local|/usr|'
    -e 's|libexec/ipsec|lib/openswan|'
    -e 's|)/sbin|)/bin|'
    -e '# Replace invalid init script paths with systemd script path'
    -e 's/^INC_RCDIRS.*/INC_RCDIRS\?\=\/usr\/lib\/systemd\/scripts/'
  )
  sed "${_seds[@]}" -i 'Makefile.inc'
  test '!' -s 'Makefile.Arch.inc' || echo "${}"
  _seds=(
    -e '# Disable halt on warnings for unmaintained code'
    #-e 's:-Werror:-Wno-error:g'
    -e 's:-Werror::g'
  )
  sed -E "${_seds[@]}" -i 'programs/Makefile.program'
  _seds=(
    -e '# fix misdetection of gcc>=10'
    -e 's/GCC_VERSION_GE_46:=/&true\n#/g'
  )
  sed -E "${_seds[@]}" -i 'Makefile.common'
  _seds=(
    -e '# remove egrep warning'
    -e 's:\begrep\b:grep -E:g'
  )
  sed -E "${_seds[@]}" -i 'Makefile' 'Makefile.top' 'contrib/sarefnc/scripts/alta' 'programs/barf/barf.in' 'programs/ipsec/ipsec.in' 'programs/look/look.in' packaging/utils/{backup,errcheck,kerneldiff,kernelpatch,manlink,nattpatch,patcher,prepcand,sarefpatch,update-natt}

  set +u
}

build() {
  set -u
  cd "${_srcdir}"

  if :; then
    # No evidence that hostname is called during build
    ln -sf '/usr/bin/false' 'hostname'
    # man pages are the same with or without xmlto
    ln -sf '/usr/bin/false' 'xmlto'
    export PATH="${PWD}:${PATH}"
  fi

  if [ "${pkgver}" = '2.6.52.1' ]; then
    CFLAGS+=' -fcommon'
  fi
  CFLAGS="${CFLAGS//_FORTIFY_SOURCE/_FORTIFY_SRC_DISABLED}"
  export USERCOMPILEEXTRA='-std=gnu17'
  make USE_XAUTH='true' USE_OBJDIR='true' programs # V=1
  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  # Pre-create init script directory
  mkdir -p "${pkgdir}/usr/lib/systemd/scripts"

  make -j1 DESTDIR="${pkgdir}" XMLTO= install

  # Change permissions in /var
  mv "${pkgdir}/var/run" "${pkgdir}/"
  rm -r "${pkgdir}/var"
  chmod 700 "${pkgdir}/run/pluto"

  # Copy License
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/openswan/"

  # Install service unit
  install -Dpm644 "${srcdir}/openswan.service" -t "${pkgdir}/usr/lib/systemd/system/"

  # fix manpages
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/"

  # fix python2
  sed -e '1s|python|python2|' -i "${pkgdir}/usr/lib/openswan/verify"

  # clean up /run (namcap Tue 16 Jun 2020 06:24:25 PM EDT)
  rm -r "${pkgdir}/run"
  set +u
}
set +u
