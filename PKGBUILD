# Maintainer: Thayne McCombs <bytecurry.software@gmail.com>
pkgname=openbao
pkgver=2.0.2
# NOTE: this commit should match the commit of the release version
_commit='700fe3f27ab1f0ec39ce20c36f6d9d97c9fe6ac3'
pkgrel=1
pkgdesc="solution to manage, store, and distribute sensitive data"
arch=("x86_64")
url="https://openbao.org"
license=('MPL-2.0')
depends=(glibc)
makedepends=(go go-tools)
optdepends=()
options=()
install=openbao.install
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/openbao/openbao/archive/refs/tags/v$pkgver.tar.gz"
  openbao.hcl
  openbao.sysusers
  openbao.tmpfiles
)
sha256sums=('fe084620aa33b3115dd1c1d596bdd927ba0fccf72926a3e8fd3e9a26e2de7a75'
            'b26bf539f6f8b05a77afed4ba0e05d6012322474703265bc2977dafadaf22d38'
            '0b8a4fa3f09ee89a1383f2ce0eb4acc6b16beebbc7f034b23c6069dfe8a43cc1'
            '6009313cb0aa0b47fe330bdc8a40b9d8ce9142814f4cc61a9d58ab410b8f746a')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|/etc/openbao/openbao.env|/etc/default/openbao|g' .release/linux/package/usr/lib/systemd/system/openbao.service

}

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  local _build_date="$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X github.com/openbao/openbao/version.Version=${pkgver} -X github.com/openbao/openbao/version.GitCommit=${_commit} -X github.com/openbao/openbao/version.BuildDate=${_build_date}" \
    -tags openbao \
    -o dist/bao \
    .
}

package() {
  install -Dm644 "${srcdir}/openbao.hcl" "${pkgdir}/etc/openbao/openbao.hcl"
  install -Dm644 "${srcdir}/openbao.sysusers" "${pkgdir}/usr/lib/sysusers.d/openbao.conf"
  install -Dm644 "${srcdir}/openbao.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/openbao.conf"

  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 .release/linux/package/etc/openbao/openbao.env "${pkgdir}/etc/default/openbao"
  install -Dm644 .release/linux/package/usr/lib/systemd/system/openbao.service "${pkgdir}/usr/lib/systemd/system/openbao.service"

  install -Dm755 dist/bao "$pkgdir/usr/bin/bao"

  for file in README.md CHANGELOG.md; do
    install -Dm644 "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
  done
}
