# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=python2-pwntools
pkgver=2.3.0
pkgrel=1
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
sha1sums=('bb15fb7365093e1ddc7417896843e5e3868bec72'
          '42ba67adb748fdc31a95ecb108814ca33eee5c36')

_repodir="pwntools-${pkgver}"

prepare() {
  cd "${srcdir}/${_repodir}"
  patch -Np1 < "${srcdir}/remove-argparse.patch"
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
