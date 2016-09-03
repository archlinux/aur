# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=python2-pwntools
pkgver=3.0.1
pkgrel=1
pkgdesc='The CTF framework used by Gallopsled in every CTF'
arch=('any')
url='https://pwntools.com/'
license=('MIT' 'GPL2' 'BSD')
makedepends=('lib32-glibc'
             'python2-setuptools')
depends=('python2>=2.7'
         'python2-mako'
         'python2-paramiko'
         'python2-pyelftools'
         'python2-capstone'
         'python2-pyserial'
         'python2-requests'
         'python2-psutil'
         'python2-tox'
         'python2-pysocks'
         'python2-dateutil'
         'python2-pygments'
         'ropgadget')
conflicts=('python2-pwntools' 'python2-pwntools-git')
options=('strip')
source=("https://github.com/Gallopsled/pwntools/archive/${pkgver}.tar.gz")
sha1sums=('13ea6800d45738f322f58578f1dbb2c1a9886e33')

_repodir="pwntools-${pkgver}"

prepare() {
  cd "${srcdir}/${_repodir}"
  # patch -Np1 < "${srcdir}/remove-argparse.patch"
}

package() {
  cd "${srcdir}/${_repodir}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m 644 LICENSE-pwntools.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm "${pkgdir}/usr/lib/python"*"/site-packages/LICENSE-pwntools.txt"

  # rename binaries to avoid filename confliction
  for bin in "${pkgdir}/usr/bin/"*; do
    msg "rename binary ${bin##*/} to pwn-${bin##*/}"
    mv "$bin" "${bin%/*}/pwn-${bin##*/}"
  done
}
