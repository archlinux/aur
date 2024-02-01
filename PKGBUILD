# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Contributor: Rudy Matela <rudy@matela.com.br>
#
#
# This package can coexist with the latest version of GHC provided in the
# standard Arch Linux repositories.  This package is useful for:
#
# * testing for forwards/backwards compatibility this specific GHC branch;
# * compiling programs that only work with this specific GHC branch;
# * as a dependency to packages that can only be compiled with this branch.
#
# If you would like to compile GHC yourself,
# you can use this package to bootstrap compilation.
#
#
# https://ghc.gitlab.haskell.org/ghc/doc/users_guide/intro.html#ghc-version-numbering-policy
# https://www.haskell.org/ghc/download.html
# https://www.haskell.org/ghc/download_ghc_8_0_2.html

pkgname=ghc8.0-bin
pkgver=8.0.2
pkgrel=2
_ver_branch=8.0
pkgdesc="Binary GHC ${_ver_branch} installed on /usr/bin/ghc-${_ver_branch}"
arch=('x86_64')
url='http://www.haskell.org/ghc/'
license=('BSD-3-Clause')
depends=('gcc' 'gmp' 'libffi' 'perl' 'ncurses5-compat-libs')
makedepends=('ghc' 'libxslt' 'docbook-xsl')
install='ghc.install'
provides=("ghc${_ver_branch}")
conflicts=("ghc${_ver_branch}")
_tarball="ghc-${pkgver}-${CARCH}-deb8-linux.tar.xz"
noextract=("${_tarball}")
source=("https://www.haskell.org/ghc/dist/${pkgver}/${_tarball}")
sha256sums=('5ee68290db00ca0b79d57bc3a5bdce470de9ce9da0b098a7ce6c504605856c8f')

prepare() {
  # for some reason, bsdtar cannot unpack this file:
  tar -xf "${_tarball}"
  # with "Skipping hardlink pointing to itself" errors
  # see https://wiki.archlinux.org/index.php/PKGBUILD#noextract
}

build() {
  cd ghc-${pkgver}

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/ghc-${_ver_branch}

  # pop LICENSE file out of the docs directory
  cp docs/users_guide/build-html/users_guide/_sources/license.txt LICENSE
}

package() {
  cd ghc-${pkgver}

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-${_ver_branch}
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-${_ver_branch}
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-${_ver_branch}
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-${_ver_branch}
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-${_ver_branch}
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-${_ver_branch}
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-${_ver_branch}
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-${_ver_branch}
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-${_ver_branch} instead

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-${_ver_branch}

  install -d            ${pkgdir}/usr/share/licenses/ghc-${_ver_branch}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-${_ver_branch}
}
