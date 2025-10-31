pkgname=moonbit-bin
pkgver=0.1.20251030
pkgrel=1
pkgdesc="Intelligent developer platform for Cloud and Edge using WASM"
arch=('x86_64')
url="https://www.moonbitlang.com/"
license=('unknown')
depends=('tar' 'glibc' 'gcc-libs' 'git')
provides=("moonbit")
conflicts=("moonbit")
options=('!debug')
_origin="https://cli.moonbitlang.com"
source=("https://cli.moonbitlang.cn/binaries/latest/moonbit-linux-x86_64.tar.gz"
        "https://cli.moonbitlang.cn/cores/core-latest.tar.gz"
        "moon.sh")

package() {
  # Install main runtime binary (kept under /usr/lib so the wrapper can live in /usr/bin)
  install -Dm 755 "${srcdir}/bin/moon" "${pkgdir}/usr/lib/moon"

  # Install wrapper CLI (moon.sh) as the user-facing /usr/bin/moon
  install -Dm 755 "${srcdir}/moon.sh" "${pkgdir}/usr/bin/moon"

  # Install all top-level executables from src/bin (except the main runtime and internal/)
  mkdir -p "${pkgdir}/usr/bin"
  for _f in "${srcdir}/bin/"*; do
    case "$(basename "$_f")" in
      moon) continue ;; # already installed to /usr/lib
      internal) continue ;; # packaged under share
      *.wasm) continue ;; # handled separately
    esac
    if [ -f "$_f" ]; then
      install -Dm 755 "$_f" "${pkgdir}/usr/bin/$(basename "$_f")"
    fi
  done

  # Place wasm/runtime assets and the language core into /usr/share/moonbit/lib
  mkdir -p "${pkgdir}/usr/share/moonbit/lib"
  # copy any wasm helpers from bin (if present)
  if compgen -G "${srcdir}/bin/*.wasm" >/dev/null 2>&1; then
    cp -a "${srcdir}/bin/"*.wasm "${pkgdir}/usr/share/moonbit/lib/"
  fi
  # copy the language core tree
  cp -a "${srcdir}/core" "${pkgdir}/usr/share/moonbit/lib/"

  # Install headers for developers who may build against the runtime
  if [ -d "${srcdir}/include" ]; then
    mkdir -p "${pkgdir}/usr/include/moonbit"
    cp -a "${srcdir}/include/"* "${pkgdir}/usr/include/moonbit/"
  fi

  # Install raw libs/objects into /usr/lib/moonbit (for debugging or embedding)
  if [ -d "${srcdir}/lib" ]; then
    mkdir -p "${pkgdir}/usr/lib/moonbit"
    cp -a "${srcdir}/lib/"* "${pkgdir}/usr/lib/moonbit/" || true
  fi

  # Internal tooling and packaged node assets go under /usr/share/moonbit/internal
  if [ -d "${srcdir}/bin/internal" ]; then
    mkdir -p "${pkgdir}/usr/share/moonbit/internal"
    cp -a "${srcdir}/bin/internal" "${pkgdir}/usr/share/moonbit/internal/"
  fi
}
sha256sums=('c8b1b39daedb64d3fa55364aeafc2d7e74d01564468b1a7145c3369742e6471b'
            'be6bdddcc13ccb232ace336ba96ba231117076b6683b4ac8e936a5777c9458ea'
            'a7ba404eb6995d8573e81fbe6c302fa5de96081585dc0420d29e4b419056c6a3')
