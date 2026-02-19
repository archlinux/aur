# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mercurial-stable-hg
pkgver=r55194.d5fdd5a1dd0e
pkgrel=1
pkgdesc="Distributed source control management tool (development stable branch)"
arch=('i686' 'x86_64')
url="https://www.mercurial-scm.org/"
license=('GPL-2.0-or-later')
depends=('glibc' 'libgcc' 'python')
makedepends=('mercurial' 'cargo' 'python-docutils' 'python-pip' 'python-setuptools-scm')
optdepends=('tk: for the hgk GUI')
provides=("mercurial=$pkgver")
conflicts=('mercurial')
backup=('etc/mercurial/hgrc')
source=("hg+https://foss.heptapod.net/mercurial/mercurial-devel#branch=stable"
        "mercurial.profile::https://gitlab.archlinux.org/archlinux/packaging/packages/mercurial/-/raw/main/mercurial.profile")
sha256sums=('SKIP'
            'SKIP')


pkgver() {
  cd "mercurial-devel"

  _rev=$(hg identify -n)
  _hash=$(hg identify -i)
  printf "r%s.%s" "$_rev" "$_hash"
}

build() {
  cd "mercurial-devel"

  make \
    PURE="--rust" \
    -C "contrib/chg"
}

check() {
  cd "mercurial-devel"

  #make tests
}

package() {
  cd "mercurial-devel"

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
