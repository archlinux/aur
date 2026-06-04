# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
# Contributor: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Raphael Amorim <rapha850@gmail.com>

_pkgname=rio
pkgname=rio-nik
pkgver=0.4.6.nb.7
_tag="v0.4.6-nb.7"
pkgrel=1
pkgdesc="A hardware-accelerated GPU terminal emulator powered by WebGPU (nikicat's fork with fixes)"
arch=('x86_64')
url="https://github.com/nikicat/rio"
license=('MIT')
# https://raphamorim.io/rio/install/#arch-linux
options=('!lto')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=(
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libstdc++'
  'vulkan-driver'
)
makedepends=(
  'cargo'
  'cmake'
  'libxcb'
  'libxkbcommon'
  'python'
  'glslang'
  'scdoc'
)
_srcdir="${_pkgname}-${_tag#v}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha512sums=('fde93a37ff0a54758951412d8c18b2dfa4290d8cf5d56fadb8c712a6f4c197825e69dab5faafe9bfcefa4c06a889b230dee82f635b0e11137bd377faf3d307dc')

prepare() {
  cd "${_srcdir}"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${_srcdir}"
  cargo build --frozen --release --all-features
  make -C extra/man
}

check() {
  cd "${_srcdir}"
  cargo test --frozen --workspace
}

package() {
  cd "${_srcdir}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${_pkgname}/" "README.md"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" "LICENSE"
  install -vDm 644 "misc/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -vDm 644 "misc/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  install -vDm 644 "misc/com.rioterm.Rio.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
  install -vDm 644 extra/man/*.1 -t "$pkgdir/usr/share/man/man1/"
  install -vDm 644 extra/man/*.5 -t "$pkgdir/usr/share/man/man5/"
}

# vim: ts=2 sw=2 et:
