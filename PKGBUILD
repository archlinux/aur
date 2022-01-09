# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: fauno <fauno at kiwwwi.com.ar>
# Contributor: Olivier Ramonat <olivier at ramonat dot fr>
# Contributor: Richard Murri <admin@richardmurri.com>

pkgbase=notmuch-git
arch=('i686' 'x86_64')
pkgname=('notmuch-emacs-git' 'notmuch-runtime-git' 'notmuch-python-git' 'notmuch-ruby-git' 'notmuch-vim-git' 'notmuch-mutt-git')
epoch=3
pkgver=0.28.2.20.ge5253502
pkgrel=1
url="https://notmuchmail.org/"
license=('GPL3')
makedepends=('python' 'python-sphinx' 'emacs' 'git'
  'gnupg' 'ruby' 'pkgconfig' 'xapian-core' 'gmime' 'talloc')
options=('!distcc')
source=("git+https://git.notmuchmail.org/git/notmuch")
md5sums=('SKIP')

pkgver() {
  cd "${pkgbase%-git}"
  git describe --long --tags | cut -d/ -f 3 | tr - .
}

prepare() {
  cd "${pkgbase%-git}"
  cp -dpr --no-preserve=ownership "$srcdir"/${pkgbase%-git}/bindings/python{,2}
  find "$srcdir/${pkgbase%-git}/bindings/python" -name '*.py' -exec sed -i -e '1s,python$,python3,' {} +
}

build() {
  cd "${pkgbase%-git}"
  ./configure --prefix=/usr --sysconfdir=/etc --includedir=/usr/include
  make

  make -C "contrib/${pkgbase%-git}-mutt" "${pkgbase%-git}-mutt.1"

  make ruby-bindings

  cd bindings/python
  python setup.py build
}

package_notmuch-emacs-git() {
  arch=('any')
  pkgdesc="Not much of an email program -default interface to emacs"
  depends=('notmuch-runtime')
  optdepends=('emacs: for using the emacs interface' 'gnupg: for email encryption')
  conflicts=('notmuch')
  provides=('notmuch')

  cd "${pkgbase%-git}"
  make DESTDIR="$pkgdir/" install-emacs
  rm "$pkgdir/usr/share/applications/mimeinfo.cache"
}

package_notmuch-runtime-git() {
  arch=('i686' 'x86_64')
  pkgdesc="Runtime for notmuch and notmuch-mutt"
  depends=('xapian-core' 'gmime' 'talloc')
  conflicts=('notmuch-runtime')
  provides=('notmuch-runtime')
  cd "${pkgbase%-git}"

  make DESTDIR="$pkgdir/" LIBDIR_IN_LDCONFIG=0 WITH_EMACS=0 install

  # install manpages
  make DESTDIR="$pkgdir" prefix=/usr install-man

  # install binary
  install -Dm755 notmuch "$pkgdir/usr/bin/notmuch"

  # remove stuff that goes into the other packages
  rm -rf "$pkgdir/usr/share/emacs"
}

package_notmuch-vim-git() {
  arch=('any')
  pkgdesc="Vim plugins for notmuch"
  depends=('notmuch-runtime')
  optdepends=('vim: for using the vim interface')
  conflicts=('notmuch-vim')
  provides=('notmuch-vim')

  make -C "${pkgbase%-git}"/vim DESTDIR="$pkgdir" prefix="/usr/share/vim/vimfiles" install
}

package_notmuch-python-git() {
  arch=('any')
  depends=('notmuch-runtime')
  pkgdesc="Python bindings for notmuch"
  optdepends=('python: for using the python bindings')
  conflicts=('notmuch-python')
  provides=('notmuch-python')

  cd "${pkgbase%-git}"/bindings/python
  python setup.py install --prefix=/usr --root="$pkgdir"
}

package_notmuch-ruby-git() {
  arch=('i686' 'x86_64')
  depends=('notmuch-runtime')
  pkgdesc="Ruby bindings for notmuch"
  optdepends=('ruby: for using the ruby bindings')
  conflicts=('notmuch-ruby')
  provides=('notmuch-ruby')

  cd ${pkgbase%-git}
  sed -i 's:INSTALL = .*[^D]$:& -D:' bindings/ruby/Makefile
  install -d "$pkgdir"/usr/lib/ruby/vendor_ruby/2.4.0/x86_64-linux
  make -C bindings/ruby exec_prefix="$pkgdir"/usr prefix=/usr install
}

package_notmuch-mutt-git() {
  arch=('any')
  pkgdesc="The mail indexer"
  depends=('notmuch-runtime' 'perl-mailtools' 'perl-mail-box' 'perl-term-readline-gnu' 'perl-string-shellquote' 'perl-file-which')
  conflicts=('notmuch-mutt')
  provides=('notmuch-mutt')

  cd ${pkgbase%-git}

  install -Dm755 "contrib/${pkgbase%-git}-mutt/${pkgbase%-git}-mutt" "$pkgdir"/usr/bin/${pkgbase%-git}-mutt
  install -Dm644 "contrib/${pkgbase%-git}-mutt/${pkgbase%-git}-mutt.1" "${pkgdir}"/usr/share/man/man1/${pkgbase%-git}-mutt.1
}
