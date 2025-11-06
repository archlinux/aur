# Maintainer: Kevin Diu <kevindiujp@gmail.com>
pkgname=go-bin
pkgver=1.25.4
pkgrel=1
pkgdesc='Go programming language (binary release)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://go.dev/'
license=('BSD')
depends=('glibc')
makedepends=('curl')
provides=('go')
conflicts=('go')
options=('!strip')
source=()
sha256sums=()

pkgver() {
  local version
  version="$(curl -fsSL 'https://go.dev/VERSION?m=text' | head -n1 | tr -d '\r\n')"
  if [[ -z ${version} ]]; then
    printf 'Failed to detect Go version from go.dev\n' >&2
    return 1
  fi
  printf '%s\n' "${version#go}"
}

build() {
  cd "${srcdir}"

  local goos='linux'
  local goarch
  case "${CARCH}" in
    x86_64) goarch='amd64' ;;
    aarch64) goarch='arm64' ;;
    armv7h) goarch='armv6l' ;; # upstream distributes ARMv6 binary compatible with ARMv7
    *) printf 'Unsupported architecture: %s\n' "${CARCH}" >&2; return 1 ;;
  esac

  local version="go${pkgver}"
  local archive="${version}.${goos}-${goarch}.tar.gz"
  local url="https://go.dev/dl/${archive}"

  if [[ ! -f ${archive} ]]; then
    curl -fsSL "${url}" -o "${archive}.part"
    mv "${archive}.part" "${archive}"
  fi

  rm -rf go
  tar -xf "${archive}"
}

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/lib"
  cp -a go "${pkgdir}/usr/lib/go"

  install -dm755 "${pkgdir}/usr/bin"
  for tool in go gofmt; do
    ln -s "../lib/go/bin/${tool}" "${pkgdir}/usr/bin/${tool}"
  done

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 go/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
