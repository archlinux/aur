#Maintainer: dreieck
#Contributor: Gaetan Bisson <bisson@archlinux.org>
#Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=unison
_pkgver=2.48.4
_debianver="-1+b1"
pkgname="${_pkgname}-${_pkgver}-compat-bin"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc='File-synchronization tool. Specific version ${_pkgver}, compatible with parallel installation to other versions of unison binaries (but pay attention to the local user configurations!). Prebuilt binary from debian, repackaged.'
url='http://www.cis.upenn.edu/~bcpierce/unison/'
arch=(
  'x86_64'
)
license=('GPL2')
depends=(
  'glibc'
)
optdepends=(
  "${_pkgname}-gtk=${pkgver}: For gtk2 GUI support."
)
provides=(
  "${_pkgname}-${_pkgver}=${pkgver}"
  "${_pkgname}-${_pkgver%.*}=${pkgver}"
  "${_pkgname}-doc=${pkgver}"
)
conflicts=(
  "${_pkgname}-${pkgver%.*}"
)
source=(
  "http://ftp.de.debian.org/debian/pool/main/u/${_pkgname}/${_pkgname}_${_pkgver}${_debianver}_amd64.deb"
  "https://www.cis.upenn.edu/~bcpierce/unison/download/releases/${_pkgname}-${_pkgver}/unison-${_pkgver}-manual.pdf"
  "https://www.cis.upenn.edu/~bcpierce/unison/download/releases/${_pkgname}-${_pkgver}/unison-${_pkgver}-manual.html"
)
sha256sums=(
  '3486bca59be0d6c72c83e5be0ef9b11c5f0e5c82e9a88db3ce6f675760b6a8fe'
  'eaf9bf89967eb17c59b98f0a7ba6b6ff260b6c6de73277a633d954ceb42f5f93'
  '2b5674e2fd7751148784a716ce5a03f8cd0a321c8a3bd4343832ed9b83d2d404'
)

prepare() {
  _content="data.tar.xz"
  mkdir -p "${srcdir}/content"
  cd "${srcdir}/content"
  msg2 "Extracting ${_content} ..."
  bsdtar xf "${srcdir}/${_content}"
}

package() {
    cd "${srcdir}/content"

    cp -a "${srcdir}/content"/* "${pkgdir}"/

    rm -R "${pkgdir}/usr/bin/unison-latest-stable"
    rm -R "${pkgdir}/usr/share/doc-base"
    rm -R "${pkgdir}/usr/share/man/man1/unison-latest-stable.1.gz"

    for _docfile in "unison-${_pkgver}-manual".{html,pdf}; do
      install -D -m644 "${srcdir}/${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
    done
}
