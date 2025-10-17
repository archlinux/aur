#!/usr/bin/env bash
pkgname=ghprofile
pkgver=1.0.0
pkgrel=1
pkgdesc="Pretty GitHub profile viewer (prebuilt binaries)"
url="https://github.com/dayvster/ghrepo"
license=(MIT)
# Only Linux arches — we don't package Windows/Darwin on AUR
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
depends=()
makedepends=(curl)

github_base="https://github.com/dayvster/ghrepo/releases/download/v${pkgver}"

# SHA256 sums for the release-bin artifacts (linux-only)
declare -A sha256sums
sha256sums[ghprofile-linux-amd64]='3c65d1e487c8157e597bd0ff588f8667a6920f222eb8c3b718e94071e90eb792'
sha256sums[ghprofile-linux-arm64]='c3fd8a9184fca762ab7ffd460378fc0f588d3308c34fb97225dc2f68616dfd91'
sha256sums[ghprofile-linux-386]='e74a0ebe7c763bfefdc3d5af894c457d5c1d299692a76987cf3bedf95a4c6ee0'
sha256sums[ghprofile-linux-armv7]='103d2edee798783b5c03deab77ca369ba7083a0c30cd6e0cc05974d9120c0f93'

# We skip automatic source verification and perform manual checks instead
source=()
md5sums=('SKIP')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  case "$CARCH" in
    x86_64)
      binname="ghprofile-linux-amd64"
      ;;
    i686)
      binname="ghprofile-linux-386"
      ;;
    aarch64)
      binname="ghprofile-linux-arm64"
      ;;
    armv7h)
      binname="ghprofile-linux-armv7"
      ;;
    *)
      echo "Unsupported arch: $CARCH" >&2; return 1
      ;;
  esac

  url="${github_base}/${binname}"
  echo "Downloading ${url}"
  curl -L --fail -o "${srcdir}/${binname}" "${url}"

  # verify checksum
  expected=${sha256sums[${binname}]}
  if [ -z "$expected" ]; then
    echo "No checksum available for ${binname}; refusing to install" >&2
    return 1
  fi
  actual=$(sha256sum "${srcdir}/${binname}" | awk '{print $1}')
  if [ "$actual" != "$expected" ]; then
    echo "Checksum mismatch for ${binname}: expected ${expected}, got ${actual}" >&2
    return 1
  fi

  install -Dm755 "${srcdir}/${binname}" "${pkgdir}/usr/bin/ghprofile"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
