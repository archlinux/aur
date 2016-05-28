# Maintainer: Mohamar Rios <mohamar.rios@gmail.com>

pkgname=graphlab-create
pkgver=1.9
pkgrel=1
pkgdesc="Graphlab Create is an extensible machine learning framework."
arch=('x86_64')
url="https://dato.com/products/create/"
license=('custom')
depends=('python2'
         'ipython2-notebook'
         'python2-boto'
         'python2-decorator'
         'python2-tornado'
         'python2-prettytable'
         'python2-requests'
         'python2-aws-cli'
         'python2-sseclient'
         'python2-multipledispatch'
         'python2-certifi'
         'python2-jsonschema'
         'python2-genson')
makedepends=('python2-setuptools')
options=(!emptydirs)
provides=("${pkgname}")
source=()
sha256sums=()

_glSrcDir=""
_glSrcName="graphlab-create-1.9.gpu.tar.gz"
_glSha256="f4aebba290853c163b1a59f3c070d093aa4cda9e6b299879245f995e78db2984"

prepare() {
  echo "###################################################################"
  echo "# Graphlab Create is only available to licensed users.            #"
  echo "# Register on the website and download the Graphlab Create        #"
  echo "# license tarball at:                                             #"
  echo "# http://static.dato.com/files                                    #"
  echo "#            /graphlab-create-gpu/graphlab-create-1.9.gpu.tar.gz  #"
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
  
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim: ft=sh syn=sh et
