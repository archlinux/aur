# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: garion < garion @ mailoo.org >
# Contributor: Alessandro Nakamuta <alessandro dot ufms at gmail dot com>

set -u
pkgname='mysecureshell'
pkgver='2.00'
pkgrel='2'
pkgdesc='A shell that adds advanced SFTP features to the OpenSSH server including ACLs, connection limits, and bandwidth control'
arch=('arm' 'i686' 'x86_64')
#url='http://mysecureshell.sourceforge.net'
#url='https://github.com/mysecureshell/mysecureshell'
url='https://mysecureshell.readthedocs.org/'
license=('GPL')
depends=('openssh')
backup=('etc/ssh/sftp_config')
install="${pkgname}.install"
#source=("http://mysecureshell.free.fr/repository/index.php/source/mysecureshell_${pkgver}.tar.gz")
_srcdir="${pkgname}-${pkgver}"
_giturl="https://github.com/mysecureshell/${pkgname}"
_verwatch=("${_giturl}/releases" "${_giturl#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
source=("${pkgname}-${pkgver}.tar.gz::${_giturl}/archive/v${pkgver}.tar.gz")
sha256sums=('05fbcc407a61a06f980581320e7df46bbb7cf2d2ae253cae79f716bda0940890')

prepare(){
  set -u
  cd "${_srcdir}"
  ./configure --with-logcolor='yes' # --prefix='/usr' # prefix moves /etc
  set +u
}

build(){
  set -u
  cd "${_srcdir}"
  make all -s -j "$(nproc)"
  set +u
}

package(){
  set -u
  cd "${_srcdir}"
  #local USER=root
  sed -i -e 's!MANDIR=/share/man!MANDIR=/usr/share/man!g' './install.sh'
  make DESTDIR="${pkgdir}" install

  chmod a+r "${pkgdir}/usr/bin/sftp-"{kill,admin,state}
  #cp -pvR 'man/fr' "${pkgdir}/usr/share/man/"
  set +u
}
set +u
