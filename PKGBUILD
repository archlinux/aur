# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: Jonathan Shreckengost <jonathanshrek@gmail.com>

pkgbase="liblnk-git"
pkgname=("liblnk-git" "liblnk-tools-git" "python-liblnk-git" "python2-liblnk-git")
pkgver=20210417.r0.g0c9a2c8
pkgrel=1
pkgdesc="Library and tools to access the Windows Shortcut File (LNK) format"
arch=(x86_64)
license=(LGPL3)
url="https://github.com/libyal/liblnk"

depends=('libbfio-git')
makedepends=('git' 'python' 'python2' 'automake' 'autoconf' 'libtool' 'pkgconf')

source=("$pkgname::git+https://github.com/libyal/liblnk.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  ./synclibs.sh
  ./autogen.sh
}


build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    runstatedir=/run \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --enable-python2 \
    --enable-python3

  make

  msg2 "Preparing files for packaging..."
  mkdir -p "$srcdir/package"
  make DESTDIR="$srcdir/package" install
}


package_liblnk-git() {
  provides=(liblnk)
  conflicts=(liblnk)
  cd "$srcdir/package"

  mkdir -p "$pkgdir/usr"

  # Copy libraries
  find usr/lib -minlevel 2 -type d | grep -v python | while read libdir; do
    mkdir -p "$pkgdir/$(dirname $libdir)"
    cp -Rd "$libdir" "$pkgdir/$libdir"
  done
  find usr/lib -not -type d | grep -v python | while read lib; do
    mkdir -p "$pkgdir/$(dirname $lib)"
    cp -d "$lib" "$pkgdir/$lib"
  done

  # Copy headers
  cp -Rd usr/include "$pkgdir/usr/include"

  # Copy manuals
  mkdir -p "$pkgdir/usr/share/man"
  cp -Rd usr/share/man/man3 "$pkgdir/usr/share/man/man3"
}


package_liblnk-tools-git() {
  pkgdesc="Command line tools for liblnk"
  provides=(liblnk-tools)
  conflicts=(liblnk-tools)
  depends=(liblnk-git)

  cd "$srcdir/package"
  mkdir -p "$pkgdir/usr"

  # Copy binaries
  cp -Rd usr/bin "$pkgdir/usr/bin"

  # Copy manuals
  mkdir -p "$pkgdir/usr/share/man"
  cp -Rd usr/share/man/man1 "$pkgdir/usr/share/man/man1"
}

package_python-liblnk-git() {
  pkgdesc="Python3 bindings for liblnk"
  provides=(python-liblnk)
  conflicts=(python-liblnk)
  depends=(python liblnk-git)

  cd "$srcdir/package"

  find usr/lib -type d | grep python3 | while read libdir; do
    mkdir -p "$pkgdir/$(dirname $libdir)"
    cp -Rd "$libdir" "$pkgdir/$libdir"
  done
  find usr/lib -not -type d | grep python3 | while read lib; do
    cp -d "$lib" "$pkgdir/$lib"
  done
}

package_python2-liblnk-git() {
  pkgdesc="Python2 bindings for liblnk"
  provides=(python2-liblnk)
  conflicts=(python2-liblnk)
  depends=(python2 liblnk-git)

  cd "$srcdir/package"

  find usr/lib -type d | grep python2 | while read libdir; do
    mkdir -p "$pkgdir/$(dirname $libdir)"
    cp -Rd "$libdir" "$pkgdir/$libdir"
  done
  find usr/lib -not -type d | grep python2 | while read lib; do
    mkdir -p "$pkgdir/$(dirname $lib)"
    cp -d "$lib" "$pkgdir/$lib"
  done
}
