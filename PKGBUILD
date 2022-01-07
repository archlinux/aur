# Maintainer: desbma
# Contributor: Andrew Rabert <ar@nullsum.net>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Ian Beringer <ian@ianberinger.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# shellcheck disable=SC2034,SC2148,SC2154,SC2164

pkgname=lf-xdg
_pkgname_upstream=lf
pkgver=26
pkgrel=2
license=('MIT')
pkgdesc="A terminal file manager inspred by ranger written in Go, with patch to use XDG locations for runtime files"
depends=('glibc')
makedepends=('go')
provides=('lf')
conflicts=('lf')
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/gokcehan/lf"
source=("$_pkgname_upstream-r$pkgver.tar.gz::https://github.com/gokcehan/$_pkgname_upstream/archive/r$pkgver.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/gokcehan/$_pkgname_upstream/pull/726.patch")
sha256sums=('dccd1ad67d2639e47fe0cbc93d74f202d6d6f0c3759fb0237affb7b1a2b1379e'
            'abf786eab3baa606bd064d9108761b537177189946a014e41512fe99e94287a1')

prepare() {
  # prevent creation of a `go` directory in one's home.
  # this directory cannot be removed with even `rm -rf` unless one becomes root
  # or changes the write permissions.
  export GOPATH="${srcdir}/gopath"
  go clean -modcache

  patch  --directory="${_pkgname_upstream}-r${pkgver}" --forward --strip=1 --input="${srcdir}/726.patch"
}

build() {
  cd "${_pkgname_upstream}-r${pkgver}"
  go mod vendor
  version=r$pkgver ./gen/build.sh \
      -buildmode=pie \
      -mod=vendor \
      -modcacherw \
      -trimpath
  # clean now to ensure makepkg --clean works
  go clean -modcache
}

package() {
  cd "${_pkgname_upstream}-r${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" \
      ./lf

  install -Dm644 -t "${pkgdir}/usr/share/applications" \
      ./lf.desktop

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
      ./LICENSE

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
      ./README.md \
      ./etc/lfrc.example
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}" \
      ./etc/lfcd.sh

  install -Dm644 -t "${pkgdir}/usr/share/man/man1" \
      ./lf.1

  # vim
  install -Dm644 -t "${pkgdir}/usr/share/vim/vimfiles/syntax" \
      ./etc/lf.vim
  install -Dm644 -t "${pkgdir}/usr/share/vim/vimfiles/ftdetect" \
      ./etc/lf.vim

  # fish
  install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_completions.d" \
      ./etc/lf.fish
  install -Dm644 -t "${pkgdir}/usr/share/fish/vendor_functions.d" \
      ./etc/lfcd.fish

  # zsh
  install -Dm644 -T ./etc/lf.zsh "${pkgdir}/usr/share/zsh/site-functions/_lf"

  # tsch
  install -Dm644 -t "${pkgdir}/etc/profile.d" \
       ./etc/lf.csh \
       ./etc/lfcd.csh
}
