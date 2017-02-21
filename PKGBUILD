# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

pkgname=zarafa-libvmime
pkgver=7.2.0
_pkgmajver=7.2
_pkgrev=${pkgver}-48204
_libvmimever=0.9.2
pkgrel=272
pkgdesc="A C++ class library for working with MIME messages"
arch=('armv7h'
      'armv6h'
      'x86_64'
      'i686')
url="http://www.vmime.org/"
license=('GPL')
depends=('gsasl' 
	 'gnutls')
provides=("libvmime=${_libvmimever}")
source=("https://download.zarafa.com/community/final/7.1/7.1.7-42779/sourcecode/libvmime-${_libvmimever}+svn603.tar.bz2"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/vmime-patches/vmime-0.9.2-header-value-on-next-line.diff"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/vmime-patches/vmime-0.9.2-phf-stop-on-whitespace.diff"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/vmime-patches/vmime-0.9.2-qp-in-buffers.diff"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/vmime-patches/vmime-mixed-qp-in-parameter.diff"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/vmime-patches/vmime-backport-mailboxList-parser-29954e5.diff"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/vmime-patches/vmime-disable-rfc2231.diff"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/vmime-patches/vmime-ignore-multiple-colons-in-headers.diff"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/vmime-patches/vmime-ignore-newlines.diff"
	"https://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/vmime-patches/vmime-remove-setlocale.diff")

md5sums=('0ba65ad889488b2f851d7f028bfb6e9e'
         'f9d915f576d55caf1c175f85fe96572c'
         '37a434db82cb5baded6aa89ebd1800bd'
         'b0b3260d88899c5aeff74aad86186602'
         '29651f18632f71f93e2ca7d1284c718b'
         'f095c053d300a7f285855090e9f62742'
         'e3729b93760de843f04b25ccdb363ac9'
         '957cbbc72d374157475788450cee5049'
         '21dcfca3eedb6b08fac57a5c9f267490'
         'cde4f6e8a17bf09b6069290cc53da44f')

prepare() {
    cd $srcdir/libvmime-${_libvmimever}
        
    # Patching
    for pa in ../*.diff; do
        echo "Patching ${pa}"
        patch -p1 <${pa}
    done

}

build() {
    cd $srcdir/libvmime-${_libvmimever}

    ./configure --disable-debug \
	--enable-sasl \
	--enable-tls\
	--enable-platform-posix \
	--enable-messaging \
	--enable-messaging-proto-pop3 \
	--enable-messaging-proto-smtp \
	--enable-messaging-proto-imap \
	--enable-messaging-proto-maildir \
	--enable-messaging-proto-sendmail \
    	--prefix=/usr
    make
}

package() {
    cd $srcdir/libvmime-${_libvmimever}
    
    make install DESTDIR="$(realpath ${pkgdir})"
    #scons prefix=$pkgdir/usr install  || return 1
}
