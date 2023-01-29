# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bash-completion-git
pkgver=2.11.r810.g5927d573
pkgrel=1
pkgdesc="Programmable completion functions for bash"
arch=('any')
url="https://github.com/scop/bash-completion"
license=('GPL2')
depends=('bash')
makedepends=('git')
provides=("bash-completion=$pkgver")
conflicts=('bash-completion')
options=(!emptydirs)
source=("git+https://github.com/scop/bash-completion.git")
sha256sums=('SKIP')


pkgver() {
  cd "bash-completion"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "bash-completion"

  autoreconf -fi
  ./configure \
    --prefix="/usr" \
    --sysconfdir="/etc"
  make
}

package() {
  cd "bash-completion"

  make DESTDIR="$pkgdir" install

  # bash-completion is sourced in /etc/bash.bashrc so that non-bash shell don't source it
  rm "$pkgdir/etc/profile.d/bash_completion.sh"

  # remove Slackware's makepkg completion
  rm "$pkgdir/usr/share/bash-completion/completions/makepkg"
}
