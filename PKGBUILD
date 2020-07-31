# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Troy Engel <troyengel+arch@gmail.com>

pkgname=trace-cmd
pkgver=2.9.1
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
sha512sums=('186bfdd8ff1e88e9e6d3ae87b123f049892deaaa8d6a42944b6f8abee6b828946b88774029aa96daf4423a3dfc01b42835508f44f636dd02579ef9a8ef425131'
            'c9321b2b885d88557a057d7064690274799ab1d67a8babb78b1c54c4d81546fdea7313286cfd5fb9efbbcf87cf8394dcb17202ac88434a351aa652e7109e1db6')
b2sums=('f7aa2f12b2c90f35390857ed6f5818b74c42be36ce70835d86410f9f4931d27410123baaad007fa2795c1ba1f5bafc739db620f467ccc48021d774ee7be8a68d'
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
