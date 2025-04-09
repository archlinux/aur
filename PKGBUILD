# Contributor: Kevin Baxmann <kvbx+aur@kvbx.de>
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andreas Pieber <anpieber@gmail.com>

set -u
pkgname=liquibase
pkgver=4.31.1
pkgrel=1
pkgdesc='VCS source control tailored for database management'
arch=('any')
url="http://www.liquibase.org/"
license=('Apache-2.0')
depends=('bash' 'java-environment')
_giturl="https://github.com/liquibase/${pkgname}"
_verwatch=("${_giturl}/releases.atom" '\s\+<link rel="alternate" type="text/html" href="http.*/releases/tag/liquibase-parent-\([^"]\+\)"/>.*' 'f') # RSS
options=('!strip')
source=("https://github.com/liquibase/liquibase/releases/download/v${pkgver}/liquibase-${pkgver}.tar.gz"
        "liquibase.profile")
sha256sums=('0555808b59941d497f0c1114c3f2225698afde11c60d191c88e449506a60a3ea'
            '7c1939e5b1aee63db199c86989726bbdf81102784512ed69f8595fddf80c30c0')
package() {
  set -u
  # install profile file
  #install -Dpm644 "${srcdir}/liquibase.profile" "${pkgdir}/etc/profile.d/liquibase.sh"
  # sed makes it easy to not forget our underprivileged csh users
  #install -Dpm644 <(sed -e 's:export :setenv :g' -e 's:=: :g' "${srcdir}/liquibase.profile") "${pkgdir}/etc/profile.d/liquibase.csh"

  # This binary link removes the need for the profile files that require a logout to make work
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/liquibase" -t "${pkgdir}/usr/bin/"

  # create directories
  install -dm755 "${pkgdir}/opt/${pkgname}"

  # move liquibase tar content to /opt/liquibase
  find "${srcdir}" -maxdepth 1 -mindepth 1 -not -type l -exec mv -v '{}' "${pkgdir}/opt/${pkgname}/" \;

  # make liquibase executable
  chmod 755 "${pkgdir}/opt/${pkgname}/liquibase"

  # remove files for other platforms
  rm -f "${pkgdir}/opt/${pkgname}/liquibase.bat"

  # install license files
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  mv -v "${pkgdir}/opt/${pkgname}/licenses/"{commercial,oss} "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/licenses/${pkgname}/"{commercial,oss} "${pkgdir}/opt/${pkgname}/licenses/"
  mv -v "${pkgdir}/opt/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE.txt"

  # install doc files
  # install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  # for _doc in examples ABOUT.txt changelog.txt GETTING_STARTED.txt README.txt UNINSTALL.txt
  # do
  #   mv -v "${pkgdir}/opt/${pkgname}/${_doc}" "${pkgdir}/usr/share/doc/${pkgname}/"
  #   ln -s "/usr/share/doc/${pkgname}/${_doc}" "${pkgdir}/opt/${pkgname}/"
  # done

  # install shell completions
  install -Dvm644 "${pkgdir}/opt/${pkgname}/lib/liquibase_autocomplete.sh" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dvm644 "${pkgdir}/opt/${pkgname}/lib/liquibase_autocomplete.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  rm -fv "${pkgdir}/opt/${pkgname}/lib/"{liquibase_autocomplete_mac.bash,liquibase_autocomplete.sh,liquibase_autocomplete.zsh}

  set +u
}
set +u
