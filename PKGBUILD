# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer: RunningDroid <runningdroid AT zoho.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Soup <soup a.t soultrap d.o.t n.e.t>
# Contributor: Andres Perera <aepd87@gmail.com>

set -u
pkgname='checkbashisms'
pkgver='20151219'
# To get the date of the last commit for this file
# Be in the tree for the .pl file
# https://anonscm.debian.org/cgit/collab-maint/devscripts.git/tree/scripts/checkbashisms.pl
# Click [search]
# To see the diff, click on the commit
pkgrel='1'
pkgdesc='Debian script that checks for bashisms'
arch=('any')
url='http://packages.qa.debian.org/d/devscripts.html'
license=('GPL')
depends=('perl')
conflicts=('devscripts')
source=('https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.1'
        'https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.pl'
)
sha256sums=('c74d1ed33fee4cf2ccca0d7690d404d551a4edcbde0ddc602104d9198359cefb'
            '2e22e42f4a685dab824243ad79105918daa2f13398fb2445bf9247caf126d943')

# Version checking devscripts won't help us. We need to watch for changes to this file.
_vercheck() { :; }
_verscan() {
  local _rv=1
  [ "$1" -ne 0 ] && _rv=0
  local _rvfile=''
  local _remfile="$(sha256sum < <(curl -s "${source[1]}") | cut -d' ' -f1)"
  if [ "${_remfile}" != "${sha256sums[1]}" ]; then
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
  install -Dm755 "${srcdir}/checkbashisms.pl" 'usr/bin/checkbashisms'
  sed -i -e "s,###VERSION###,${pkgver},g" 'usr/bin/checkbashisms'
  install -Dm644 "${srcdir}/checkbashisms.1" 'usr/share/man/man1/checkbashisms.1'
  set +u
}
set +u
