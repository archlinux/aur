# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
_picover='5.04'
pkgname='pico'
pkgver='2.00'
pkgrel='3'
pkgdesc="the real pico text editor version ${_picover} from the Alpine Messaging System"
arch=('i686' 'x86_64')
#url='https://www.washington.edu/alpine/'
url='https://alpineapp.email/'
license=('apache')
depends=('ncurses')
makedepends=('gcc')
_srcdir="alpine-${pkgver}"
source=(
  #"http://ftp.swin.edu.au/alpine/${_srcdir}.tar.bz2"
  "https://mirror.its.dal.ca/freebsd/distfiles/${_srcdir}/${_srcdir}.tar.bz2"
  #"https://alpineapp.email/alpine/release/src/${_srcdir}.tar.xz"
  '0000-Alpine.2.00-safe_flock.patch'
  '0001-Alpine.2.00-mtest-gets.patch'
  '0002-Alpine.2.00-mlock-unistd.patch'
  '0003-Alpine.2.00-dmail-ctype.patch'
  '0004-Alpine.2.00-tmail-ctype.patch'
  '0005-Alpine.2.00-charconv-utf8-wcwidth.patch'
)
md5sums=('84e44cbf71ed674800a5d57eed9c1c52'
         '60229dd00cb66209616a7bb14c986785'
         '81c42dd80180c4da587326efd03af019'
         '5d4457eb85c9a8103425dfe13e268210'
         'd30b84761c742bba56660c14700ed883'
         '618fd66a70d32093cd3cb1ed89f8d9fb'
         '67640ffb6bf157e1c45ba55f10e1c823')
sha256sums=('c85db8405af90375ba2440c85b7952d80996154e9916b83acca558dc82e0a2a6'
            '636773b9667485e4a2a47ff7f7beb7f77d2bbe1b24c5fdb2166cd0b7bacbcc29'
            'd3304ccae3dbc10822adb60beb5ca2491e5f95e8efa1296a90097a1c6eb2a2f7'
            '6353e12ef4ec652b9e6cca6c6c328f0bb11fe236a3cfa8dd8c8a67c9e0ba9269'
            'ce04b6a160fe7812acca9e4d2d5b2d08299efc09f2398bb1cd4381bee7d01de3'
            'c69002f8685c3e38c68feca800ac87bbbda16bcd577491a65891c780bb635fee'
            '32dcc9f13c7d2e71b4f83a9705a68597ce9bea4115716b81754a2ccbcdfa7207')

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

  pushd 'imap/src/osdep/unix' > /dev/null
  local _sedsutime=(
    -e '#fix utime'
    -e '/stdio\.h/ a #include <utime.h>'
    -e 's:time_t tp\[2]:struct utimbuf tp:g'
    -e 's:tp\[0]:tp.actime:g'
    -e 's:tp\[1]:tp.modtime:g'
    -e '/utime\s*\(/ s:,tp\):,\&tp):g'
  )
  sed -E "${_sedsutime[@]}" -i $(grep -lFe 'time_t tp[2]' *.c)

  local _sedsdirent=(
    -e '#fix select'
    -e '/select/ s:\(struct direct \*:(const struct direct *:g'
    -e '#fix dirent'
    -e 's:const void \*d1,const void \*d2:const struct dirent **d1, const struct dirent **d2:g'
    -e 's:\*\(struct direct \*\*\) d:*d:g'
  )
  sed -E "${_sedsdirent[@]}" -i $(grep -lFe '(struct direct ' *.c)
  popd > /dev/null

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
  # making Alpine 2.00 crashes on pam errors
  # Disabling pam gets the Alpine make farther but then it crashes on a TCP error
}

package() {
  local -; set -u
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install -C 'pico'
  rm -f "${pkgdir}/usr/bin"/{pilot,alpine,rpdump,rpload}
  install -Dpm644 'doc/pico.1' -t "${pkgdir}/usr/share/man/man1/"
}
set +u
