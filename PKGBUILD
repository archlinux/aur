# Maintainer: agony <27015 at riseup dot net>
# Contributor: Max Mazurov <fox.cpp at disroot dot org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=maddy
pkgver=0.9.7
pkgrel=1
pkgdesc='Composable all-in-one mail server'
arch=('x86_64')
url='https://github.com/foxcpp/maddy'
license=('GPL3')
depends=('glibc')
makedepends=('go' 'git' 'scdoc')
backup=('etc/maddy/maddy.conf')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.zst"
        "${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.zst.sig"
        'maddy.sysusers'
        'maddy.tmpfiles')
sha256sums=('c66d2a561cb0f0017a78cf1df3f02a48046e1e346a432970cede516ae536f4a7'
            'SKIP'
            '5f1f6f5fcaf9b75742323c0008ec586bcfd7213a2d700eb85fa05474384b6a44'
            '656ada3e302fedacaaec4f019c368488151c6252367c41cb1c2b2068555a7026')
validpgpkeys=('3197BBD95137E682A59717B434BB2007081396F4')

build() {
  cd "${pkgname}-${pkgver}-src"
  export GOPATH="${srcdir}/gopath"
  ./build.sh --version "${pkgver}" build
  chmod -R +w "${GOPATH}"
}

check() {
  cd "${pkgname}-${pkgver}-src"
  export GOPATH="${srcdir}/gopath"
  go test ./...
  cd tests
  ./run.sh
  chmod -R +w "${GOPATH}"
}

package() {
  cd "${pkgname}-${pkgver}-src"
  ./build.sh --prefix /usr --destdir "${pkgdir}/" install
  sed -i -e 's!/usr/local/bin!/usr/bin!' \
    "${pkgdir}/usr/lib/systemd/system/maddy.service" "${pkgdir}/usr/lib/systemd/system/maddy@.service"
  install -Dm644 "${srcdir}/maddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/maddy.conf"
  install -Dm644 "${srcdir}/maddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/maddy.conf"
}
