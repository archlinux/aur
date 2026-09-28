# Maintainer: Yoann Ono (aur@y0no.fr)

pkgname=ligolo-ng
pkgver=0.9.2
pkgrel=1
pkgdesc="An advanced, yet simple, tunneling/pivoting tool that uses a TUN interface."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/nicocha30/ligolo-ng"
source=("https://raw.githubusercontent.com/nicocha30/ligolo-ng/refs/heads/master/README.md")
conflicts=('ligolo-ng' 'ligolo' 'ligolo-ng-git')
provides=('ligolo-ng')
license=('GPL3')
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('e9d06817bf2e3e50e95e69310d67e7a2865feac0ed39eb76d693cc50350725f6')
install=${pkgname}.install

prepare() {
  export GOPATH="${srcdir}/gopath"
  go clean -modcache   
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"

  cd "${pkgname}-${pkgver}"

    go build -o proxy cmd/proxy/main.go
    
    for platform in linux windows; do
        for arch in amd64 arm64 arm; do
            # Go dropped the windows/arm (32-bit) port; skip it.
            [[ "${platform}" == "windows" && "${arch}" == "arm" ]] && continue
            GOOS=${platform} GOARCH=${arch} go build -o ${platform}/${arch}/agent cmd/agent/main.go
        done
    done
}

package() {
    cd "${pkgname}-${pkgver}"

    # Install proxy in an executable path
    mv proxy ${pkgname}
    install -Dm755 ${pkgname} -t "${pkgdir}/usr/bin/"

    # Install agent in a share path
    for platform in linux windows; do
        for arch in amd64 arm64 arm; do
            if [ -d "$platform/$arch" ] && [ "$(ls -A $platform/$arch)" ]; then
                install -Dm755 $platform/$arch/* -t "${pkgdir}/usr/share/${pkgname}/${platform}/${type}/${arch}"
            fi
        done
    done

    # Install documentation
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
