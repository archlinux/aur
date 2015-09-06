# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>

pkgname='rds-cli'
# Do not change pkgver. It won't force an update. An update will change pkgver automatically.
# To update, you need to delete RDSCli.zip to make it download again.
pkgver=1.19.004
pkgrel=1
pkgdesc='The Command Line Toolkit for the Amazon Relational Database Service API'
arch=('any')
url='http://aws.amazon.com/developertools/2928'
license=('custom')
depends=('java-runtime-headless')
makedepends=('findutils')
source=('http://s3.amazonaws.com/rds-downloads/RDSCli.zip' 'rds-cli.profile')
install="${pkgname}.install"
sha256sums=('298c15ccd04bd91f1be457645d233455364992e7dd27e09c48230fbc20b5950c'
            'd249bc8111f325c0fb2e6475dca7e79d53470d6d831bdeda3c9fad386a3a69d0')

pkgver() {
  set -u
  cd RDSCli-*/
  local _zipver="$(basename "$(pwd)")" # "
  _zipver="${_zipver#RDSCli-}"
  echo "${_zipver}"
  set +u
}

package() {
  set -u
  cd "${srcdir}/RDSCli-${pkgver}"
  # The last ${pkgdir}/usr/{} does not need the /bin/ because its already stated
  # .cmd files are for Windows
  find 'bin/' -type f -not -iname '*.cmd' -exec install -Dpm755 '{}' "${pkgdir}/usr/{}" ';'
  # Force the LIBDIR. Arch doesn't set JAVA_HOME
  sed -i -e 's:^\(LIBDIR\)=.*$:\1=/usr/lib/rds-cli:g' -e 's:${JAVA_HOME[^}]*}:/usr:g' "${pkgdir}/usr/bin/service"
  # How are users supposed to figure this out? Come back later, and suddenly it works? WTF?
  sed -i -e 's:^\(\s\+\)exit 1$:\1echo "You may need to log out and in to set your profile"\n&:g' "${pkgdir}/usr/bin/rds"
  # It's dangerous to place a common name like service in /usr/bin
  mv "${pkgdir}/usr/bin/service" "${pkgdir}/usr/bin/rds-service.sh"
  sed -i -e 's:/bin/service:/bin/rds-service.sh:g' "${pkgdir}/usr/bin/rds"
  install -Dpm755 lib/* -t "${pkgdir}/usr/lib/rds-cli"

  install -Dpm644 'license.txt' 'notice.txt' 'THIRDPARTYLICENSE.TXT' -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -Dpm644 'README.TXT' 'RELEASENOTES.TXT' 'credential-file-path.template' -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # Someone left files in DOS CRLF
  sed -i -e 's:\r::g' -e 's:\s\+$::g' "${pkgdir}/usr/share/doc/${pkgname}"/{'README.TXT','RELEASENOTES.TXT'} "${pkgdir}/usr/share/licenses/${pkgname}"/*

  # ENV vars (these are sourced so could be 644)
  install -Dpm755 "${srcdir}/rds-cli.profile" "${pkgdir}/etc/profile.d/rds-cli.sh"
  # sed makes it easy to not forget our underprivileged csh users
  install -Dpm755 <(sed -e 's:export :setenv :g' -e 's:=: :g' "${srcdir}/rds-cli.profile") "${pkgdir}/etc/profile.d/rds-cli.csh"
  set +u
}

# vim:set ts=2 sw=2 et:
