# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=pulumi
pkgver=1.14.0
pkgrel=1
pkgdesc='Modern Infrastructure as Code'
arch=('x86_64')
url="https://github.com/$pkgname/$pkgname"
license=('GPL')
depends=('glibc')
makedepends=(
  'git'
  'go-pie'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('37ef213c8b273864a4331a3f5f6bcfa5062d34894614e27869a8e79496f38f9e')

_plugins=(
  "sdk/nodejs/cmd/pulumi-language-nodejs"
  "sdk/python/cmd/pulumi-language-python"
  "sdk/dotnet/cmd/pulumi-language-dotnet"
  "sdk/go/pulumi-language-go"
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Build the `pulumi` executable
  pushd "pkg" > /dev/null && go build \
    -trimpath \
    -ldflags "-X github.com/pulumi/pulumi/pkg/version.Version=${pkgver} -extldflags ${LDFLAGS}" \
    -o "${srcdir}/${pkgname}-${pkgver}/bin/${pkgname}" \
    "./cmd/${pkgname}" \
  && popd > /dev/null

  # Build the plugins
  for plugin in ${_plugins[@]}; do
    plugin_name="${plugin##*/}"

    pushd "sdk" > /dev/null && go build \
      -trimpath \
      -ldflags "-X github.com/pulumi/pulumi/pkg/version.Version=$pkgver -extldflags $LDFLAGS" \
      -o "${srcdir}/${pkgname}-${pkgver}/bin/${plugin_name}" \
      "./${plugin##sdk/}" \
    && popd > /dev/null
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
