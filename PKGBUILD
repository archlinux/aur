# Maintainer: Alyxia Sother <nylkvn@evfrhc.arg(rot13)>

_pkgname=ucspi-tcp
pkgname=ucspi-tcp-re
pkgver=0.88
pkgrel=1
pkgdesc="Easy-to-use command-line tools for building TCP client-server applications."
arch=('x86_64' 'aarch64')
provides=('tcpserver' 'tcpclient')
url="http://cr.yp.to/ucspi-tcp.html"
license=('unknown')

source=("http://cr.yp.to/ucspi-tcp/ucspi-tcp-0.88.tar.gz"
        "ucspi-tcp-re.patch")
sha256sums=('4a0615cab74886f5b4f7e8fd32933a07b955536a3476d74ea087a3ea66a23e9c'
            '9d599c6362a4fab5335c5ee90b3c2a9ffe6dff30b3e15a3516e8dbcc6bc289f2')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Changes the types of two conflicting function definitions and adds compiler
  # flags to the Makefile.
  patch --strip=1 --input="$srcdir/$_pkgname.patch"

  # The package, being written in the year 2000, thus being arcane ancient C,
  # uses some insane method for automatically generating a source file that
  # contains the folder we're installing to. Luckily this can be controlled by
  # a simple text file.
  echo "$pkgdir/usr/local" >| conf-home
}

package() {
  # I believe referencing pkgdir within the package step is some heinous act? I
  # don't have a choice though. Putting this in the prepare step causes an
  # error during compilation. The build step doesn't work either.
  mkdir -p "$pkgdir/usr/local"

  cd "$srcdir/$_pkgname-$pkgver"
  make
  make setup check
}
