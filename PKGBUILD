# Maintainer: Kubescape Maintainers <cncf hyphen kubescape hyphen maintainers at lists dot cncf dot io>

pkgname=kubescape
pkgver=3.0.11
pkgrel=0
epoch=0
pkgdesc="An open-source Kubernetes security platform for your IDE, CI/CD pipelines, and clusters."
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'pentium4')
url="https://github.com/kubescape/kubescape"
license=('Apache-2.0')
makedepends=('go>=2:1.20.0')
provides=('kubescape')
conflicts=('kubescape-bin')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e87f144977e7d24c4e501c1864e31950e3f5f37fdaaa9698ca66afcff4bd46666ec1a7421314f51f3d771b6511c223bb7a6e12973395cf0d26f3c6aa0cc8de52')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p ${PWD}/cache
  go build -buildmode=pie -buildvcs=false -ldflags="-s -w -X github.com/${pkgname}/${pkgname}/v3/core/cautils.BuildNumber=v${pkgver}" -o ${pkgname}
}

check() {
  # check that binary includes pkgver and git enabled
  if [ "$(./${pkgname}-${pkgver}/${pkgname} version)" != "Your current version is: v${pkgver}" ]; then
    exit 1
  fi
}

package() {
  cd "${pkgname}-${pkgver}"
  # Bash autocomplete file
  ./${pkgname} completion bash > ${pkgname}-autocomplete.sh
  install -Dm644 ${pkgname}-autocomplete.sh ${pkgdir}/usr/share/bash-completion/completions/${pkgname}

  # Zsh autocomplete file
  ./${pkgname} completion zsh > ${pkgname}-autocomplete.sh
  install -Dm644 ${pkgname}-autocomplete.sh ${pkgdir}/usr/share/zsh/vendor-completions/_${pkgname}

  # Fish autocomplete file
  ./${pkgname} completion fish > ${pkgname}-autocomplete.sh
  install -Dm644 ${pkgname}-autocomplete.sh ${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish
  
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # docs
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a docs -t "${pkgdir}/usr/share/doc/${pkgname}"
}
