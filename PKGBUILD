# Maintainer: agony <27015 at riseup dot net>
# Contributor: Max Mazurov <fox.cpp at disroot dot org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=maddy
pkgver=0.9.7
pkgrel=1
pkgdesc='Composable all-in-one mail server'
arch=('x86_64' 'aarch64')
url='https://github.com/foxcpp/maddy'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go' 'scdoc')
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

prepare() {
  cd "${pkgname}-${pkgver}-src"
  export GOPATH="${srcdir}/gopath"
  go mod download -x -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}-src"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-v -buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  ./build.sh --version "${pkgver}" build
}

check() {
  cd "${pkgname}-${pkgver}-src"
  export GOPATH="${srcdir}/gopath"
  export GOFLAGS='-buildvcs=false -mod=readonly -modcacherw'
  go test ./...
  go build -tags debugflags -o build/maddy-debugflags ./cmd/maddy
  cd tests
  go test -tags integration -integration.executable "${srcdir}/${pkgname}-${pkgver}-src/build/maddy-debugflags"
}

package() {
  cd "${pkgname}-${pkgver}-src"
  ./build.sh --prefix /usr --destdir "${pkgdir}/" install
  sed -i -e 's!/usr/local/bin!/usr/bin!' -e 's!^ReadOnlyPaths=/usr/lib/maddy$!ReadOnlyPaths=-/usr/lib/maddy!' \
    "${pkgdir}/usr/lib/systemd/system/maddy.service" "${pkgdir}/usr/lib/systemd/system/maddy@.service"
  install -Dm644 "${srcdir}/maddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/maddy.conf"
  install -Dm644 "${srcdir}/maddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/maddy.conf"
}
