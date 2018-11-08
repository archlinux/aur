# Maintainer: Alexander Kobel <a-kobel@a-kobel.de

pkgname=emacs-maplev
pkgver=2.37
pkgrel=1
pkgdesc="Emacs package for Maple developers"
arch=('any')
url="https://github.com/JoeRiel/maplev"
depends=('emacs')
makedepends=('unzip')
license=('GPL')
source=("${url}/archive/release-${pkgver}.tar.gz"
        "${url}/files/2046240/maplev-built.zip")
_source_git=("git+https://github.com/JoeRiel/maplev.git#tag=release-${pkgver}"
             "${url}/files/2046240/maplev-built.zip")
noextract=('maplev-built.zip')
sha256sums=('8dd16724c65a34293516fa498068edd609c4a13c0826763019327d8ed5f4f2ad'
            '1ef3264c6b33d846efccca6f4a807e821275f8b054857da33e1d06f32032aacb')
_sha256sums_git=('SKIP'
                 '1ef3264c6b33d846efccca6f4a807e821275f8b054857da33e1d06f32032aacb')

prepare() {
  cd "${srcdir}/maplev-release-${pkgver}/doc"
  # filter spurious complaints because this is not a git repo
  ./MakeVersion version.texi ${pkgver} 2> /dev/null

  cd "${srcdir}/maplev-release-${pkgver}"
  unzip -o "${srcdir}/maplev-built.zip"
  sed -i -e s/ginstall-info/install-info/ Makefile

  # avoid rebuilding files from maplev-built.zip
  touch maplev.mla doc/maplev.{html,info,pdf}
}

package() {
  cd "${srcdir}/maplev-release-${pkgver}"
  make install \
    VERSION=${pkgver} \
    LISP-DIR=${pkgdir}/usr/share/emacs/site-lisp/maple \
    INFO-DIR=${pkgdir}/usr/share/info \
    TOOLBOX-DIR=${pkgdir}/usr/share/emacs/site-lisp/maple/toolbox
}

_prepare_git() {
  cd "${srcdir}/maplev/doc"
  ./MakeVersion version.texi ${pkgver}

  cd "${srcdir}/maplev"
  unzip -o "${srcdir}/maplev-built.zip"
  sed -i -e s/ginstall-info/install-info/ Makefile

  # avoid rebuilding files from maplev-built.zip
  touch maplev.mla doc/maplev.{html,info,pdf}
}

_package_git() {
  cd "${srcdir}/maplev"
  make install \
    RELEASE=${pkgver} \
    LISP-DIR=${pkgdir}/usr/share/emacs/site-lisp/maple \
    INFO-DIR=${pkgdir}/usr/share/info \
    TOOLBOX-DIR=${pkgdir}/usr/share/emacs/site-lisp/maple/toolbox
}
