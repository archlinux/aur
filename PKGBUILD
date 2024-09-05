# Maintainer: Nikola Ivačič <nikola.ivacic@dropchop.com>
# Maintainer: Dan Fuhry <dan@fuhry.com>
# vim: set ts=2 sw=2 et:
### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=lasso
pkgver=2.8.2
pkgrel=3
pkgdesc="Lasso is a free software C library aiming to implement the Liberty Alliance standards. ID-WSF and SAML 2.0."
arch=('i686' 'x86_64')
url="http://lasso.entrouvert.org/"
license=('GNU')
depends=('libxml2' 'xmlsec' 'openssl')
makedepends=('perl' 'python-six')
source=("https://dev.entrouvert.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "0001-stop-using-deprecated-symbols.patch"
        "0002-libxml-2.12-compat.patch")
sha512sums=('f56b5fef68fd1e6025a7cfb0f84d65be9ddf195f0e80d38d60c31d43fcd4377be5a0d67140bc654c224331230f06c10e4eb498671a10ebfadc1d93decadf4c72'
            '283000ee20a14efd42e65ed6d6c0358889e3aab54095c68caf7f10b15adc55a050c452c8b10a0dd8c750927b6971f182b044558ae3f426018363b55e73852d81'
            'cba8551b9bae428bd9c779a657d0898bfca8a0a649f394009a41538e3b9d975be8d4f5c2a7cfacf1023561132302428404fe290941124c8b77d650b607ce4547')

prepare() {
  for f in "${source[@]}"; do
    if test "${f%.patch}" != "${f}"; then
      msg "Applying patch: $f"
      cd "${srcdir}/${pkgname}-${pkgver}"
      patch -Np1 -i "${srcdir}/${f}"
    fi
  done
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-tests
  make CFLAGS="-g -O2 -w" CXXFLAGS="${CFLAGS}"
}

package() {
  cd "${pkgname}"-"${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README  "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
