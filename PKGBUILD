# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: RunningDroid <runningdroid AT zoho.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Soup <soup a.t soultrap d.o.t n.e.t>
# Contributor: Andres Perera <aepd87@gmail.com>

set -u
pkgname='checkbashisms'
pkgver='20160203'
# To get the date of the last commit for this file
# Be in the tree for the .pl file
# https://anonscm.debian.org/cgit/collab-maint/devscripts.git/tree/scripts/checkbashisms.pl
# Click [search]
# To see the diff, click on the commit
pkgrel='2'
pkgdesc='Debian script that checks for bashisms'
arch=('any')
url='http://packages.qa.debian.org/d/devscripts.html'
license=('GPL')
depends=('perl')
conflicts=('devscripts')
_srcfile="checkbashisms.pl.${pkgver}"
source=("${_srcfile}::https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.pl"
        'https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.1'
        'https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.bash_completion'
)
sha256sums=('6943f31aae8552fdec53f5d4c386f08ec029630bf0df46576c2d7c43a2f25081'
            'c74d1ed33fee4cf2ccca0d7690d404d551a4edcbde0ddc602104d9198359cefb'
            '08f1587d3219b494377ef1af265f71f11c67c291d846b4c1f886a04b90eeb860')

# Version checking devscripts won't help us. We need to watch for changes to this file.
_vercheck() { :; }
_verscan() {
  local _rv=1
  [ "$1" -ne 0 ] && _rv=0
  local _rvfile=''
  local _remfile="$(sha256sum < <(curl -s "${source[0]##*::}") | cut -d' ' -f1)"
  if [ "${_remfile}" != "${sha256sums[0]}" ]; then
    local _vercmp=1
    [ "$2" -ge 3 ] && printf '%-s %s\n' "${_vercmp}" "${_remfile}" 1>&2
    if [ "${_vercmp}" -ge 1 ]; then
      [ "$2" -eq 2 ] && echo "${_remfile}"
      _rvfile="${_remfile}"
      _rv=0
    fi
  fi
  [ "$2" -eq 1 -o "$2" -eq 4 ] && echo "${_rvfile}"
  return ${_rv}
}
#_verscan 0 4; exit 1

package() {
  set -u
  cd "${pkgdir}"
  install -Dpm755 "${srcdir}/${_srcfile}" 'usr/bin/checkbashisms'
  sed -i -e "s,###VERSION###,${pkgver},g" 'usr/bin/checkbashisms'
  install -Dpm644 "${srcdir}/checkbashisms.1" 'usr/share/man/man1/checkbashisms.1'
  install -Dpm644 "${srcdir}/checkbashisms.bash_completion" 'usr/share/bash-completion/completions/checkbashisms'
  set +u
}
set +u
