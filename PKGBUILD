# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

pkgname=graphlab-create-license
pkgver=1.9
pkgrel=1
pkgdesc="License installer for Graphlab Create"
arch=('x86_64')
url="https://dato.com/products/create/"
license=('custom')
depends=('python2'
         'graphlab-create=1.9')
makedepends=('python2-setuptools')
options=(!emptydirs)
provides=("${pkgname}")
source=()
sha256sums=()

_glSrcDir=""
_glSrcName="GraphLab-Create-License.tar.gz"
_glSha256="3f7d45e6dce7a5a668e4e95a8eb25406b6fbe73da2aa48b91b03ab7c6c985bcc"

prepare() {
  echo "###################################################################"
  echo "# Graphlab Create is only available to licensed users.            #"
  echo "# Register on the website and download the Graphlab Create        #"
  echo "# license tarball at:                                             #"
  echo "# https://get.graphlab.com/GraphLab-Create/1.9/                   #"
  echo "#                      /email/key/GraphLab-Create-License.tar.gz  #"
  echo "###################################################################"
  echo
  echo -n "Enter the directory containing the tarball ${_glSrcName}: "
  read _glSrcDir

  # Check for file existence
  if [[ -f "${_glSrcDir}/${_glSrcName}" ]]; then
    # Check for file validity
    sha256sum -c <(printf "${_glSha256}  ${_glSrcDir}/${_glSrcName}\n") || return 1

    # Untar
    mkdir -p "${srcdir}/${pkgname}-${pkgver}"
    tar -xzvf "${_glSrcDir}/${_glSrcName}" --strip=1 -C "${srcdir}/${pkgname}-${pkgver}"
  else
    echo "Error: ${_glSrcName} not found in ${_glSrcDir}"
    return 1
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
# vim: ft=sh syn=sh et
