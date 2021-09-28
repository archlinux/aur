# Maintainer: w0rty <mawo97 at gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitlab-glab
_realpkgname=glab
pkgver=1.21.1
pkgrel=1
pkgdesc='Gitlab Cli tool to help work seamlessly with Gitlab from the command line'
arch=('x86_64')
url="https://github.com/profclems/glab"
license=('MIT')
makedepends=('go')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('878c13d064ca6010437de90ca3711962fd87441fcae39bf01cb0af5aa5efd79e')

prepare(){
  cd "${_realpkgname}-${pkgver}"
  mkdir -p build/
}

build() {
  export GOPATH="$srcdir"/gopath
  cd "${_realpkgname}-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  _builddate=$(date -u +%m/%d/%Y)
  go build -o build -trimpath -buildmode=pie -ldflags "-linkmode=external -extldflags \"${LDFLAGS}\" -X main.version=v${pkgver} -X main.build=${_builddate} -X main.usageMode=prod -s -w" -modcacherw ./cmd/glab/main.go
}

package() {
  cd "${_realpkgname}-$pkgver"
  install -Dm755 build/main "$pkgdir"/usr/bin/${_realpkgname}
  install -Dm644 $srcdir/${_realpkgname}-$pkgver/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions" \
                  "${pkgdir}/usr/share/zsh/site-functions" \
                 "${pkgdir}/usr/share/fish/vendor_completions.d"
  "${pkgdir}/usr/bin/${_realpkgname}" completion -s bash > "${pkgdir}/usr/share/bash-completion/completions/${_realpkgname}"
  "${pkgdir}/usr/bin/${_realpkgname}" completion -s zsh > "${pkgdir}/usr/share/zsh/site-functions/_${_realpkgname}"
  "${pkgdir}/usr/bin/${_realpkgname}" completion -s fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${_realpkgname}.fish"
}
