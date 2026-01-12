# Maintainer:

: ${_use_sodeps:=false}

_pkgname="radare2"
pkgname="$_pkgname-git"
pkgver=6.0.8.r65.ge515192
pkgrel=1
pkgdesc="Open-source tools to disasm, debug, analyze and manipulate binary files"
url="https://github.com/radare/radare2"
license=(
  'GPL-3.0-only'  # portions
  'LGPL-3.0-only' # majority
)
arch=('x86_64')

depends=(
  'capstone'
  'file'
  'libuv'
  'libzip'
  'lz4'
  'sh'
  'xxhash'
  'zlib'
)
makedepends=(
  'git'
  'meson'
)
optdepends=(
  'r2ghidra: ghidra decompiler plugin'
)

provides=("$_pkgname=${pkgver%.g*}")
conflicts=("$_pkgname")

options=('!emptydirs')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  # prevent linking against old system-wide r2 libs
  export PKG_CONFIG_PATH="$srcdir/$_pkgsrc/pkgcfg:$PKG_CONFIG_PATH"

  local _meson_args=(
    --wrap-mode default
    -D use_sys_capstone=true
    -D use_capstone_version=v5
    -D use_sys_lz4=true
    -D use_sys_magic=true
    -D use_sys_xxhash=true
    -D use_sys_zip=true
    -D use_sys_zlib=true
    -D use_libuv=true
    -D use_webui=true
    -D want_threads=false
  )

  touch "$_pkgsrc"/libr/config.mk
  arch-meson ${_meson_args[@]} "$_pkgsrc" build
  meson compile -C build
}

package() {
  if [[ "${_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      'libcapstone.so'
      'libmagic.so'
      'libzip.so'
    )"
  fi

  # install expects pre-existing directory
  mkdir -pm755 "$pkgdir/usr/share/doc/radare2"

  meson install -C build --destdir "$pkgdir"

  # symlink manpage
  ln -sf radare2.1.gz "${pkgdir}/usr/share/man/man1/r2.1.gz"
}
