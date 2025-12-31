# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_picover='5.09'
pkgname='pico'
pkgver='2.26'
pkgrel='1'
pkgdesc="the real pico text editor version ${_picover} from the Alpine Messaging System"
arch=('i686' 'x86_64')
#url='https://www.washington.edu/alpine/'
url='https://alpineapp.email/'
license=('apache')
depends=('ncurses')
makedepends=('gcc')
_srcdir="alpine-${pkgver}"
source=(
  "https://alpineapp.email/alpine/release/src/${_srcdir}.tar.xz"
  "maildir-${pkgver}.patch.gz::https://alpineapp.email/alpine/patches/alpine-${pkgver}/maildir.patch.gz"
  "fancy-${pkgver}.patch.gz::https://alpineapp.email/alpine/patches/alpine-${pkgver}/fancy.patch.gz"
  "fillpara-${pkgver}.patch.gz::https://alpineapp.email/alpine/patches/alpine-${pkgver}/fillpara.patch.gz"
  "compose-${pkgver}.patch.gz::https://alpineapp.email/alpine/patches/alpine-${pkgver}/compose.patch.gz"
  "longurl-${pkgver}.patch.gz::https://alpineapp.email/alpine/patches/alpine-${pkgver}/longurl.patch.gz"
)
md5sums=('0943b31c476276e924b02afbfaf98392'
         'a51d0537d56a5903e59f2e152e859d4d'
         'e3465d2fede6793e03535873333f79c9'
         'cb30683e7834bf61a400930a2161b6df'
         'af6eae2ba290eba783365d266255cea9'
         '4a1e702f0b52190466e48cacaee184eb')
sha256sums=('c0779c2be6c47d30554854a3e14ef5e36539502b331068851329275898a9baba'
            '57808418b02a0e1cb826940068aa10eaed827b2b23609f05fd2015ec92043d37'
            'c178459dd885e4caa32640e5ce63c689ec4752a1e039ddb149e034b935fe5181'
            '960bb9656353529964e86f0f782bf032f9aae36af9493ed7f2c8ccfd5695330f'
            '013d31d95dbf6e31c1ebfdcb745481cf31fd0df466b81e077a7538dcfe75a9f4'
            'b29b4b6f8986c4c07ce2db21b6ff27341b4f7c0844c3dee8c1c63b0536fc88b2')

prepare() {
  local -; set -u
  cd "${_srcdir}"
  local _picoh _pver
  _picoh="$(<'pico/pico.h')"
  if [[ "${_picoh}" =~ 'version = "'([0-9.]+)'"' ]]; then
    _pver="${BASH_REMATCH[1]}"
    if [ "${_pver}" != "${_picover}" ]; then
      printf 'Update _picover=%s\n' "${_pver}"
      return 1
    fi
  else
    printf 'Cant find pico version\n'
    return 1
  fi
  printf 'Pico version %s\n' "${_picover}"

  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    _pt="${_pt%.gz}"
    case "${_pt}" in
    *.patch)
      set +u; msg2 "Applying patch ${_pt}"; set -u
      patch --no-backup-if-mismatch -Np1 -i "${srcdir}/${_pt}"
      ;;
    esac
  done
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"

  # Disable pam
  sed -e 's:am_start:omme_start:g' -i 'configure'
  #_configure
}

_configure() {
  if [ ! -s 'Makefile' ]; then
    #CFLAGS+=' -Wno-error=incompatible-pointer-types -std=gnu17'
    CFLAGS+=' -Werror=incompatible-pointer-types'
    local _conf=(
      --prefix='/usr'
      --without-ldap
      --without-ssl
      --without-krb5
      --target='slx'
      CC='gcc -std=gnu17 -Wno-error=implicit-int'
    )
    ./configure "${_conf[@]}"
  fi
}

build() {
  local -; set -u
  cd "${_srcdir}"
  _configure
  set -x
  nice -n1 make -j1 'c-client'
  make 'c-client.d'
  nice -n1 make -C 'pith'
  nice -n1 make -C 'pico'
}

package() {
  local -; set -u
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install -C 'pico'
  rm -f "${pkgdir}/usr/bin"/{pilot,alpine,rpdump,rpload}
  install -Dpm644 'doc/man1/pico.1' -t "${pkgdir}/usr/share/man/man1/"
}
set +u
