# Maintainer: John Regan <john@jrjrtech.com>

pkgbase='vim-classic-git'
pkgname=('vim-classic-git' 'vim-classic-runtime-git' 'gvim-classic-git')
_pkgname='vim-classic'
pkgver=r11248.e77db10
pkgrel=1
pkgdesc='Vim Classic is a fork of Vim 8.x for long-term maintenance.'
arch=('x86_64' 'i686' 'aarch64')
url='https://git.sr.ht/~sircmpwn/vim-classic'
license=('LicenseRef-vim')
makedepends=(
  'acl'
  'gawk'
  'git'
  'glibc'
  'gpm'
  'gtk3'
  'libcanberra'
  'libgcrypt'
  'libxt'
  'lua'
  'pcre'
  'perl'
  'python'
  'ruby'
  'tcl'
  'zlib'
)
source=(
"git+${url}"
"2026-04-23-regen-protos.patch"
)
sha256sums=(
'SKIP'
'93147377ab9e75cb35a8c78a4a77432693a86cdedbecbb8da4e43c4e5a26ffc5'
)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  (
    cd "$_pkgname"
    patch -Np1 -i ../2026-04-23-regen-protos.patch
  )
  cp -a "$_pkgname" "g${_pkgname}"
}

build() {
  (
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
    --enable-rubyinterp=dynamic \
    --enable-tclinterp=dynamic \
    --enable-year2038 \
    --disable-canberra
  make
  )

  (
  cd "g$_pkgname"
  ./configure \
    --prefix=/usr \
    --localstatedir=/var/lib/vim \
    --with-features=huge \
    --enable-gpm \
    --enable-acl \
    --with-x=yes \
    --enable-gui=gtk3 \
    --enable-multibyte \
    --enable-cscope \
    --enable-netbeans \
    --enable-luainterp=dynamic \
    --enable-perlinterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-tclinterp=dynamic \
    --enable-year2038 \
    --enable-canberra
  make
  )

}

package_vim-classic-runtime-git() {
  conflicts=('vim-runtime')
  pkgdesc+=' - shared runtime'

  cd "$_pkgname"

  make DESTDIR="${pkgdir}" install
  install -Dm 644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt

  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/share/man"
  rm -rf "${pkgdir}/usr/share/applications"
  rm -rf "${pkgdir}/usr/share/icons"
}

package_vim-classic-git() {
  provides=('vim' 'xxd')
  conflicts=('gvim' 'gvim-classic-git')
  depends=(
    "vim-classic-runtime-git=${pkgver}-${pkgrel}"
    'acl'
    'libgcrypt'
    'glibc'
    'gpm'
    'pcre'
    'zlib'
  )
  optdepends=(
    'lua: Lua language support'
    'perl: Perl language support'
    'python: Python language support'
    'ruby: Ruby language support'
    'tcl: Tcl language support'
  )

  cd "$_pkgname"

  make DESTDIR="${pkgdir}" install
  install -Dm 644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt

  rm -rf "${pkgdir}"/usr/share/vim

  # ex and view are provided by nvi packages
  rm -f "${pkgdir}"/usr/bin/ex
  rm -f "${pkgdir}"/usr/bin/view

  find "${pkgdir}"/usr/share/man -name ex.1 -delete
  find "${pkgdir}"/usr/share/man -name view.1 -delete
  find "${pkgdir}"/usr/share/man -name evim.1 -delete

}

package_gvim-classic-git() {
  provides=('gvim' 'xxd' 'vim' "vim-classic-git=${pkgver}-${pkgrel}")
  depends=(
    "vim-classic-runtime-git=${pkgver}-${pkgrel}"
    'acl'
    'libgcrypt'
    'glibc'
    'gpm'
    'pcre'
    'zlib'
    'gtk3'
    'libcanberra'
    'libxt'
  )
  optdepends=(
    'lua: Lua language support'
    'perl: Perl language support'
    'python: Python language support'
    'ruby: Ruby language support'
    'tcl: Tcl language support'
  )

  cd "g$_pkgname"

  make DESTDIR="${pkgdir}" install
  install -Dm 644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt

  rm -rf "${pkgdir}"/usr/share/vim

  # ex and view are provided by nvi packages
  rm -f "${pkgdir}"/usr/bin/ex
  rm -f "${pkgdir}"/usr/bin/view

  find "${pkgdir}"/usr/share/man -name ex.1 -delete
  find "${pkgdir}"/usr/share/man -name view.1 -delete
  find "${pkgdir}"/usr/share/man -name evim.1 -delete

}
