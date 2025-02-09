# Maintainer: dreieck

_pkgname='wiki2pdf'
pkgname="${_pkgname}-git"
epoch=2
pkgver=1.0.5.r6.20171207.19e936a
pkgrel=3
pkgdesc='Github Wiki to pdf Converter allows you to generate HTML & PDF documentation from your Github wiki or any other markdown-based wiki.'
arch=('any')
url='https://github.com/madajaju/wiki2pdf'
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'nodejs'
  'libfontconfig.so'
  'libfreetype.so'
  'libz.so'
  'wkhtmltopdf'
)
makedepends=(
  'git'
  'jshon' # To get package version
  'npm'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

source=(
  "${_pkgname}::git+https://github.com/madajaju/wiki2pdf.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  msg2 "Installing npm modules ..."
  npm install --cache "${srcdir}/npm-cache"
}

pkgver () {
  cd "${srcdir}/${_pkgname}"
  _ver="$(jshon -e version < package.json | tr -d '"')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm run build
}

package() {
  cd "${srcdir}/${_pkgname}"

  npm install -g --cache "${srcdir}/npm-cache" --prefix="${pkgdir}/usr" "$(npm pack . | tail -n1)"
  chown -R root:root "${pkgdir}"/*

  install -D -v -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.MIT.txt"
}
