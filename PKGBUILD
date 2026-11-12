# Maintainer: agony <27015 at riseup dot net>

pkgname=pixtuoid-bin
pkgver=0.22.0
pkgrel=1
pkgdesc='Terminal pixel-art office for AI coding agents (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/pixtuoid/pixtuoid'
license=('MIT')
depends_aarch64=('glibc' 'libgcc')
optdepends_aarch64=('libxkbcommon: floating window'
                    'wayland: floating window on Wayland'
                    'libx11: floating window on X11'
                    'libxcursor: floating window on X11'
                    'libxi: floating window on X11'
                    'libxkbcommon-x11: floating window on X11'
                    'vulkan-icd-loader: floating window with Vulkan, OpenGL without it'
                    'libglvnd: floating window with OpenGL')
provides=("pixtuoid=${pkgver}")
conflicts=('pixtuoid')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("${_release}/pixtuoid-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${_release}/pixtuoid-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('bc752d9265545e86b0c593308ac0c6875cd923fbaa8e4760ea5a6ea26c324e91')
sha256sums_aarch64=('f489dbbbbbe02e99c823bc3a55625be86b24dcd7b686edbd2d4a7d5a9140c4af')

_home_env() {
  export HOME="${srcdir}/home"
  export XDG_CONFIG_HOME="${HOME}/.config"
  export XDG_DATA_HOME="${HOME}/.local/share"
  export XDG_STATE_HOME="${HOME}/.local/state"
  export XDG_CACHE_HOME="${HOME}/.cache"
}

build() {
  cd pixtuoid-v"${pkgver}"-"${CARCH}"-unknown-linux-*/
  _home_env
  for shell in bash fish zsh; do
    ./pixtuoid completions "${shell}" > "${srcdir}/completion.${shell}"
  done
  ./pixtuoid man > "${srcdir}/pixtuoid.1"
}

package() {
  cd pixtuoid-v"${pkgver}"-"${CARCH}"-unknown-linux-*/
  install -Dm755 pixtuoid pixtuoid-hook -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/pixtuoid.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 "${srcdir}/completion.bash" "${pkgdir}/usr/share/bash-completion/completions/pixtuoid"
  install -Dm644 "${srcdir}/completion.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/pixtuoid.fish"
  install -Dm644 "${srcdir}/completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_pixtuoid"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
