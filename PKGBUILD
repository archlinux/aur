# Maintainer: Benjamin Denhartog <ben@sudoforge.com>

_pkgname=LanguageClient-neovim
pkgname=languageclient-neovim-bin
pkgver=0.1.161
pkgrel=1
pkgdesc="Language Server Protocol (LSP) support for Vim and NeoVim."
url="https://github.com/autozimu/LanguageClient-neovim"
provides=('languageclient-neovim')
license=('MIT')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "${url}/releases/download/${pkgver}/${pkgname%-neovim-bin}-${pkgver}-x86_64-unknown-linux-musl")
sha256sums=('0fc542e3f188ea998fdd74372d45f522be94614a04011cb11b244d81b25a738c'
            'eef99d2d7f63988fcfa23176dea5024a3e4c00b829929e273472063ebcec131f')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # Install the license file
  install -D -m 644 \
    "LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE.txt"

  # Install the executable to local bin/ directory to take advantage of
  # the iterative copying, below. `install` is used to ensure the correct
  # mode is set.
  install -D -m 755 \
    "${srcdir}/${pkgname%-neovim-bin}-${pkgver}-x86_64-unknown-linux-musl" \
    "bin/${pkgname%-neovim-bin}"

  # Create runtime directories
  install -d -m 755 "${pkgdir}/usr/share/vim/vimfiles"
  install -d -m 755 "${pkgdir}/usr/share/nvim/runtime"

  # Install vimfiles from the project into the appropriate runtime directories
  for d in autoload bin doc plugin rplugin; do
    case $d in
      rplugin)
        # vim doesn't have "remote plugins", so we only need to move this into
        # neovim's runtime directory
        cp -r "$d" "${pkgdir}/usr/share/nvim/runtime"
        ;;
      *)
        cp -r "$d" "${pkgdir}/usr/share/vim/vimfiles"
        cp -r "$d" "${pkgdir}/usr/share/nvim/runtime"
    esac
  done
}
