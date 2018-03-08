# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname=ryzen-stabilizator-git
_pkgname=ryzen-stabilizator
pkgver=r19.90a2f7a
pkgrel=1
pkgdesc="Simple Go program to enable/disable C6 C-state, processor boosting, address space layout
randomization (ASLR) and the Power Supply Idle Control workaround on an AMD Ryzen processor, in
order to help with the infamous 'MCE-random-reboots-while-idle' issue."
arch=("x86_64")
url="https://github.com/qrwteyrutiyoup/ryzen-stabilizator"
license=("Apache")
makedepends=(git go)
source=("${_pkgname}"::git+https://github.com/qrwteyrutiyoup/ryzen-stabilizator.git
        ryzen-stabilizator.conf
)
md5sums=('SKIP'
         '68ffee4082ac24a004eb981fcf685f35')
backup=('etc/ryzen-stabilizator/settings.toml')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export GOPATH="${srcdir}/go"
  rm -rf "${GOPATH}/src/github.com"
  mkdir -p "${GOPATH}/src"

  if [[ ! -e "${GOPATH}/src/${_pkgname}" ]]; then
    ln -s "${srcdir}/${_pkgname}" "${GOPATH}/src/${_pkgname}"
  fi
}

build() {
  export GOPATH="${srcdir}/go"
  cd "${GOPATH}/src/${_pkgname}"
  go get
  go build -ldflags "-X main.version=${pkgver}-${pkgrel}"
}

package() {
  cd "${_pkgname}"

  install -Dm 644 "${srcdir}/ryzen-stabilizator.conf" "${pkgdir}/etc/modules-load.d/ryzen-stabilizator.conf"
  for s in ryzen-stabilizator ryzen-stabilizator@boot ryzen-stabilizator@resume; do
    install -Dm 644 "${srcdir}/${_pkgname}/contrib/systemd/${s}.service" "${pkgdir}/usr/lib/systemd/system/${s}.service"
  done
  install -Dm 644 "${srcdir}/${_pkgname}/contrib/systemd/ryzen-stabilizator.target" "${pkgdir}/usr/lib/systemd/system/ryzen-stabilizator.target"
  install -Dm 644 "${srcdir}/${_pkgname}/contrib/settings.toml.sample" "${pkgdir}/etc/ryzen-stabilizator/settings.toml"
  install -Dm 644 "${srcdir}/${_pkgname}/contrib/settings.toml.sample" "${pkgdir}/etc/ryzen-stabilizator/settings.toml.sample"
  install -Dm 755 "${srcdir}/${_pkgname}/ryzen-stabilizator" "${pkgdir}/usr/bin/ryzen-stabilizator"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
