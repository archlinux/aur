# Maintainer: Thierry Delafontaine <delafontaineth AT pm DOT me>

pkgname=rust_hdl-git
_pkgname=rust_hdl
pkgver=v0.19.0.r0.gdd25382
pkgrel=1
pkgdesc="A collection of of HDL related tools"
arch=('i686' 'x86_64')
url="https://github.com/VHDL-LS/rust_hdl"
license=('MPL2')
makedepends=('git' 'rust')
provides=("rust_hdl=${pkgver}")
source=("git+https://github.com/VHDL-LS/${_pkgname}.git"
  "installed.patch")
sha256sums=('SKIP'
  '0b237e7a6a8b66f77c3f7f1c19b214f6ef711290d67a4c9fa9acfe4fee1c3f05')

pkgver()
{
  cd "${_pkgname}"
  _tag=$(git tag -l --sort -v:refname | grep 'v' | head -n1)
  _rev=$(git rev-list --count ${_tag}..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "${_tag}" "${_rev}" "${_hash}" | sed 's/^rust_hdl-//'
}

prepare()
{
  patch --directory="${_pkgname}" --forward --strip=1 --input="${srcdir}/installed.patch"
}

check()
{
  cd "${_pkgname}"
  cargo test --all-features --release
}

package()
{
  cd "${_pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  mkdir -p "${pkgdir}/usr/lib/${_pkgname}"
  cp -r "vhdl_libraries" "${pkgdir}/usr/lib/${_pkgname}"
  cd "${srcdir}/${_pkgname}/vhdl_lang"
  cargo install \
    --no-track \
    --locked \
    --features "installed" \
    --root "${pkgdir}/usr" \
    --path .
  cd "${srcdir}/${_pkgname}/vhdl_ls"
  cargo install \
    --no-track \
    --locked \
    --features "installed" \
    --root "${pkgdir}/usr" \
    --path .
}
