# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

_pkgname=linear-cli
pkgname=linear-cli-schpet
pkgver=2.5.0
pkgrel=1
pkgdesc="Linear without leaving the command line: list, start, and create PRs for linear issues. Agent friendly. (Built from source)"
arch=('x86_64' 'aarch64')
url="https://github.com/schpet/linear-cli"
license=('ISC')
depends=('glibc')
makedepends=('deno')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/schpet/linear-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3f73a5530838bc1b89f01db94afd64dcad47715a56f8e0b2978afd25f45d79ef')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # DENO_DIR을 srcdir 내로 설정하여 사용자의 ~/.cache/deno 가 오염되는 것을 방지합니다.
  export DENO_DIR="${srcdir}/deno_dir"
  
  # graphql-codegen 등을 실행하여 필요한 파일과 타입들을 생성 및 다운로드 캐싱합니다.
  deno task codegen
}

build() {
  cd "${_pkgname}-${pkgver}"
  export DENO_DIR="${srcdir}/deno_dir"
  
  # Deno 코드를 독립 실행형(standalone) 바이너리로 컴파일합니다.
  deno compile --allow-all --output linear src/main.ts
}

package() {
  cd "${_pkgname}-${pkgver}"
  
  # 컴파일된 바이너리를 시스템 경로에 설치
  install -Dm755 linear -t "${pkgdir}/usr/bin/"
  
  # Generate and install shell completions
  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
  
  ./linear completions bash > "${pkgdir}/usr/share/bash-completion/completions/linear"
  ./linear completions fish > "${pkgdir}/usr/share/fish/vendor_completions.d/linear.fish"
  ./linear completions zsh > "${pkgdir}/usr/share/zsh/site-functions/_linear"
  
  # 문서 및 라이선스 설치
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
