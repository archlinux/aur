# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: fauno <fauno at kiwwwi.com.ar>
# Contributor: Olivier Ramonat <olivier at ramonat dot fr>
# Contributor: Richard Murri <admin@richardmurri.com>

pkgbase=notmuch-git
_pkgname=notmuch
pkgname=('notmuch-git' 'notmuch-vim-git' 'notmuch-mutt-git' 'notmuch-runtime-git')
pkgver=0.24.2.1.96.g6dd00d64
pkgrel=1
arch=('i686' 'x86_64')
url="https://notmuchmail.org/"
license=('GPL3')
makedepends=('python2' 'python' 'python-sphinx' 'emacs' 'gnupg' 'ruby' 'pkgconfig' 'xapian-core' 'gmime' 'talloc')
options=(!distcc !makeflags)
source=("git://notmuchmail.org/git/notmuch" not_byte_compile_notmuch_el.patch)
md5sums=('SKIP'
         '07fa5cbbf2c7e0d5a19352c652e9c9cf')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags|tr - .|cut -c8-
}

prepare(){
  cp -dpr --no-preserve=ownership "$srcdir/${_pkgname}"/bindings/python{,2}
  find "$srcdir/${_pkgname}/bindings/python" -name '*.py' -exec sed -i -e '1s,python$,python3,' {} +
  find "$srcdir/${_pkgname}/bindings/python2" -name '*.py' -exec sed -i -e '1s,python$,python2,' {} +
  cd $_pkgname
  patch -Np1 < $srcdir/not_byte_compile_notmuch_el.patch||true
}

build() {
  cd $_pkgname

  ./configure --prefix=/usr --sysconfdir=/etc --includedir=/usr/include --without-zsh-completion
  make 
  
  make -C "contrib/${_pkgname}-mutt" "${_pkgname}-mutt.1"
  
  make ruby-bindings
  
  cd bindings/python
  python setup.py build
  cd -
  cd bindings/python2
  python2 setup.py build
}

package_notmuch-runtime-git(){
    pkgdesc="Runtime for notmuch and notmuch-mutt"
    depends=('xapian-core' 'gmime' 'talloc')
    conflicts=('notmuch-runtime')
    provides=('notmuch-runtime')
    cd $_pkgname

    make DESTDIR="$pkgdir/" LIBDIR_IN_LDCONFIG=0 WITH_EMACS=0 install

    install -Dm755 notmuch "$pkgdir/usr/bin/notmuch"
    rm -rf "$pkgdir/usr/share"
}


package_notmuch-vim-git(){
  arch=('any')
  pkgdesc="Vim plugins for notmuch"
  depends=('notmuch-runtime-git')
  conflicts=('notmuch-vim')
  provides=('notmuch-vim') 
  
  make -C ${_pkgname}/vim DESTDIR="$pkgdir" prefix="/usr/share/vim/vimfiles" install
}


package_notmuch-git(){
    pkgdesc="Not much of an email program"
    depends=('notmuch-runtime')
    optdepends=('emacs: for using the emacs interface'
                'vim: for using the vim interface'
                'python2: for using the python2 bindings'
                'ruby: for using the ruby bindings'
                'gnupg: for email encryption')
    conflicts=('notmuch')
    provides=('notmuch') 
    
    install=notmuch.install

    cd $_pkgname

    # Install emacs parts
    make DESTDIR="$pkgdir/" install-emacs

    # Install manpages
    make DESTDIR="$pkgdir" prefix="/usr" install-man

    # Install ruby bindings
    sed -i 's:INSTALL = .*[^D]$:& -D:' bindings/ruby/Makefile
    install -d $pkgdir/usr/lib/ruby/vendor_ruby/2.4.0/x86_64-linux
    make -C bindings/ruby exec_prefix=$pkgdir/usr prefix=/usr install

    # Install python bindings
    cd bindings/python
    python setup.py install --prefix=/usr --root="$pkgdir"
    cd -
    cd bindings/python2
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    rm "$pkgdir"/usr/share/applications/mimeinfo.cache
}

package_notmuch-mutt-git(){
  arch=('any')
  pkgdesc="The mail indexer"
  depends=('notmuch-runtime' 'perl-mailtools' 'perl-mail-box' 'perl-term-readline-gnu' 'perl-string-shellquote' 'perl-file-which')
  conflicts=('notmuch-mutt')
  provides=('notmuch-mutt') 
    
  cd ${_pkgname}
  
  install -Dm755 "contrib/${_pkgname}-mutt/${_pkgname}-mutt" "$pkgdir/usr/bin/${_pkgname}-mutt"
  install -Dm644 "contrib/${_pkgname}-mutt/${_pkgname}-mutt.1" "${pkgdir}/usr/share/man/man1/${_pkgname}-mutt.1"
}
