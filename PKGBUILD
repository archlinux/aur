# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=open-transactions-git
pkgver=20140620
pkgrel=1
pkgdesc="Financial cryptography library"
arch=('i686' 'x86_64')
depends=('msgpack' 'openssl' 'protobuf' 'zeromq' 'zlib')
makedepends=('autoconf' 'automake' 'gcc' 'git' 'gtest' 'libtool' 'make' 'pkg-config' 'swig')
optdepends=('gdc: Enable configuration for SWIG Digital Mars D Programing Language support'
            'go: Enable configuration for SWIG Go support'
            'java-environment: Enable configuration for SWIG Java support'
            'mono: Enable configuration for SWIG C-Sharp support'
            'perl: Enable configuration for SWIG Perl support'
            'php: Enable configuration for SWIG PHP support'
            'python2: Enable configuration for SWIG Python support'
            'ruby: Enable configuration for SWIG Ruby support'
            'tcl: Enable configuration for SWIG TCL support')
url="https://github.com/Open-Transactions/Open-Transactions"
license=('custom')
source=(${pkgname%-git}::git+https://github.com/Open-Transactions/Open-Transactions)
sha256sums=('SKIP')
provides=('createmint' 'open-transactions' 'opentxs' 'ot' 'otserver')
conflicts=('createmint' 'open-transactions' 'opentxs' 'ot' 'otserver')
install=open-transactions.install

# keyring can be 'flatfile', 'gnome' or 'kwallet'
_keyring=flatfile

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  ./autogen.sh

  export PERL_EXT_LDFLAGS='-avoid-version -shared'
  export PYTHON_VERSION=2
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/opentxs \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/opentxs \
    --localstatedir=/var/lib/opentxs \
    --with-gnu-ld \
    --with-keyring=$_keyring
    #--with-csharp \
    #--with-d \
    #--with-go \
    #--with-java \
    #--with-perl5 \
    #--with-php \
    #--with-python \
    #--with-ruby \
    #--with-tcl
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -D -m644 docs/LICENSE-AND-CREDITS.txt "$pkgdir/usr/share/licenses/opentxs/LICENSE"

  msg 'Installing...'
  make DESTDIR="$pkgdir" install

  msg 'Installing bash completion...'
  install -D -m644 scripts/bash_completion.d/opentxs-bash-completion.sh $pkgdir/etc/bash_completion.d/opentxs

  msg 'Yielding /usr/lib/libgtest.so to pkg: gtest...'
  rm -f $pkgdir/usr/lib/libgtest.so

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
