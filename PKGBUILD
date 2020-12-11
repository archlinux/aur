# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=pulumi
pkgver=2.15.5
pkgrel=1
pkgdesc='Modern Infrastructure as Code'
arch=('x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f72b0af3bf67f92044e37e497bf94f0ec9c9c04e30ca393fff7ed2979ba6e57b')

_plugins=(
  "sdk/nodejs/cmd/pulumi-language-nodejs"
  "sdk/python/cmd/pulumi-language-python"
  "sdk/dotnet/cmd/pulumi-language-dotnet"
  "sdk/go/pulumi-language-go"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # Build the `pulumi` executable
  cd "${srcdir}/${pkgname}-${pkgver}/pkg"
  go build \
    -ldflags "-X github.com/pulumi/pulumi/pkg/v2/version.Version=${pkgver} -extldflags ${LDFLAGS}" \
    -o "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}" \
    "./cmd/${pkgname}" \

  # Build the plugins
  cd "${srcdir}/${pkgname}-${pkgver}/sdk"
  for plugin in "${_plugins[@]}"; do
    plugin_name=${plugin##*/}
    go build \
      -ldflags "-X github.com/pulumi/pulumi/pkg/v2/version.Version=${pkgver} -extldflags ${LDFLAGS}" \
      -o "${srcdir}/${pkgname}-${pkgver}/bin/${plugin_name}" \
      "./${plugin##sdk/}"
  done
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install all executables
  for f in ./bin/*; do
    install -D -m 755 "$f" "${pkgdir}/usr/bin/$(basename $f)"
  done

  # Generate Bash completion
  install -D -m 644 \
    <("${pkgdir}/usr/bin/${pkgname}" gen-completion bash) \
    "${pkgdir}/etc/bash_completion.d/${pkgname}"

  # Generate ZSH completion
  install -D -m 644 \
    <("${pkgdir}/usr/bin/${pkgname}" gen-completion zsh) \
    "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}

# vim:set ts=2 sw=2 et:
