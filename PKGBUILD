# Maintainer: Sven Nobis <aur@sven.to>
# Previous Maintainer: Kubescape Maintainers <cncf hyphen kubescape hyphen maintainers at lists dot cncf dot io>

pkgname=kubescape
pkgver=4.0.19
pkgrel=1
epoch=0
pkgdesc="An open-source Kubernetes security platform for your IDE, CI/CD pipelines, and clusters."
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'pentium4')
url="https://github.com/kubescape/kubescape"
license=('Apache-2.0')
makedepends=('go>=2:1.20.0')
provides=('kubescape')
conflicts=('kubescape-bin')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('2db7e3a14260b6ff08cb1a38f705b7e4c0cfc0533a3609913aaa9b58e85cce8695fa7bd97b4a58b86c9181966c6e68a475143db23fafd4a4876c054685991a28')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p ${PWD}/cache
  BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  go build -buildmode=pie -buildvcs=false -ldflags="-s -w -X main.version=v${pkgver} -X main.date=${BUILD_DATE} -X github.com/kubescape/backend/pkg/versioncheck.Client=release" -o ${pkgname}
}

check() {
  # check that binary includes pkgver and git enabled
  if [ "$(./${pkgname}-${pkgver}/${pkgname} version | head -n 1)" != "Your current version is: v${pkgver}" ]; then
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
