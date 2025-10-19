# Maintainer: pingplug < aur at pingplug dot me >

_pkgname=rust

pkgname=mingw-w64-rust-bin
_prefix=opt/rust
pkgver=1.90.0
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
b2sums=('71e4628e71fdb616a0d30fd524e33d8a07ceacecb31d21b76904594f2ed41c3bf2d1c0c78bdc1761be18c0c4d3763df3c068458f20af1482f66d00c8badba282'
        'SKIP'
        '1fd177d9da7116a28f745637540cb09114a42323a58dc8fe14faa6deeaf8a37e7bde9c7b2a215408c0792ee9efbf341e95f2ab6b37752286592dda48646057f6'
        'SKIP'
        '38337867de2001806db371dbe92ff78eb7f8c9f2361b2669744b03b2a1b5f661d3ed60df2c56885464e948d53d83a76d8973147386f0b18174209efe81b30041'
        'SKIP'
        '1cec79b549ba752dab56e276022357cc749a5638d7f04b2be51788c4f84e40fdeab83ba0a1b26506cb2ebb308b77b5ff3d71bd6df6ce8daabc36d64330429288'
        'SKIP'
        'f014cdcdc70a877bf6c5b8b9472f89e8c00a478560d1350461019629c49efb17f50c5291398f1614ea93b1392b0655d5b551e98bf3cb3bd6014ca3de7a1287a3'
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
