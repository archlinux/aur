# Maintainer: Rodolfo Altenrath <rodolfoaltenrath@users.noreply.github.com>

pkgname=elo
pkgver=0.1.0
pkgrel=1
pkgdesc='Conecta Linux ao PJe/Projudi com Java 8 isolado e certificados digitais'
arch=('x86_64')
url='https://github.com/rodolfoaltenrath/elo'
license=('custom')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'nss'
  'pcsclite'
  'polkit'
)
makedepends=(
  'git'
  'go'
  'nodejs'
  'npm'
  'pkgconf'
)
optdepends=(
  'jre8-openjdk: execução de assinadores Java legados'
  'icedtea-web: abertura de arquivos .jnlp'
  'ccid: suporte a leitores smartcard CCID'
  'opensc: diagnóstico e leitura de certificados'
  'pcsc-tools: ferramentas de diagnóstico PC/SC'
)
source=("${pkgname}::git+${url}.git#branch=main")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"

  export npm_config_cache="${srcdir}/npm-cache"
  npm --prefix frontend ci
}

build() {
  cd "${srcdir}/${pkgname}"

  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"
  export npm_config_cache="${srcdir}/npm-cache"

  go run github.com/wailsapp/wails/v2/cmd/wails@v2.12.0 build -clean
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 build/bin/elo "${pkgdir}/usr/bin/elo"
  install -Dm644 build/appicon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/elo.png"
  install -Dm644 packaging/arch/elo.desktop "${pkgdir}/usr/share/applications/elo.desktop"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
