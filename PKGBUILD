# Maintainer: ramen <hendrik@hndrkk.sh>
# Contributor: Vincent Kobel (v@kobl.one)

_pkgname='bat'
pkgname="bat-cat-git"
pkgver=r2621.e828d784
pkgrel=2
pkgdesc="A cat(1) clone with wings."
arch=('x86_64')
url='https://github.com/sharkdp/bat'
license=('Apache-2.0')
makedepends=('git' 'rust' 'clang' 'bash' 'sed')
provides=('bat')
conflicts=('bat')
source=("git+https://github.com/sharkdp/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
  sed -i -e "s/^bat/.\/target\/release\/${_pkgname}/g" assets/create.sh
  sed -i -e "s/submodule_prompt=unspecified/submodule_prompt=yes/g" assets/create.sh
  bash assets/create.sh
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D ./target/release/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

