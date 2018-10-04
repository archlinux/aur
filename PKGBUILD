# Maintainer: H. Rosendahl <h [at] ro [dot] sendahl [dot] de>
pkgname=um-git
pkgver=4.0.0.r0.g549656d
pkgrel=1
pkgdesc="utility to create and maintain your own man pages so you can remember how to do stuff"
arch=('any')
url="https://github.com/sinclairtarget/um"
license=('MIT')
depends=('ruby' 'ruby-kramdown')
makedepends=('git' 'ruby-rake')
source=("${pkgname}::git+${url}"
        "um.sh")
sha256sums=('SKIP'
            '500b716feca004a1f43a3d8c2bc6ec65e409781c882f5a935b726900888fb91f')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/"
  rm doc/man1/*
  # Create man pages
  rake
  # Compress man pages
  find doc/man1/ -name \*.1 -exec gzip {} \;
}

package() {
  # Sadly the libraries are referenced relative. This would not be a problem with
  # the files in 'lib', but the files in libexec are also expected to be in their
  # directory and that directory does not exist in Arch Linux by default.
  # So I decided to put everything into /opt/um. If there is a better way,
  # please let me know by mail or AUR comment :)
  install -Dm644 "$srcdir"/$pkgname/lib/um.rb -t "$pkgdir/opt/um/lib"
  install -Dm644 "$srcdir"/$pkgname/lib/um/* -t "$pkgdir/opt/um/lib/um"
  install -Dm644 "$srcdir"/$pkgname/libexec/* -t "$pkgdir/opt/um/libexec"
  install -Dm644 "$srcdir"/$pkgname/doc/man1/*.gz -t "$pkgdir/usr/share/man/man1"
  install -Dm644 "$srcdir"/$pkgname/templates/* -t "$pkgdir/opt/um/templates"
  install -Dm644 "$srcdir"/$pkgname/LICENSE -t "$pkgdir/usr/share/licenses/um-git"
  echo $(pkgver) > "$pkgdir/opt/um/version.txt"

  install -Dm755 "$srcdir/um.sh" "$pkgdir/usr/bin/um"
}

# vim:set ts=2 sw=2 et:
