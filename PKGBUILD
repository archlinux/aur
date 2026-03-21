# Maintainer: yuzujr <15568103056@163.com>

pkgname=ani2xcursor
pkgver=1.4.7
pkgrel=1
pkgdesc="Convert Windows animated cursor themes to Linux Xcursor format"
arch=('x86_64' 'aarch64')
url="https://github.com/yuzujr/ani2xcursor"
license=('MIT')

depends=('glibc')
makedepends=(
  'xmake'
  'gcc'
  'pkgconf'
  'gettext'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1fb843929e14e9782aef0ac2934de7a305770e349b43a0a3198d5472d19a5b36')

_xmake_env() {
  export XMAKE_GLOBALDIR="$srcdir/.xmake-global"
  export XMAKE_PKG_CACHEDIR="$srcdir/.xmake-cache"
  export XMAKE_PKG_INSTALLDIR="$srcdir/.xmake-packages"
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _xmake_env

  local _map="-ffile-prefix-map=${srcdir}=/usr/src/debug/${pkgname}-${pkgver} \
              -fmacro-prefix-map=${srcdir}=/usr/src/debug/${pkgname}-${pkgver}"

  xmake f -m release -y \
    --cflags="${CFLAGS} ${_map}" \
    --cxxflags="${CXXFLAGS} ${_map}" \
    --ldflags="${LDFLAGS}"

  xmake require -y spdlog
  xmake require -y stb
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _xmake_env

  xmake -y
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local _bin
  _bin="$(find build -type f -path '*/release/ani2xcursor' -print -quit)"
  if [[ -z "${_bin}" ]]; then
    echo 'ani2xcursor binary not found under build/*/release/' >&2
    return 1
  fi

  install -Dm755 "${_bin}" \
    "${pkgdir}/usr/bin/ani2xcursor"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 completions/fish/ani2xcursor.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/ani2xcursor.fish"

  install -Dm644 completions/bash/ani2xcursor \
    "$pkgdir/usr/share/bash-completion/completions/ani2xcursor"

  install -Dm644 completions/zsh/_ani2xcursor \
    "$pkgdir/usr/share/zsh/site-functions/_ani2xcursor"

  for mo in build/locale/*/LC_MESSAGES/ani2xcursor.mo; do
    lang=$(echo "$mo" | cut -d/ -f3)
    install -Dm644 "$mo" \
      "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/ani2xcursor.mo"
  done
}
