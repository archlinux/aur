# Maintainer: pingplug <pingplug@foxmail.com>

_pkgname=rust
_cargo=0.33.0

pkgname=mingw-w64-rust-bin
pkgver=1.32.0
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency (PLEASE READ COMMENTS FIRST) (official build, mingw-w64)"
arch=('x86_64')
url="https://www.rust-lang.org"
license=('MIT' 'Apache' 'custom')
depends=('gcc-libs'
         'curl'
         'mingw-w64-crt'
         'libgit2'
         'mingw-w64-gcc')
optdepends=('mingw-w64-wine: for cargo test support')
provides=("mingw-w64-rust=${pkgver}")
conflicts=('mingw-w64-rust')
options=('!strip' 'staticlibs' '!buildflags')

source=("https://static.rust-lang.org/dist/cargo-${_cargo}-x86_64-unknown-linux-gnu.tar.gz"{,.asc}
        "https://static.rust-lang.org/dist/rustc-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"{,.asc}
        "https://static.rust-lang.org/dist/rust-std-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"{,.asc}
        "https://static.rust-lang.org/dist/rust-std-${pkgver}-i686-pc-windows-gnu.tar.gz"{,.asc}
        "https://static.rust-lang.org/dist/rust-std-${pkgver}-x86_64-pc-windows-gnu.tar.gz"{,.asc})
sha256sums=('9dd7f79a0ab882ed7c892731514a4aed6435f7bc8a20381a8346b471c8a14209'
            'SKIP'
            '75c31f32e19548c1608611d08b82b87560e02f15caac7b2663a8189a4609977c'
            'SKIP'
            '9f2705a3ed3217c13fd55569406c52f590030752f57520312e135223ae930caf'
            'SKIP'
            '06ddc4a24314ca2edc264e39ddebe545cb5bc1170bc69575c01de60e14acc00a'
            'SKIP'
            'cad5f1454d591c13eeb3657f1c9dbfeb30e648f59680bd0765b94c63e7afc49e'
            'SKIP')
validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE') # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>

backup=("opt/${_pkgname}/cargo/config")
PKGEXT=".pkg.tar.gz"

prepare() {
  cd ${srcdir}
  mkdir -p "rust-${pkgver}-x86_64-unknown-linux-gnu"
  cp "cargo-${_cargo}-x86_64-unknown-linux-gnu/install.sh" "rust-${pkgver}-x86_64-unknown-linux-gnu"

  mv "cargo-${_cargo}-x86_64-unknown-linux-gnu/cargo" "rust-${pkgver}-x86_64-unknown-linux-gnu"
  cat "cargo-${_cargo}-x86_64-unknown-linux-gnu/components" >> "rust-${pkgver}-x86_64-unknown-linux-gnu/components"

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
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"{rust,cargo}
  mv "${pkgdir}/opt/${_pkgname}/share/doc/cargo/"LICENSE-* "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"
  mv "${pkgdir}/opt/${_pkgname}/share/doc/rust/"{LICENSE-*,COPYRIGHT} "${pkgdir}/usr/share/licenses/${pkgname}/rust/"

  # remove unused files
  rm -r "${pkgdir}/opt/${_pkgname}/"{etc,share}
  rm "${pkgdir}/opt/${_pkgname}/lib/rustlib/"{manifest-*,install.log,uninstall.sh,components,rust-installer-version}
  rm "${pkgdir}/opt/${_pkgname}/lib/rustlib/x86_64-unknown-linux-gnu/codegen-backends/librustc_codegen_llvm-emscripten.so"
  rm "${pkgdir}/opt/${_pkgname}/lib/rustlib/i686-pc-windows-gnu/lib/"{arena,fmt_macros,graphviz,rustc,serialize,syntax}*.dll
  rm "${pkgdir}/opt/${_pkgname}/lib/rustlib/x86_64-pc-windows-gnu/lib/"{arena,fmt_macros,graphviz,rustc,serialize,syntax}*.dll

  # link shared libraries
  pushd "${pkgdir}/opt/${_pkgname}/lib"
  ln -sf "rustlib/x86_64-unknown-linux-gnu/lib/"*.so .
  popd
  install -dm755 "${pkgdir}/usr/i686-w64-mingw32/bin" && pushd "${pkgdir}/usr/i686-w64-mingw32/bin"
  ln -sf "../../../opt/${_pkgname}/lib/rustlib/i686-pc-windows-gnu/lib/"*.dll .
  popd
  install -dm755 "${pkgdir}/usr/x86_64-w64-mingw32/bin" && pushd "${pkgdir}/usr/x86_64-w64-mingw32/bin"
  ln -sf "../../../opt/${_pkgname}/lib/rustlib/x86_64-pc-windows-gnu/lib/"*.dll .
  popd

  # strip
  strip --strip-all "${pkgdir}/opt/${_pkgname}/bin/"{cargo,rustc,rustdoc}
  strip --strip-all "${pkgdir}/opt/${_pkgname}/lib/rustlib/x86_64-unknown-linux-gnu/bin/"rust-lld
  strip --strip-unneeded "${pkgdir}/opt/${_pkgname}/lib/rustlib/x86_64-unknown-linux-gnu/lib/"*.so
  strip --strip-unneeded "${pkgdir}/opt/${_pkgname}/lib/rustlib/x86_64-unknown-linux-gnu/codegen-backends/"*.so
  i686-w64-mingw32-strip --strip-unneeded "${pkgdir}/opt/${_pkgname}/lib/rustlib/i686-pc-windows-gnu/lib/"*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "${pkgdir}/opt/${_pkgname}/lib/rustlib/x86_64-pc-windows-gnu/lib/"*.dll

  # config
  install -dm777 "${pkgdir}/opt/${_pkgname}/cargo"
  cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
[target.i686-pc-windows-gnu]
linker = "/usr/bin/i686-w64-mingw32-gcc"
ar = "/usr/i686-w64-mingw32/bin/ar"
EOF
  if pacman -T "mingw-w64-wine" ; then
    cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
runner = "/usr/bin/i686-w64-mingw32-wine"
EOF
  fi
  cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
rustflags = [
EOF
  if [[ ! -f "/usr/i686-w64-mingw32/bin/libgcc_s_dw2-1.dll" ]] ; then
    cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
             "-C", "panic=abort",
EOF
  fi
  cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
            ]

EOF

  cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
[target.x86_64-pc-windows-gnu]
linker = "/usr/bin/x86_64-w64-mingw32-gcc"
ar = "/usr/x86_64-w64-mingw32/bin/ar"
EOF
  if pacman -T "mingw-w64-wine" ; then
    cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
runner = "/usr/bin/x86_64-w64-mingw32-wine"
EOF
  fi
  cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
rustflags = [
EOF
  if [[ ! -f "/usr/x86_64-w64-mingw32/bin/libgcc_s_seh-1.dll" ]] ; then
    cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
             "-C", "panic=abort",
EOF
  fi
  cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
            ]

EOF
}

# vim:set ts=2 sw=2 et:
