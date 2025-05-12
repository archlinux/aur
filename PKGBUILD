# Maintainer: kj_sh604 <406hs_jk@proton.me>

pkgname=grep-compat
_pkgname=grep
pkgver=3.12
pkgrel=2
pkgdesc='A string search utility (without egrep and fgrep warnings when used in scripts)'
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/grep/'
depends=('glibc' 'pcre2')
makedepends=('gperf' 'git' 'python' 'texinfo' 'wget')
provides=('grep')
conflicts=('grep')
source=("git+https://git.savannah.gnu.org/git/grep.git#tag=v${pkgver}"
        "git+https://git.savannah.gnu.org/git/gnulib.git")
sha256sums=('9543190d9ca2201ea46fddaeb39031a0acde1f6aa4351a72f33ef3455e6dd41e'
            'SKIP')

prepare() {
  cd $_pkgname

  git submodule init
  git config submodule.gnulib.url "${srcdir}/gnulib"
  git -c protocol.file.allow=always submodule update

  git cherry-pick -n \
    '2e19d07ef1c08c3ce4771bb1bfee1ae6541f1c0d'

  sh bootstrap
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr
  make
}

check() {
  cd $_pkgname
  make check
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install

  # add egrep wrapper script with no warnings
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/egrep" <<END
#!/bin/sh
cmd=\${0##*/}
exec grep -E "\$@"
END

  # add fgrep wrapper script with no warnings
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/fgrep" <<END
#!/bin/sh
cmd=\${0##*/}
exec grep -F "\$@"
END
}
