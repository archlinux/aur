# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=carp
pkgname=${_pkgname}-git
pkgver=v0.3.0.r198.g6954642c
pkgrel=1
pkgdesc="A statically typed lisp, without a GC, for real-time applications."
arch=(x86_64)
url="https://github.com/carp-lang/Carp"
license=('Apache')
depends=('gcc')
makedepends=('gcc' 'stack')
provides=('carp')
conflicts=('carp')
source=(
    "${_pkgname}::git://github.com/carp-lang/Carp.git"
    'wrapper'
)
sha512sums=('SKIP'
            '4421fa7d2db996b4101bc8ee189c1ecb081469826d7cb540c346ed1bdd47c03563f8b52aeef6b033e6bba438f86700855157dd178df72bcca30e40ea4fe61e07')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  export STACK_ROOT="${srcdir}/.stack"
  stack build
}

check() {
  cd "${_pkgname}"

  export STACK_ROOT="${srcdir}/.stack"
  stack test
}

package() {
  cd "${_pkgname}"

  export STACK_ROOT="${srcdir}"/.stack

  stack --local-bin-path="${pkgdir}"/usr/lib/carp/bin install

  install -dm0755 "${pkgdir}"/usr/bin
  for binary in "${pkgdir}"/usr/lib/carp/bin/*; do
    binary=${binary/$pkgdir/}
    sed "s/%BINARY%/${binary//\//\\\/}/g" "${srcdir}/wrapper" > "${pkgdir}"/usr/bin/$(basename $binary)
    chmod +x "${pkgdir}"/usr/bin/$(basename $binary)
  done

  install -dm0755 "${pkgdir}"/usr/lib/carp/core
  install -m0644 -t "${pkgdir}"/usr/lib/carp/core core/*

  install -dm0755 "${pkgdir}"/usr/share/carp/{docs/core,examples,img}
  install -m0644 -t "${pkgdir}"/usr/share/carp/docs/core docs/core/*
  install -m0644 -t "${pkgdir}"/usr/share/carp/examples examples/*
  install -m0644 -t "${pkgdir}"/usr/share/carp/img img/*

  install -dm0755 "${pkgdir}"/usr/share/emacs/site-lisp
  install -m0644 -t "${pkgdir}"/usr/share/emacs/site-lisp emacs/*

  ln -sf core_index.html "${pkgdir}"/usr/share/carp/docs/core/index.html
}
