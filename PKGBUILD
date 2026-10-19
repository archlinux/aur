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
pkgver=2.9.0
pkgrel=1
pkgdesc="Lasso is a free software C library aiming to implement the Liberty Alliance standards. ID-WSF and SAML 2.0."
arch=('i686' 'x86_64')
url="http://lasso.entrouvert.org/"
license=('GNU')
depends=('libxml2' 'xmlsec' 'openssl' 'glib2' 'python>=3.14.0' 'python<3.15' 'perl>=5.44.0' 'perl<5.45.0')
makedepends=('perl' 'python-six')
source=("https://dev.entrouvert.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e195502ce41612c6b46280653b393220736bb629d41f81d6b399b21c6e08b22cdbb56430c152870dfba161b2dd00f08c30069507fdc38ed94846e84a11fdf4f3')

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
