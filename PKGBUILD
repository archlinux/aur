# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Troy Engel <troyengel+arch@gmail.com>

pkgname=trace-cmd
pkgver=2.9
pkgrel=1
pkgdesc="Userspace tooling for the Linux kernel Ftrace internal tracer"
arch=('x86_64' 'aarch64')
url="https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git"
license=('GPL2' 'LGPL2.1')
depends=('audit' 'glibc')
makedepends=('python' 'swig' 'asciidoc')
optdepends=('python: for Python plugins')
source=("https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot/trace-cmd-v${pkgver}.tar.gz"
        "${pkgname}-2.9-make_install.patch")
sha512sums=('a37390e7ad29c9e7a97e5e7792505fe96a3802d6ea103e7c0f362a7b8cc29a102d483ec1a883b632fd9e0e7297f17866ae5eac59c825f08a8068b431a8f819e1'
            'c9321b2b885d88557a057d7064690274799ab1d67a8babb78b1c54c4d81546fdea7313286cfd5fb9efbbcf87cf8394dcb17202ac88434a351aa652e7109e1db6')
b2sums=('56421d7fded59b04466b3da7659df8059671a10c22dfc05610b63ee824288323e8935f18abc8a0e82288d12b1ec683bd54bca5047ca22a74b804dc3139792585'
        '8a644be295417b1fd5fb807285a7176ef0ceb737352bbb4c7a88441f9b955a90befe974d890a58f2b8fb6de8a68a1b3c5d207f057c4b08db79caf6e97fa66f50')

prepare() {
  mv -v "${pkgname}-v${pkgver}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "../${pkgname}-2.9-make_install.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  export PYTHON_VERS=python3
  make trace-cmd doc
}

package() {
  cd "${pkgname}-${pkgver}"
  make prefix="/usr" \
       DESTDIR="${pkgdir}/" \
       install install_doc
  install -vDm 644 tracecmd/${pkgname}.bash \
    "${pkgdir}/usr/share/bash/bash-completion/completions/${pkgname}"
  # removing python2 script
  rm -v "${pkgdir}/usr/lib/trace-cmd/python/event-viewer.py"
}
