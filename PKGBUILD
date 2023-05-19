# Maintainer:  <me@sfxr.de>

pkgname=stack-static
_pkgver=2.11.1
pkgver=${_pkgver}
pkgrel=1
_vpref=''
pkgdesc="The Haskell Tool Stack (linked statically)"
arch=('x86_64')
url="https://github.com/commercialhaskell/stack"
license=('custom:BSD3')
provides=( stack=$pkgver )
conflicts=( stack stack-bin haskell-stack )
replaces=( stack stack-bin haskell-stack )
depends=( gmp gcc-libs zlib ) # needed for working ghc downloaded by stack
optdepends=(
  'bash-completion'
  "ncurses5-compat-libs: using older ghc's linking against libtinfo.so.5"
)
source=(
  "https://github.com/commercialhaskell/stack/releases/download/${_vpref}v${_pkgver}/stack-${_pkgver}-linux-x86_64-static.tar.gz"
  "https://github.com/commercialhaskell/stack/releases/download/${_vpref}v${_pkgver}/stack-${_pkgver}-linux-x86_64-static.tar.gz.asc"
)
sha256sums=('ebba4f236989d60332e6e20dc5f3d62a8e408e9f479ed6c6c594304fc239270a'
            'SKIP')
validpgpkeys=('C5705533DA4F78D8664B5DC0575159689BEFB442')

package() {
  cd "${srcdir}"
  local d="stack-${_pkgver}-linux-x86_64-static"
  mkdir -p "${pkgdir}"/usr/{bin,share/{doc,licenses}/"${pkgname}"}
  mkdir -p "${pkgdir}"/usr/share/{bash-completion/completions,fish/vendor_completions.d}
  cp "${d}/stack" "${pkgdir}/usr/bin"
  cp -R "${d}/doc/." "${pkgdir}/usr/share/doc/${pkgname}/"
  cp "${d}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  local stack=${d}/stack
  "$stack" --bash-completion-script stack >"$pkgdir"/usr/share/bash-completion/completions/stack
  "$stack" --fish-completion-script stack > "$pkgdir"/usr/share/fish/vendor_completions.d/stack.fish
  # conflicts with zsh-completion:
  # "$stack" --zsh-completion-script stack > "$pkgdir"/usr/share/zsh/site-functions/_stack
}

# vim:set ts=2 sw=2 et:
