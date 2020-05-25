# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor: AXVill
# Contributor: dacoit <dacoit at tuta.io>
# Contributor: xjpvictor Huang <ke [AT] xjpvictor [DOT] info>
# Contributor: uuwe

set -u
pkgname='openswan'
pkgver='2.6.51.5'
pkgrel='2'
pkgdesc='Open Source implementation of IPsec for Linux'
arch=('i686' 'x86_64')
url='https://www.openswan.org'
license=('GPL' 'custom')
depends=('gmp' 'perl' 'iproute2')
optdepends=('python')
makedepends=('flex' 'bison')
conflicts=('ipsec-tools' 'strongswan')
backup=(
  'etc/ipsec.conf'
  'etc/ipsec.d/policies/'{block,clear,clear-or-private,private,private-or-clear}
)
options=('!makeflags')
_srcdir="${pkgname}-${pkgver}"
source=(
  "http://download.openswan.org/openswan/openswan-${pkgver}.tar.gz"
  '0001-gcc9-strncpy.patch'
  'openswan.service'
)
md5sums=('49641ce5801d5f3f5b2754fe22d051ec'
         'b54891b73bc62fce51f8ca46c8731882'
         'e428e61ba81048eef92475dffa2ffc23')
sha256sums=('4124f4ce970089f301c34b9c48f54b021cf6b2b8813877942337f8022104f70d'
            'b30cfd22b14450668ecf798e6117ca6ea07609dabbee6d0ac15ef07dcef11804'
            '9f42bc005d4c361b31d41c7186a19ed8dbd1f95be31c16663bd2a1a8da8a29f0')
sha512sums=('b7864a1f2bf4a6c713de8ed669934567d89f79bcacf146ebd83d26d3ffb2bc482bc238308fd36a83a540fb3a832a5ff264529295c2bc309777b1e516b0e9f718'
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
  if [ "${pkgver}" = '2.6.51.5' ]; then
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

  make DESTDIR="${pkgdir}" install

  # Change permissions in /var
  mv "${pkgdir}/var/run" "${pkgdir}/"
  rm -r "${pkgdir}/var"
  chmod 700 "${pkgdir}/run/pluto"

  # Copy License
  install -Dpm644 LICENSE "${pkgdir}/usr/share/licenses/openswan/LICENSE"

  # Install service unit
  install -Dpm644 "${srcdir}/openswan.service" "${pkgdir}/usr/lib/systemd/system/openswan.service"

  # fix manpages
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/"

  # fix python2
  sed -e '1s|python|python2|' -i "${pkgdir}/usr/lib/openswan/verify"
  set +u
}
set +u
