# Maintainer: Hollow Man <hollowman at opensuse dot org>

pkgname=kubescape
pkgver=2.2.6
_git2gover=33.0.9
_libgit2ver=1.3.0
pkgrel=1
epoch=0
pkgdesc="An open-source Kubernetes security platform for your IDE, CI/CD pipelines, and clusters."
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'pentium4')
url="https://github.com/kubescape/kubescape"
license=('Apache-2.0')
makedepends=('go>=2:1.19.0' 'pkg-config' 'cmake' 'make')
provides=('kubescape')
conflicts=('kubescape-bin')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://github.com/libgit2/git2go/archive/v${_git2gover}/git2go-${_git2gover}.tar.gz"
  "https://github.com/libgit2/libgit2/archive/v${_libgit2ver}/libgit2-${_libgit2ver}.tar.gz")
sha512sums=('1c695741c91d9bcac73454fbada9d386ba69715cb4f6f03dc454187f3814c75450df91f222cae0205948cc2a230904aa12e89f70e3bc660a608fb0571932da49'
  '07d13cfd11396d2c36bc69ef4177e4962596bf92da3604f035a85940f98ae0d3614718b88fc0631c4c7007841a51deebd7da8c570c1c637d9fb5905995837519'
  '842a648a67ff23ba9e6bf14b706ba9081164866e14000ebf3858442b7046925f05e1dbf00a7d740dc4bf32280e260730e23a9492e817094aa90736ae335ee76e')
prepare() {
  cd "${pkgname}-${pkgver}"
  rm -rf git2go && mv ../git2go-${_git2gover} git2go
  rm -rf git2go/vendor/libgit2 && mv ../libgit2-${_libgit2ver} git2go/vendor/libgit2
}

build() {
  export CGO_ENABLED=1
  export GOCACHE=${PWD}/cache
  cd ${pkgname}-${pkgver}/git2go; make install-static; cd ..
  go build -buildmode=pie -buildvcs=false -ldflags="-s -w -X github.com/${pkgname}/${pkgname}/v2/core/cautils.BuildNumber=v${pkgver}" -tags=static,gitenabled -o ${pkgname}
}

check() {
  # check that binary includes pkgver and git enabled
  if [ "$(./${pkgname}-${pkgver}/${pkgname} version)" != "Your current version is: v${pkgver} [git enabled in build: true]" ]; then
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
