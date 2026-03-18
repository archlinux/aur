# Maintainer: Agustin <agustinballesteros04@gmail.com>

pkgname=llmfit
pkgver=0.7.7
pkgrel=1
pkgdesc="CLI tool to tell which LLM models will run best on your hardware"
arch=('x86_64' 'aarch64')
url="https://github.com/AlexsJones/llmfit"
license=('MIT')

depends=('glibc')
makedepends=('git' 'rust' 'cargo' 'clang')

source=("git+https://github.com/AlexsJones/llmfit.git#tag=v${pkgver}")
sha256sums=('SKIP')

_setup_build_env() {
  export CC=clang
  export CXX=clang++

  case " ${CFLAGS:-} " in
    *" -ffat-lto-objects "*) ;;
    *) export CFLAGS="${CFLAGS:+${CFLAGS} }-ffat-lto-objects" ;;
  esac

  case " ${CXXFLAGS:-} " in
    *" -ffat-lto-objects "*) ;;
    *) export CXXFLAGS="${CXXFLAGS:+${CXXFLAGS} }-ffat-lto-objects" ;;
  esac

  case " ${RUSTFLAGS:-} " in
    *" -Clinker=clang "*) ;;
    *) export RUSTFLAGS="${RUSTFLAGS:+${RUSTFLAGS} }-Clinker=clang" ;;
  esac
}

build() {
  cd "${srcdir}/llmfit"
  _setup_build_env
  cargo build --release --locked
}

check() {
  cd "${srcdir}/llmfit"
  _setup_build_env
  cargo test --release --locked
}

package() {
  cd "${srcdir}/llmfit"
  install -Dm755 "target/release/llmfit" "${pkgdir}/usr/bin/llmfit"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
