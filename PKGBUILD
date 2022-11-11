# Maintainer (2022-): Koichi Murase <myoga.murase@gmail.com> (akinomyoga at GitHub)
# Maintainer (2021): capezotte (carana2099 ob gmail at com)
# Contributor: Seto (huresche at GitHub)

pkgname=blesh-git
_pkgname=ble.sh
pkgdesc="Custom bash line editor with enhanced features"
pkgver=0.4.0_devel3.r1833.a144ffa
pkgrel=1
license=(BSD)
url='https://github.com/akinomyoga/ble.sh'
depends=(bash gawk sed make git)
makedepends=(bash gawk sed make git)
arch=(any)
source=("git+$url" "git+${url/%.sh/sh-contrib}" 'blesh-update.sh')
md5sums=('SKIP'
         'SKIP'
         'cfe4b50a3b3c66a69af64059fb4a7683')
install=blesh.install

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.%s" \
    "$(sed -n 's/-/_/g;s/^FULLVER[[:space:]]*:=[[:space:]]*//p' GNUmakefile)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  # From git 2.38.1-1, "git submodule" in PKGBUILD does not work
  # unless we change the git config "protocol.file.allow" [1,2].
  # [1] https://bugs.archlinux.org/task/76255
  # [2] https://bbs.archlinux.org/viewtopic.php?pid=2063104#p2063104
  cd "$_pkgname"
  git -c protocol.file.allow=always submodule update --init --recursive
}

package() {
  # Makes ble-update call an AUR helper
  install -Dm644 blesh-update.sh "$pkgdir"/usr/share/blesh/lib/_package.sh
  cd "$_pkgname"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
