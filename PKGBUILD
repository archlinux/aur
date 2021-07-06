# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mercurial-hg
pkgver=r47463.5fa083a5ff04
pkgrel=1
pkgdesc="Distributed source control management tool"
arch=('i686' 'x86_64')
url="https://www.mercurial-scm.org/"
license=('GPL2')
depends=('glibc' 'python')
makedepends=('mercurial' 'python-docutils' 'rust')
optdepends=('tk: for the hgk GUI')
provides=('mercurial')
conflicts=('mercurial')
backup=('etc/mercurial/hgrc')
source=("hg+https://www.mercurial-scm.org/repo/hg"
        "mercurial.profile::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/mercurial/trunk/mercurial.profile")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "hg"

  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "hg"

  export PYTHONHASHSEED=0
  make \
    PURE="--rust" \
    all
  make -C "contrib/chg"
}

check() {
  cd "hg"

  #make tests
}

package() {
  cd "hg"

  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    PURE="--rust" \
    install
  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    -C "contrib/chg" \
    install

  install -Dm755 contrib/{hgk,hg-ssh} -t "$pkgdir/usr/bin"
  install -Dm644 "contrib/bash_completion" "$pkgdir/usr/share/bash-completion/completions/hg"
  install -Dm644 "contrib/zsh_completion" "$pkgdir/usr/share/zsh/site-functions/_hg"

  install -Dm644 contrib/{mq.el,mercurial.el} -t "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm644 "contrib/vim/HGAnnotate.vim" -t "$pkgdir/usr/share/vim/vimfiles/syntax"

  install -Dm755 "$srcdir/mercurial.profile" "$pkgdir/etc/profile.d/mercurial.sh"

  # FS#38825 - Add certs config to package
  install -dm755 "$pkgdir/etc/mercurial"
  printf "[web]\ncacerts = /etc/ssl/certs/ca-certificates.crt\n" >> "$pkgdir/etc/mercurial/hgrc"
}
