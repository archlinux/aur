# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=gelfcat-git
pkgver=r6.7b422ae
pkgrel=1
pkgdesc="A command-line utility to send files to Graylog"
arch=('x86_64')
url="https://github.com/zooniverse/gelfcat"
license=('apache')
depends=('glibc')
makedepends=('git' 'go')
source=("${pkgname}"::"git+https://github.com/zooniverse/gelfcat.git"
        "graylog-golang-git"::"git+https://github.com/robertkowalski/graylog-golang"
        "gonx-git"::"git+https://github.com/zooniverse/gonx")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare()
{
  export GOPATH="${srcdir}"
  rm -rf "${srcdir}/src"
  install -d -m 755 "${srcdir}/src/github.com/robertkowalski"
  cp -r -f "${srcdir}/graylog-golang-git" "${srcdir}/src/github.com/robertkowalski/graylog-golang"
  install -d -m 755 "${srcdir}/src/github.com/zooniverse"
  cp -r -f "${srcdir}/gonx-git" "${srcdir}/src/github.com/zooniverse/gonx"
}

build()
{
  cd "${pkgname}"
  export GOPATH="${srcdir}"
  go build -o "${pkgname/-git/}"
}

package() {
  cd "${pkgname}"
  # Install launcher file
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "${pkgname/-git/}"
}
