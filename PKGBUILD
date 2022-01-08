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
  cd "${_realpkgname}-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  _builddate=$(date -u +%m/%d/%Y)

  go build -o build -trimpath -buildmode=pie -ldflags "-linkmode=external -extldflags \"${LDFLAGS}\" -X main.version=v${pkgver} -X main.build=${_builddate} -X main.usageMode=prod -s -w" -mod=readonly -modcacherw ./cmd/glab/main.go

  mkdir -p share/man
  make GLAB_VERSION="v${pkgver}" manpage

  "./build/main" completion -s bash | install -Dm644 /dev/stdin "share/bash-completion/completions/${_realpkgname}"
  "./build/main" completion -s zsh | install -Dm644 /dev/stdin "share/zsh/site-functions/_${_realpkgname}"
  "./build/main" completion -s fish | install -Dm644 /dev/stdin "share/fish/vendor_completions.d/${_realpkgname}.fish"
}

package() {
  cd "${_realpkgname}-$pkgver"
  install -Dm755 build/main "$pkgdir"/usr/bin/${_realpkgname}
  install -Dm644 $srcdir/${_realpkgname}-$pkgver/LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr"
  cp -r share/ "${pkgdir}/usr"
}
