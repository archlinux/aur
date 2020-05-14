# Maintainer: Terin Stock <terinjokes@gmail.com>
# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: Ilkka Laukkanen <ilkka.s.laukkanen@gmail.com>

pkgname=stgit
pkgver=0.22
pkgrel=2
pkgdesc="Pushing/popping patches to/from a stack on top of Git, similar to Quilt"
url="http://www.procode.org/stgit/"
arch=('any')
license=('GPL2')
depends=('python' 'git')
makedepends=('xmlto' 'asciidoc')
source=(
  "https://github.com/stacked-git/stgit/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('394438e7f7de9fac2532632bd3e202137f9f8b6b91ad3667e467766571551bd0')

build() {
  cd "${pkgname}-${pkgver}"
  make doc
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --prefix=/usr
  chmod 644 "${pkgdir}/usr/share/stgit/contrib/stgbashprompt.sh"

  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d"

  ln -s "/usr/share/stgit/completion/stgit.bash" "${pkgdir}/usr/share/bash-completion/completions/stg"
  ln -s "/usr/share/stgit/completion/stgit.zsh" "${pkgdir}/usr/share/zsh/site-functions/_stg"
  ln -s "/usr/share/stgit/completion/stg.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/stg.fish"

  for manpage in ./Documentation/*.1; do
    install -D -m644 "${manpage}" "${pkgdir}/usr/share/man/man1/$(basename $manpage)"
  done

  install -d "${pkgdir}/usr/share/emacs/site-lisp"
  install -D -m644 ./contrib/stgit.el "${pkgdir}/usr/share/emacs/site-lisp"

  install -d "${pkgdir}/usr/share/vim/vimfiles/ftdetect"
  install -d "${pkgdir}/usr/share/vim/vimfiles/syntax"

  install -D -m644 ./contrib/vim/ftdetect/stg.vim "${pkgdir}/usr/share/vim/vimfiles/ftdetect"
  for vimsyntax in ./contrib/vim/syntax/*.vim; do
    install -D -m644 "${vimsyntax}" "${pkgdir}/usr/share/vim/vimfiles/syntax/$(basename $vimsyntax)"
  done
}
