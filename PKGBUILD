# Maintainer: robertfoster
pkgname=opencie-pkcs11
pkgver=1.2.1 # renovate: datasource=github-tags depName=M0Rf30/opencie-pkcs11
pkgrel=1
_podofover=1.1.2 # renovate: datasource=github-tags depName=podofo/podofo
pkgdesc="Native PKCS#11 library for the Italian Electronic Identity Card (CIE)"
arch=('x86_64' 'aarch64')
url="https://github.com/M0Rf30/opencie-pkcs11"
license=('LGPL-3.0-or-later')
# PoDoFo is pulled in (and statically linked) as a meson subproject — Arch's
# podofo is 0.10.x while the build needs >=1.1.0 — so it is not a runtime dep,
# but its own deps (jpeg/tiff/freetype/...) end up linked into the library.
depends=('openssl' 'pcsclite' 'curl' 'libxml2' 'fontconfig'
  'freetype2' 'libpng' 'openjpeg2' 'libjpeg-turbo' 'libtiff' 'zlib')
makedepends=('meson' 'ninja' 'cmake' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/M0Rf30/opencie-pkcs11/archive/refs/tags/$pkgver.tar.gz"
  "podofo-$_podofover.tar.gz::https://github.com/podofo/podofo/archive/refs/tags/$_podofover.tar.gz")
sha256sums=('ed77df6e1f3e52780dbb56e3bb61058eb7fa16e46860b3efb87151cdbf4d6453'
            'd6ffe6fc173ac6d6e5b00f5cb9db01990cab1bdf7cc03bdeffce3013bc9ec63a')

prepare() {
  # arch-meson runs with --wrap-mode=nodownload, so pre-seed the PoDoFo meson
  # subproject into the wrap cache (filename/hash must match libpodofo.wrap).
  install -d "$pkgname-$pkgver/subprojects/packagecache"
  cp "podofo-$_podofover.tar.gz" "$pkgname-$pkgver/subprojects/packagecache/"
}

build() {
  cd "$pkgname-$pkgver"
  # ccache breaks PoDoFo's meson CMake-subproject build: it can't create the
  # .o.d dependency files in the translated target dir. Disable it for the build.
  export CCACHE_DISABLE=1
  arch-meson build -Dtests=false
  meson compile -C build
}

package() {
  cd "$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
