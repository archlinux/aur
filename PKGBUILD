# Maintainer: sLite (daniel@slite.org)
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>

pkgname=subversion-1.6
_pkgname=subversion
pkgver=1.6.23
pkgrel=3
pkgdesc="A Modern Concurrent Version Control System"
arch=('i686' 'x86_64')
license=('APACHE')
depends=('neon' 'apr-util' 'sqlite3' 'file')
optdepends=('bash-completion: for svn bash completion' \
            'python2: for some hook scripts' 'ruby: for some hook scripts' 'kdebase-runtime: for KWallet for auth credentials' 'libgnome-keyring: for GNOME Keyring for auth credentials')
makedepends=('krb5' 'python2' 'perl' 'swig' 'java-runtime' 'java-environment'
             'autoconf' 'db' 'e2fsprogs' 'kdelibs' 'libgnome-keyring')
backup=('etc/xinetd.d/svn' 'etc/conf.d/svnserve')
url="http://subversion.apache.org/"
provides=('svn' 'subversion')
conflicts=('svn' 'subversion')
options=('!makeflags' '!libtool')
source=(https://archive.apache.org/dist/subversion/$_pkgname-$pkgver.tar.bz2
        svnserve svn svnserve.conf neon.version.fix.patch)
md5sums=('5d621281ce9d3448e1437cb006331f57'
         'a2b029e8385007ffb99b437b30521c90'
         'a0db6dd43af33952739b6ec089852630'
         'c459e299192552f61578f3438abf0664'
         '9f2f0f25d6b5cb485f6a72aad928dbc7')

build() {
   cd "${srcdir}/${_pkgname}-${pkgver}"
   export PYTHON=/usr/bin/python2

   patch -Np1 -i ../neon.version.fix.patch

   sed -i 's|/usr/bin/env python|/usr/bin/env python2|' tools/hook-scripts/{,mailer/{,tests/}}*.py

   ./configure --prefix=/usr --with-apr=/usr --with-apr-util=/usr \
               --with-zlib=/usr --with-neon=/usr --without-apxs \
               --with-sqlite=/usr --with-berkeley-db=:/usr/include/:/usr/lib:db-5.3 \
               --enable-javahl --with-gnome-keyring --with-kwallet

   make external-all
   make LT_LDFLAGS="-L$Fdestdir/usr/lib" local-all
   make swig_pydir=/usr/lib/python2.7/site-packages/libsvn \
     swig_pydir_extra=/usr/lib/python2.7/site-packages/svn swig-py javahl # swig-rb
}

package() {
   cd "${srcdir}/${_pkgname}-${pkgver}"

   export LD_LIBRARY_PATH="${pkgdir}"/usr/lib:$LD_LIBRARY_PATH
   make DESTDIR="${pkgdir}" INSTALLDIRS=vendor \
     swig_pydir=/usr/lib/python2.7/site-packages/libsvn \
     swig_pydir_extra=/usr/lib/python2.7/site-packages/svn \
     install install-swig-py install-javahl # install-swig-rb

   install -d "${pkgdir}"/usr/share/subversion
   cp -a tools/hook-scripts "${pkgdir}"/usr/share/subversion/
   rm -f "${pkgdir}"/usr/share/subversion/hook-scripts/*.in

   rm -f "${pkgdir}"/usr/lib/perl5/vendor_perl/auto/SVN/_Core/.packlist
   rm -rf "${pkgdir}"/usr/lib/perl5/core_perl

   install -D -m 755 "${srcdir}"/svnserve "${pkgdir}"/etc/rc.d/svnserve
   install -D -m 644 "${srcdir}"/svn "${pkgdir}"/etc/xinetd.d/svn
   install -D -m 644 "${srcdir}"/svnserve.conf "${pkgdir}"/etc/conf.d/svnserve

   # bash completion
   install -Dm 644 tools/client-side/bash_completion \
     "${pkgdir}"/etc/bash_completion.d/subversion
}
