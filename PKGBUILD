# Maintainer: pingplug < aur at pingplug dot me >

_pkgname=rust

pkgname=mingw-w64-rust-bin
_prefix=opt/rust
pkgver=1.86.0
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency (official build, mingw-w64)"
arch=('x86_64')
url="https://www.rust-lang.org"
license=("Apache-2.0 OR MIT")
depends=('gcc-libs'
         'curl'
         'mingw-w64-crt'
         'libgit2'
         'mingw-w64-gcc')
optdepends=('mingw-w64-wine: for cargo test support')
provides=("mingw-w64-rust=${pkgver}")
conflicts=('mingw-w64-rust')
options=('!strip' 'staticlibs' '!buildflags')

source=("https://static.rust-lang.org/dist/cargo-${pkgver}-x86_64-unknown-linux-gnu.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/rustc-${pkgver}-x86_64-unknown-linux-gnu.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/rust-std-${pkgver}-x86_64-unknown-linux-gnu.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/rust-std-${pkgver}-i686-pc-windows-gnu.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/rust-std-${pkgver}-x86_64-pc-windows-gnu.tar.xz"{,.asc})
b2sums=('b26feeeb4469dea045249baf7ece4dc8252c969c5de570fc5d2bbd0264a9ec6f0c3478121b707e68ed3a50ff01f2bc2708ce34f07e6065c53a283fcf7e95af3d'
        'SKIP'
        'ba6ec6c25afb461162fdd069e724d9e10cf5a69e9d34f25823a192d3a8ff27a6c9c2c4574e4b9e85dd887571a8fe984c9e13803d9d31689757dd6dc943054ff9'
        'SKIP'
        '4e70780ad340ccb9d1333fc17e69c1940916e86af86d5de3287d20778abcd0e0790332b914d332be533dd62cf5217e3c27aea5112b504126a7b46940c4e7fcc2'
        'SKIP'
        'bd79be88d2a32412a3b11c19d0f2a6f2c97eb32c11cb7ced0e84011a3a1829c1f9905d8c1ac3b00c551594acec784f32910a30523af941e3418ed1b2cb75f726'
        'SKIP'
        'af51b0aae6ed9ecf85d6d485d18068a29eccd874a4a9103bcd8c9ff4640508999c2f6671df6400d3834cc6d9e5b08b273503a9e71c187e670029ff680f170e05'
        'SKIP')
validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE') # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>

backup=("opt/${_pkgname}/cargo/config")

prepare() {
  cd ${srcdir}
  mkdir -p "rust-${pkgver}-x86_64-unknown-linux-gnu"
  cp "cargo-${pkgver}-x86_64-unknown-linux-gnu/install.sh" "rust-${pkgver}-x86_64-unknown-linux-gnu"

  mv "cargo-${pkgver}-x86_64-unknown-linux-gnu/cargo" "rust-${pkgver}-x86_64-unknown-linux-gnu"
  cat "cargo-${pkgver}-x86_64-unknown-linux-gnu/components" >> "rust-${pkgver}-x86_64-unknown-linux-gnu/components"

  mv "rustc-${pkgver}-x86_64-unknown-linux-gnu/rustc" "rust-${pkgver}-x86_64-unknown-linux-gnu"
  cat "rustc-${pkgver}-x86_64-unknown-linux-gnu/components" >> "rust-${pkgver}-x86_64-unknown-linux-gnu/components"

  mv "rust-std-${pkgver}-x86_64-unknown-linux-gnu/rust-std-x86_64-unknown-linux-gnu" "rust-${pkgver}-x86_64-unknown-linux-gnu"
  cat "rust-std-${pkgver}-x86_64-unknown-linux-gnu/components" >> "rust-${pkgver}-x86_64-unknown-linux-gnu/components"

  mv "rust-std-${pkgver}-i686-pc-windows-gnu/rust-std-i686-pc-windows-gnu" "rust-${pkgver}-x86_64-unknown-linux-gnu"
  cat "rust-std-${pkgver}-i686-pc-windows-gnu/components" >> "rust-${pkgver}-x86_64-unknown-linux-gnu/components"

  mv "rust-std-${pkgver}-x86_64-pc-windows-gnu/rust-std-x86_64-pc-windows-gnu" "rust-${pkgver}-x86_64-unknown-linux-gnu"
  cat "rust-std-${pkgver}-x86_64-pc-windows-gnu/components" >> "rust-${pkgver}-x86_64-unknown-linux-gnu/components"
}

package() {
  cd "${srcdir}/rust-${pkgver}-x86_64-unknown-linux-gnu"
  # rustc, cargo, and libs.
  ./install.sh \
    --disable-ldconfig \
    --destdir="${pkgdir}" \
    --components=rustc,cargo,rust-std-x86_64-unknown-linux-gnu,rust-std-i686-pc-windows-gnu,rust-std-x86_64-pc-windows-gnu \
    --prefix=/opt/${_pkgname}

  # license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"{rustc,cargo}
  mv "${pkgdir}"/${_prefix}/share/doc/cargo/LICENSE-* "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"
  mv "${pkgdir}"/${_prefix}/share/doc/rust/{licenses,COPYRIGHT*} "${pkgdir}/usr/share/licenses/${pkgname}/rustc/"

  # remove unused files
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
  strip --strip-all "${pkgdir}/${_prefix}/lib/rustlib/x86_64-unknown-linux-gnu/bin/"{rust-lld,wasm-component-ld}
  strip --strip-all "${pkgdir}/${_prefix}/libexec/"*
  strip --strip-unneeded "${pkgdir}/${_prefix}/lib/librustc_driver"*.so
  strip --strip-unneeded "${pkgdir}/${_prefix}/lib/libLLVM.so"*
  strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/x86_64-unknown-linux-gnu/lib/"*.so
  i686-w64-mingw32-strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/i686-pc-windows-gnu/lib/"*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/x86_64-pc-windows-gnu/lib/"*.dll

  # config
  install -dm777 "${pkgdir}/${_prefix}/cargo"
  cat << EOF >> "${pkgdir}/${_prefix}/cargo/config"
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
