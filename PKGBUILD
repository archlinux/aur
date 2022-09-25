# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Simon Hollingshead <me at [firstnamelastname] dot com>

set -u
pkgname='hypercalc'
pkgver='20220820'
pkgrel='1'
pkgdesc='A calculator designed to calculate extremely large numbers without overflowing.'
arch=('any')
url='http://mrob.com/pub/perl/hypercalc.html'
license=('GPL')
depends=('perl')
source=("${pkgname}-${pkgver}.txt::http://mrob.com/pub/comp/${pkgname}/${pkgname}.txt")
md5sums=('5de98ce327dee1a8783430b7d3dc5c97')
sha256sums=('2b54f2e6cd3328e1a0ae790e12f6d598666912df47544041a7e6a73849125c51')

prepare() {
  set -u
  local _verln
  _verln="$(grep -e '^# This is the' "${srcdir}/${pkgname}-${pkgver}.txt")"
  if [[ "${_verln}" =~ ^'# This is the '([0-9]{4})' '([A-Z][a-z]{2})' '([0-9]{2})' version' ]]; then
    declare -A _months=([Jan]='01' [Feb]='02' [Mar]='03' [Apr]='04' [May]='05' [Jun]='06' [Jul]='07' [Aug]='08' [Sep]='09' [Oct]='10' [Nov]='11' [Dec]='12')
    local _vernew="${BASH_REMATCH[1]}${_months[${BASH_REMATCH[2]}]}${BASH_REMATCH[3]}"
    if [ "${pkgver}" != "${_vernew}" ]; then
      printf 'New version %s\n' "${_vernew}"
      set +u
      false
    fi
  else
    printf "Can't find new version line\n"
    set +u
    false
  fi
  set +u
}

package() {
  set -u
  install -DT <(sed -e '1,3 s:^:#:g' -e '1i #!/usr/bin/perl\n' "${srcdir}/${pkgname}-${pkgver}.txt") "${pkgdir}/usr/bin/${pkgname}"
  set +u
}
set +u
