# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Troy Engel <troyengel+arch@gmail.com>

pkgname=trace-cmd
pkgver=2.8.3
pkgrel=3
pkgdesc="Userspace tooling for the Linux kernel Ftrace internal tracer"
arch=('x86_64' 'aarch64')
url="https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git"
license=('GPL2' 'LGPL2.1')
depends=('audit' 'glibc')
makedepends=('python' 'swig' 'asciidoc')
optdepends=('python: for Python plugins')
source=("https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot/trace-cmd-v${pkgver}.tar.gz")
sha512sums=('51166c4276abda209a099cc6fe9081ad6d403cbfd9d4a53bc5bb068392327e88fe647e9324a527e68730d73d1a5f7f74126718547f94c652bb12e51c7518a58b')

prepare() {
  mv -v "${pkgname}-v${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  export PYTHON_VERS=python3
  make trace-cmd doc
}

package() {
  cd "${pkgname}-${pkgver}"
  make prefix="/usr" DESTDIR="${pkgdir}/" install install_doc
  # removing python2 script
  rm -v "${pkgdir}/usr/lib/trace-cmd/python/event-viewer.py"
  # installing bash completion to correct location and removing /etc
  install -vDm 644 "${pkgdir}/etc/bash_completion.d/trace-cmd.bash" \
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  rm -rv "${pkgdir}/etc"
  # remove unrelated documentation
  rm -vrf "${pkgdir}/usr/share/kernelshark"
  rm -vf "${pkgdir}/usr/share/man/man1/kernelshark.1"
}
