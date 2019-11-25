# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mercurial-stable-hg
pkgver=r43734.88a306478556
pkgrel=1
pkgdesc="Distributed source control management tool (development stable branch)"
arch=('i686' 'x86_64')
url="https://www.mercurial-scm.org/"
license=('GPL2')
depends=('glibc' 'python')
optdepends=('tk: for the hgk GUI')
makedepends=('mercurial' 'python-docutils')
provides=('mercurial')
conflicts=('mercurial')
backup=('etc/mercurial/hgrc')
source=("hg+https://www.mercurial-scm.org/repo/hg#branch=stable"
        "mercurial.profile::https://git.archlinux.org/svntogit/packages.git/plain/trunk/mercurial.profile?h=packages/mercurial")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "hg"

  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "hg"

  make all
  make -C "contrib/chg"
}

check() {
  cd "hg"

  #make tests
}

package() {
  cd "hg"

  python "setup.py" install \
    --optimize 1 \
    --root "$pkgdir"

  make DESTDIR="$pkgdir" PREFIX="/usr" -C "contrib/chg" install

  install -d "$pkgdir/usr/share/man"/{man1,man5}
  install -m644 "doc/hg.1" "$pkgdir/usr/share/man/man1"
  install -m644 doc/{hgrc.5,hgignore.5} "$pkgdir/usr/share/man/man5"

  install -m755 contrib/{hgk,hg-ssh} "$pkgdir/usr/bin"
  install -Dm644 "contrib/bash_completion" "$pkgdir/usr/share/bash-completion/completions/hg"
  install -Dm644 "contrib/zsh_completion" "$pkgdir/usr/share/zsh/site-functions/_hg"

  install -d "$pkgdir/usr/share/emacs/site-lisp"
  install -m644 contrib/{mq.el,mercurial.el} "$pkgdir/usr/share/emacs/site-lisp"

  install -Dm644 "contrib/vim/HGAnnotate.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/HGAnnotate.vim"

  install -Dm755 "$srcdir/mercurial.profile" "$pkgdir/etc/profile.d/mercurial.sh"

  # FS#38825 - Add certs config to package
  install -dm755 "$pkgdir/etc/mercurial"
  printf "\n[web]\ncacerts = /etc/ssl/certs/ca-certificates.crt\n" >> "$pkgdir/etc/mercurial/hgrc"
}
