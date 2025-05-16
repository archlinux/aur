# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Johannes Löthberg < johannes at kyriasis dot com >
# Contributor: Alexander F Rødseth < xyproto at archlinux dot org >
# Contributor: Daniel Micay < danielmicay at gmail dot com >
# Contributor: userwithuid < userwithuid at gmail dot com >

_pkgname=rust
_date=2025-04-03
_rustc=1.86.0

pkgname=mingw-w64-rust
_prefix=opt/rust
pkgver=1.87.0
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency (mingw-w64)"
arch=('x86_64')
url="https://www.rust-lang.org"
license=("Apache-2.0 OR MIT")
depends=('gcc-libs'
         'curl'
         'libgit2'
         'mingw-w64-gcc>=10.1.0')
optdepends=('mingw-w64-wine: for cargo test support')
makedepends=('gdb'
             'ninja'
             'libffi'
             'perl'
             'python'
             'nodejs'
             'procps-ng'
             'cmake')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://static.rust-lang.org/dist/rustc-${pkgver}-src.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/${_date}/rust-std-${_rustc}-x86_64-unknown-linux-gnu.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/${_date}/rustc-${_rustc}-x86_64-unknown-linux-gnu.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/${_date}/cargo-${_rustc}-x86_64-unknown-linux-gnu.tar.xz"{,.asc}
        "mingw-config.toml")
noextract=("rust-std-${_rustc}-x86_64-unknown-linux-gnu.tar.xz"
           "rustc-${_rustc}-x86_64-unknown-linux-gnu.tar.xz"
           "cargo-${_rustc}-x86_64-unknown-linux-gnu.tar.xz")
b2sums=('7ede723121ff8df3908674631ceaec75797d91ccd6f1df4afd7187878adbb8d99c9e8a3b11c6027703b2e8d06785299d93d8649f3eda7f356dd2a6734d99d05b'
        'SKIP'
        '4e70780ad340ccb9d1333fc17e69c1940916e86af86d5de3287d20778abcd0e0790332b914d332be533dd62cf5217e3c27aea5112b504126a7b46940c4e7fcc2'
        'SKIP'
        'ba6ec6c25afb461162fdd069e724d9e10cf5a69e9d34f25823a192d3a8ff27a6c9c2c4574e4b9e85dd887571a8fe984c9e13803d9d31689757dd6dc943054ff9'
        'SKIP'
        'b26feeeb4469dea045249baf7ece4dc8252c969c5de570fc5d2bbd0264a9ec6f0c3478121b707e68ed3a50ff01f2bc2708ce34f07e6065c53a283fcf7e95af3d'
        'SKIP'
        '0df3608312824e958caa5e501ddd0b70fb0abee87bdcc2db3b752074c115f990b3c2daeb830c58b140dbb95c3bd753d279051af533f5ad99cd4370e947640bad')
validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE') # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>

backup=("opt/rust/cargo/config")

prepare() {
  cd "rustc-${pkgver}-src"

  cp "${srcdir}"/mingw-config.toml bootstrap.toml
  sed -i "s|\@PREFIX\@|/${_prefix}|" bootstrap.toml

  cd "${srcdir}"
  mkdir -p "${srcdir}/rustc-${pkgver}-src/build/cache/${_date}"
  cp rust-std-${_rustc}-x86_64-unknown-linux-gnu.tar.xz "rustc-${pkgver}-src/build/cache/${_date}"
  cp rustc-${_rustc}-x86_64-unknown-linux-gnu.tar.xz "rustc-${pkgver}-src/build/cache/${_date}"
  cp cargo-${_rustc}-x86_64-unknown-linux-gnu.tar.xz "rustc-${pkgver}-src/build/cache/${_date}"
}

build() {
  cd "rustc-${pkgver}-src"

  export CFLAGS="-O2 -pipe -fno-plt -Wall -D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="-O2 -pipe -fno-plt -Wall -D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  # TODO: find a way to disable packaging
  DESTDIR="${srcdir}/rust_install" python ./x.py install
}

package() {
  cd "rustc-${pkgver}-src"
  mv "${srcdir}/rust_install/"* "${pkgdir}"

  # license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"{rustc,cargo}
  mv "${pkgdir}"/${_prefix}/share/doc/cargo/LICENSE-* "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"
  mv "${pkgdir}"/${_prefix}/share/doc/rustc/{licenses,COPYRIGHT*} "${pkgdir}/usr/share/licenses/${pkgname}/rustc/"

  # remove unused files
  rm -r "${pkgdir}/etc"
  rm -r "${pkgdir}/${_prefix}/share"
  rm "${pkgdir}/${_prefix}/lib/rustlib/"{manifest-*,install.log,uninstall.sh,components,rust-installer-version}

  # link shared libraries
  install -dm755 "${pkgdir}/usr/i686-w64-mingw32/bin" && pushd "${pkgdir}/usr/i686-w64-mingw32/bin"
  ln -sf "../../../${_prefix}/lib/rustlib/i686-pc-windows-gnu/lib/"*.dll .
  popd
  install -dm755 "${pkgdir}/usr/x86_64-w64-mingw32/bin" && pushd "${pkgdir}/usr/x86_64-w64-mingw32/bin"
  ln -sf "../../../${_prefix}/lib/rustlib/x86_64-pc-windows-gnu/lib/"*.dll .
  popd

  # strip
  strip --strip-all "${pkgdir}/${_prefix}/bin/"{cargo,rustc,rustdoc}
  strip --strip-all "${pkgdir}/${_prefix}/lib/rustlib/x86_64-unknown-linux-gnu/bin/"rust-lld
  strip --strip-unneeded "${pkgdir}/${_prefix}/lib/librustc_driver"*.so
  strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/x86_64-unknown-linux-gnu/lib/"*.so
  i686-w64-mingw32-strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/i686-pc-windows-gnu/lib/"*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/x86_64-pc-windows-gnu/lib/"*.dll

  # config
  install -dm777 "${pkgdir}/${_prefix}/cargo"
  cat << EOF >> "${pkgdir}/${_prefix}/cargo/config"
[net]
git-fetch-with-cli = true

[target.i686-pc-windows-gnu]
linker = "/usr/bin/i686-w64-mingw32-gcc"
EOF
  if pacman -T "mingw-w64-wine" ; then
    cat << EOF >> "${pkgdir}/${_prefix}/cargo/config"
runner = "/usr/bin/i686-w64-mingw32-wine"
EOF
  fi
  cat << EOF >> "${pkgdir}/${_prefix}/cargo/config"
rustflags = [
            ]

EOF

  cat << EOF >> "${pkgdir}/${_prefix}/cargo/config"
[target.x86_64-pc-windows-gnu]
linker = "/usr/bin/x86_64-w64-mingw32-gcc"
EOF
  if pacman -T "mingw-w64-wine" ; then
    cat << EOF >> "${pkgdir}/${_prefix}/cargo/config"
runner = "/usr/bin/x86_64-w64-mingw32-wine"
EOF
  fi
  cat << EOF >> "${pkgdir}/${_prefix}/cargo/config"
rustflags = [
            ]

EOF
}

# vim:set ts=2 sw=2 et:
