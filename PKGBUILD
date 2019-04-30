# Maintainer: kpcyrd <git@rxv.cc>

_gitname=mig
pkgname=mig-console-git
pkgver=20170308.r501.g06bf434b
pkgrel=1
pkgdesc="MIG is Mozilla InvestiGator - a tool for remote system investigation at scale"
url="https://github.com/mozilla/mig"
depends=('readline')
makedepends=('go' 'git')
provides=('mig-console')
conflicts=('mig-console')
arch=('x86_64')
license=('MPL')
source=("git+https://github.com/mozilla/${_gitname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/^\([0-9]*\)-.*dev-/\1.r/;s/-/./g'
}

build() {
  cd "${_gitname}"
  export GOPATH="${PWD}/go"
  mkdir -p go/src/github.com/mozilla
  ln -sf "${PWD}" go/src/github.com/mozilla/mig
  make mig-cmd mig-console mig-action-generator mig-action-verifier mig-agent-search
}

package() {
  cd "${_gitname}"

  for bin in mig mig-action-generator mig-action-verifier mig-agent-search mig-console; do
    install -Dm755 "bin/linux/amd64/${bin}" "${pkgdir}/usr/bin/${bin}"
  done

  install -Dm644 doc/*.rst -t "${pkgdir}/usr/share/doc/${_gitname}"
}

# vim:set ts=2 sw=2 et:
