# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=patchy
pkgdesc='A CLI for generating and applying patches to git repositories'
pkgver=0.0.27
pkgrel=3
url="https://github.com/richardgill/patchy"
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('bun')
depends=('glibc' 'gcc-libs' 'icu')
options=(!strip) # does not support stripping
source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('38dd77910d24c96436ce7c417eeff9701f98e9ada2a1cb3cf92918ab0f62ed1f')

prepare() {
  cd "${pkgname}-${pkgver}"

  export CI=true
  bun install --frozen-lockfile
}

build() {
  cd "${pkgname}-${pkgver}"

  export PATCHY_VERSION="${pkgver}"
  bun run build --single
}

_arch() {
  case "${CARCH}" in
    x86_64)
      echo x64
      ;;
    aarch64)
      echo arm64
      ;;
    *)
      printf '\e[1;33m❌ Unsupported architecture\e[0m: \e[1m%s\e[0m\n' "${CARCH}" > /dev/stderr
      exit 1
      ;;
  esac
}

package() {
  cd "${pkgname}-${pkgver}"

  pkg="patchy-linux-$(_arch)"
  install -D -m755 -t "${pkgdir}"/usr/bin/ dist/"${pkg}"/bin/patchy
  install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}"/ README.md docs/*
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}"/ LICENSE
}
