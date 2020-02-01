# Maintainer: Vincent Kobel (v@kobl.one)

_pkgname='bat'
pkgname="bat-cat-git"
pkgver=r868.e5c4155
pkgrel=4
pkgdesc="A cat(1) clone with wings."
arch=('x86_64')
url='https://github.com/sharkdp/bat'
license=('Apache-2.0')
sha256sums=('SKIP')
source=("git+https://github.com/sharkdp/${_pkgname}")
provides=('bat')
makedepends=('git' 'rust' 'clang' 'bash' 'sed')

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
  cargo build --release
  install -D ./target/release/${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

