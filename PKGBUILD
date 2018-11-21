# Maintainer: Terin Stock <terinjokes@gmail.com>
# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: Ilkka Laukkanen <ilkka.s.laukkanen@gmail.com>

pkgname=stgit
pkgver=0.19
pkgrel=2
pkgdesc="Pushing/popping patches to/from a stack on top of Git, similar to Quilt"
url="http://www.procode.org/stgit/"
arch=('any')
license=('GPL')
depends=('python' 'git')
makedepends=('xmlto' 'asciidoc')
source=(
  "git+https://github.com/ctmarinas/stgit.git#tag=v${pkgver}"
)
sha256sums=('SKIP')

build() {
  cd "$srcdir"/$pkgname
  make doc
}

package() {
  cd "$srcdir"/$pkgname
  python setup.py install --root="$pkgdir" --prefix=/usr
  chmod 644 "$pkgdir"/usr/share/stgit/{completion/stgit-completion.bash,contrib/stgbashprompt.sh}

  mkdir -p "$pkgdir"/usr/share/bash-completion/completions
  cp "$pkgdir"/usr/share/stgit/completion/stgit-completion.bash "$pkgdir"/usr/share/bash-completion/completions/stg
  for manpage in ./Documentation/*.1; do
    install -D -m644 $manpage "$pkgdir"/usr/share/man/man1/$(basename $manpage)
  done
}
