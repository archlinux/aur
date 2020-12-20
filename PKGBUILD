# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: AXVill
# Contributor: dacoit <dacoit at tuta.io>
# Contributor: xjpvictor Huang <ke [AT] xjpvictor [DOT] info>
# Contributor: uuwe

set -u
_pkgname='Openswan'
pkgname="${_pkgname,,}"
pkgver='2.6.52.3'
pkgrel='1'
pkgdesc='Open Source implementation of IPsec for Linux'
arch=('i686' 'x86_64')
arch+=('aarch64') # buzz
url='https://www.openswan.org'
_giturl='https://github.com/xelerance/Openswan'
license=('GPL' 'custom')
depends=('gmp' 'perl' 'iproute2')
optdepends=('python2')
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
  '0001-gcc9-strncpy.patch'
  'openswan.service'
)
md5sums=('4330ed6fac51b1ec4835c32573143f56'
         'b54891b73bc62fce51f8ca46c8731882'
         'e428e61ba81048eef92475dffa2ffc23')
sha256sums=('2ad80f0ec6cba47d675f999b598480ff3cee81d1c9ef3b7c4634fcbc8047a441'
            'b30cfd22b14450668ecf798e6117ca6ea07609dabbee6d0ac15ef07dcef11804'
            '9f42bc005d4c361b31d41c7186a19ed8dbd1f95be31c16663bd2a1a8da8a29f0')
sha512sums=('ab1364365fdd2109f0610d2ea7b56908eb7036cabef4dcaee98361940c6594e69e10e11654eeeba5478a9af864ebaa31898e173b3e430cf084b74e2223f69367'
            'def41d3c407ef11fef7c53e5293b5b7b4d0d394218caa0ee0b0508a016f9c229dec5569dc013955e3521140a200582e3183198e2aa1dd314d13fd73e6bad415b'
            'a234e97a4fe10fb85a8a1b69d0b55b7c7a4a9ef44c199f876f64bb7290e9f161b20e4c721112e26c6a5636a898a27a36b525aae0944cf6217ff81c36389d5803')

prepare() {
  set -u
  cd "${_srcdir}"

  #diff -pNau5 programs/tncfg/tncfg.c{.orig,} > '0001-gcc9-strncpy.patch'
  patch -Nbup0 -i "${srcdir}/0001-gcc9-strncpy.patch"

  # Change install paths to Arch defaults
  sed -e 's|/usr/local|/usr|;s|libexec/ipsec|lib/openswan|;s|)/sbin|)/bin|' -i 'Makefile.inc'

  # Replace invalid init script paths with systemd script path
  sed -e 's/^INC_RCDIRS.*/INC_RCDIRS\?\=\/usr\/lib\/systemd\/scripts/' -i 'Makefile.inc'

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
  make USE_XAUTH='true' USE_OBJDIR='true' programs
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
