# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=python2-pwntools
pkgver=2.2.0
pkgrel=5
pkgdesc='The CTF framework used by Gallopsled in every CTF'
arch=('any')
url='https://github.com/Gallopsled/pwntools/'
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
         'ropgadget')
conflicts=('python2-pwntools' 'python2-pwntools-git')
options=('strip')
source=("https://github.com/Gallopsled/pwntools/archive/${pkgver}.tar.gz"
        'remove-argparse.patch')
md5sums=('3ab358401ec751436f71633fb7476c28'
         'b0d3d53980787e7fd841526e4d92b194')

_repodir="pwntools-${pkgver}"

prepare() {
  cd "${srcdir}/${_repodir}"
  patch -Np1 < "${srcdir}/remove-argparse.patch"
  sed -i "s/'capstone==2.1'/'capstone'/" setup.py
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
