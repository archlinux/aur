# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: fauno <fauno at kiwwwi.com.ar>
# Contributor: Olivier Ramonat <olivier at ramonat dot fr>
# Contributor: Richard Murri <admin@richardmurri.com>

pkgbase=notmuch-cip
_pkgbase=notmuch
pkgname=('notmuch-cip' 'notmuch-cip-vim' 'notmuch-cip-mutt' 'notmuch-cip-runtime')
pkgver=0.22.1
pkgrel=2
arch=('i686' 'x86_64')
url="http://notmuchmail.org/"
license=('GPL3')
makedepends=('python2' 'python' 'python-sphinx' 'emacs' 'gnupg' 'ruby' 'pkgconfig' 'xapian-core' 'gmime' 'talloc')
options=(!distcc !makeflags)
source=("http://notmuchmail.org/releases/${_pkgbase}-${pkgver}.tar.gz"
        "cip-misc.patch"
        "cip-core.patch")
md5sums=('5093abaca53f3690f091022eb9a75d8a'
         'db8738d27f066c7b5490fe5b1ba2806c'
         'c5f1300491aa1a6ac61605d2d5cc164b')

prepare(){
    pushd $srcdir/${_pkgbase}-${pkgver}
    patch -p1 < ../../cip-misc.patch
    patch -p1 < ../../cip-core.patch
    popd
    cp -dpr --no-preserve=ownership "$srcdir/${_pkgbase}-$pkgver"/bindings/python{,2}
    find "$srcdir/${_pkgbase}-${pkgver}/bindings/python" -name '*.py' -exec sed -i -e '1s,python$,python3,' {} +
    find "$srcdir/${_pkgbase}-${pkgver}/bindings/python2" -name '*.py' -exec sed -i -e '1s,python$,python2,' {} +
}

build() {
    cd "$srcdir/$_pkgbase-$pkgver"

    ./configure --prefix=/usr --sysconfdir=/etc --includedir=/usr/include --without-zsh-completion
    make 

    make -C "contrib/${_pkgbase}-mutt" "${_pkgbase}-mutt.1"

    make ruby-bindings

    cd "$srcdir/$_pkgbase-$pkgver/bindings/python"
    python setup.py build

    cd "$srcdir/$_pkgbase-$pkgver/bindings/python2"
    python2 setup.py build
}

package_notmuch-cip-runtime(){
    provides=("notmuch-runtime")
    conflicts=("notmuch-runtime")
    pkgdesc="Runtime for notmuch and notmuch-mutt, with the cleartext index properties patch"
    depends=('xapian-core' 'gmime' 'talloc')

    cd "$srcdir/$_pkgbase-$pkgver"

    make DESTDIR="$pkgdir/" LIBDIR_IN_LDCONFIG=0 WITH_EMACS=0 install

    install -Dm755 notmuch "$pkgdir/usr/bin/notmuch"
    rm -rf "$pkgdir/usr/share"
}


package_notmuch-cip-vim(){
    provides=("notmuch-vim")
    conflicts=("notmuch-vim")
    pkgdesc="Vim plugins for notmuch, with the cleartext index properties patch"
    depends=('notmuch-runtime')
    install=notmuch-vim.install

    make -C "$srcdir/$_pkgbase-$pkgver/vim" DESTDIR="$pkgdir" prefix="/usr/share/vim/vimfiles" install
}


package_notmuch-cip(){
    provides=("notmuch")
    conflicts=("notmuch")
    pkgdesc="Notmuch is not much of an email program, with the cleartext index properties patch"
    depends=('notmuch-runtime')
    optdepends=('emacs: for using the emacs interface'
                'vim: for using the vim interface'
                'python2: for using the python2 bindings'
                'ruby: for using the ruby bindings'
                'gnupg: for email encryption')
    install=notmuch.install

    cd "$srcdir/$_pkgbase-$pkgver"

    # Install emacs parts
    make DESTDIR="$pkgdir/" install-emacs

    # Install manpages
    make DESTDIR="$pkgdir" prefix="/usr" install-man

    # Install ruby bindings
    sed -i 's:INSTALL = .*[^D]$:& -D:' bindings/ruby/Makefile
    make -C bindings/ruby exec_prefix=$pkgdir/usr prefix=/usr install

    # Install python bindings
    cd "$srcdir/$_pkgbase-$pkgver/bindings/python"
    python setup.py install --prefix=/usr --root="$pkgdir"

    cd "$srcdir/$_pkgbase-$pkgver/bindings/python2"
    python2 setup.py install --prefix=/usr --root="$pkgdir"
}

package_notmuch-cip-mutt(){
    provides=("notmuch-mutt")
    conflicts=("notmuch-mutt")
    pkgdesc="The mail indexer, with the cleartext index properties patch"
    depends=('notmuch-runtime' 'perl-mailtools' 'perl-mail-box' 'perl-term-readline-gnu' 'perl-string-shellquote' 'perl-file-which')

    cd "$srcdir/$_pkgbase-$pkgver"
    _pkgname=notmuch-mutt

    install -Dm755 "contrib/${_pkgname}/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 "contrib/${_pkgname}/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
