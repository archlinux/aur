#Maintainer: dreieck
#Contributor: Gaetan Bisson <bisson@archlinux.org>
#Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=unison
_pkgver=2.48.4
_debianver="-1+b1"
pkgname="${_pkgname}-${_pkgver}-compat-bin"
pkgver="${_pkgver}"
pkgrel=6
pkgdesc="File-synchronization tool. Specific version ${_pkgver}, compatible with parallel installation to other versions of unison binaries (but pay attention to the local user configurations!). Prebuilt binary from debian, repackaged."
url='http://www.cis.upenn.edu/~bcpierce/unison/'
arch=(
  'x86_64'
)
license=('GPL-3.0-or-later')
depends=(
  'glibc'
)
optdepends=(
  "${_pkgname}-gtk=${pkgver}: For gtk2 GUI support."
)
provides=(
  "${_pkgname}-${_pkgver}=${pkgver}"
  "${_pkgname}-${_pkgver%.*}=${pkgver}"
  "${_pkgname}-${_pkgver}-compat=${pkgver}"
  "${_pkgname}-${_pkgver%.*}-compat=${pkgver}"
  "${_pkgname}-doc=${pkgver}"
)
conflicts=(
  "${_pkgname}-${pkgver%.*}"
)
source=(
  "https://archive.debian.org/debian/pool/main/${_pkgname:0:1}/${_pkgname}/${_pkgname}_${_pkgver}${_debianver}_amd64.deb"
  "unison-${_pkgver}-manual.pdf.zst"
  "unison-${_pkgver}-manual.html.zst"
)
sha256sums=(
  '3486bca59be0d6c72c83e5be0ef9b11c5f0e5c82e9a88db3ce6f675760b6a8fe'
  '9e12ae4f6f1835fafdf228ad867ce747785c70be071e3762603d317fdd1bf033'
  '8e575acd449428dce37f7694ac7a07ecc7294a602724bf3118b991fd84800535'
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
  rm -R "${pkgdir}/usr/share/bash-completion"  # Would conflict with other unison versions, and file is somehow "broken" anyway.

  ## Move license file into place
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/share/doc/unison/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/"

  for _docfiletype in html pdf; do
    install -Dm644 "${srcdir}/unison-${_pkgver}-manual.${_docfiletype}" "${pkgdir}/usr/share/doc/${_pkgname}/unison-manual.${_docfiletype}"
  done
  mv "${pkgdir}/usr/share/doc/unison" "${pkgdir}/usr/share/doc/unison-${_pkgver}" # Do the renaming here. This will capture both files installed from upstream as well as PDF and HTML which are added manually.
}
