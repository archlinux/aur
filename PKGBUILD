# Maintainer: Chris Billington <chrisjbillington@gmail.com>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=mercurial-python3
_pkgname=mercurial
pkgver=5.3.1
pkgrel=1
pkgdesc='A scalable distributed SCM tool - built with Python 3'
arch=(x86_64)
url="https://www.mercurial-scm.org/"
license=(GPL)
provides=(mercurial=$pkgver)
conflicts=(mercurial)
depends=(python)
optdepends=('tk: for the hgk GUI')
backup=(etc/mercurial/hgrc)
source=(https://www.mercurial-scm.org/release/${_pkgname}-${pkgver}.tar.gz
        mercurial.profile)
sha256sums=('f7c1f96de2199d6b38593ea865f08c0521fbd8e2fd52bd332414bf9fe5bf72d9'
            '87427151713e689cd87dc50d50c048e0e58285815e4eb61962b50583532cbde5')

build() {
  cd $_pkgname-$pkgver/contrib/chg
  make
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -d "$pkgdir/usr/share/man/"{man1,man5}
  install -m644 doc/hg.1 "$pkgdir/usr/share/man/man1"
  install -m644 doc/{hgrc.5,hgignore.5} "$pkgdir/usr/share/man/man5"
  install -m644 -D contrib/zsh_completion "$pkgdir/usr/share/zsh/site-functions/_hg"
  install -m644 -D contrib/bash_completion "$pkgdir/usr/share/bash-completion/completions/hg"

  make -C contrib/chg DESTDIR="$pkgdir" PREFIX=/usr install
  install -m755 contrib/hg-ssh "$pkgdir/usr/bin"
  install -m755 contrib/hgk "$pkgdir/usr/bin"

  install -d "$pkgdir/usr/share/emacs/site-lisp"
  install -m644 contrib/{mq.el,mercurial.el} "$pkgdir/usr/share/emacs/site-lisp"

  install -Dm644 contrib/vim/HGAnnotate.vim \
    "$pkgdir/usr/share/vim/vimfiles/syntax/HGAnnotate.vim"

  # set some variables
  install -m755 -d "$pkgdir/etc/profile.d"
  install -m755 "$srcdir/mercurial.profile" "$pkgdir/etc/profile.d/mercurial.sh"

  # FS#38825 - Add certs config to package
  install -m755 -d "$pkgdir/etc/mercurial"
  cat <<-EOF > "$pkgdir/etc/mercurial/hgrc"
	[web]
	cacerts = /etc/ssl/certs/ca-certificates.crt
	EOF
}
