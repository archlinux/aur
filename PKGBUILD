# Maintainer: saltfactory <saltfactory at protonmail dot com>

_major_version=2.0
_minor_version=1

pkgname=idp-ide
pkgver=${_major_version}.${_minor_version}
pkgrel=5
pkgdesc="IDP Knowledge Base System editor"
arch=('i686' 'x86_64')
url="https://dtai.cs.kuleuven.be/software/idp/try"
license=('LGPL3')
depends=('idp')

_dirname="webID-${_major_version}.${_minor_version}"

source=("https://dtai.cs.kuleuven.be/krr/files/releases/idp-ide/latest/webID-${_major_version}.${_minor_version}.tar.gz")

md5sums=('328aafb41e0d796b08a84f7be7cb901e')
package() {
  cd "${srcdir}"
  rm "$_dirname.tar.gz"

  # set the workFolder configuration to "$(HOME)/Documents/idp-files"
  # this way no sudo is needed
  sed -i '/workFolder =/d' webID-${_major_version}.${_minor_version}/webID.cfg
  sed -i '13i workFolder = "$(HOME)/Documents/idp-files"' webID-${_major_version}.${_minor_version}/webID.cfg

  # put files in /usr/share/idp-ide
  targetDir="${pkgdir}/usr/share/idp-ide"
  mkdir -p "${targetDir}"
  cp -dR ./* "${targetDir}/"
  sed -r -i -e 's,/usr/bin/idp,/usr/local/bin/idp,g' "${targetDir}/webID-${_major_version}.${_minor_version}/webID.cfg"

  # create executable
  mkdir -p "${pkgdir}/usr/bin"
  echo "sh -c 'cd /usr/share/idp-ide/webID-${_major_version}.${_minor_version} && /usr/share/idp-ide/webID-${_major_version}.${_minor_version}/webID'" >"${pkgdir}/usr/bin/idp-ide"
  chmod +x "${pkgdir}/usr/bin/idp-ide"


}

