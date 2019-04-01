# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=brew-git
_pkgname=brew
pkgver=2.0.6.r74.gdb02f93bb
pkgrel=1
pkgdesc='The missing package manager for macOS (or Linux)'
arch=(x86_64)
url='https://github.com/Homebrew/brew'
license=(BSD CCPL)
depends=(
ruby-irb
java-runtime
)
makedepends=(git)
provides=(brew)
conflicts=(linuxbrew-git linuxbrew brew)
source=(
"git+$url"
brew4archlinux.diff::https://patch-diff.githubusercontent.com/raw/Homebrew/brew/pull/5926.diff
)
_gitname='brew'
md5sums=('SKIP'
         '50a4929331b39fe7d1591342bd873248')

pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  fi
}
prepare(){
  cd "$srcdir"/$_gitname
  patch -p1 -i "$srcdir"/brew4archlinux.diff
}
package() {
    cd "$srcdir/$_pkgname"

    install -dm777 "$pkgdir/opt/$_pkgname"
    install -dm777 "$pkgdir/opt/$_pkgname/bin"
    cp -a "$srcdir/$_pkgname/." "$pkgdir/opt/$_pkgname"

    install -dm755 "$pkgdir/usr/bin"
    ln -sf /opt/$_pkgname/bin/brew "$pkgdir/usr/bin/brew"

    install -dm755 "$pkgdir/usr/share/man/man1"
    ln -sf /opt/$_pkgname/manpages/brew{,-cask}.1 -t "$pkgdir/usr/share/man/man1"

    install -dm755 "$pkgdir/etc/bash_completion.d"
    ln -sf "/opt/$_pkgname/completions/bash/brew" -t "$pkgdir/etc/bash_completion.d/"

    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    ln -sf /opt/$_pkgname/completions/zsh/_brew{,_cask} -t "$pkgdir/usr/share/zsh/site-functions"
}

