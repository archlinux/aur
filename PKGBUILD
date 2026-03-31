# Maintainer: John Regan <john@jrjrtech.com>

pkgname='vim-classic-git'
_pkgname='vim-classic'
pkgver=r11223.156c7e4
pkgrel=2
pkgdesc='Vim Classic is a fork of Vim 8.2 for long-term maintenance.'
arch=('x86_64' 'i686' 'aarch64')
conflicts=('vim' 'gvim' 'vim-runtime')
provides=('vim' 'xxd')
url='https://git.sr.ht/~sircmpwn/vim-classic'
license=('custom:vim')
depends=(
  'acl'
  'libgcrypt'
  'glibc'
  'gpm'
  'pcre'
  'zlib'
)
makedepends=(
  'gawk'
  'git'
  'lua'
  'perl'
  'python'
  'tcl'
)
optdepends=(
  'lua: Lua language support'
  'perl: Perl language support'
  'python: Python language support'
  'tcl: Tcl language support'
)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

# TODO
# fix ruby, perl

build() {
  cd "$_pkgname"
  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --enable-gpm \
    --enable-acl \
    --with-x=no \
    --disable-gui \
    --enable-multibyte \
    --enable-cscope \
    --enable-netbeans \
    --enable-luainterp=dynamic \
    --enable-perlinterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-tclinterp=dynamic \
    --enable-year2038 \
    --disable-canberra
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="${pkgdir}" install
  install -Dm 644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt

  # ex and view are provided by nvi packages
  rm -f "${pkgdir}"/usr/bin/ex
  rm -f "${pkgdir}"/usr/bin/view

  find "${pkgdir}"/usr/share/man -name ex.1 -delete
  find "${pkgdir}"/usr/share/man -name view.1 -delete
  find "${pkgdir}"/usr/share/man -name evim.1 -delete

}
