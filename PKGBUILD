# Maintainer: pingplug < aur at pingplug dot me >

_pkgname=rust

pkgname=mingw-w64-rust-bin
pkgver=1.66.0
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

source=("https://static.rust-lang.org/dist/cargo-${pkgver}-x86_64-unknown-linux-gnu.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/rustc-${pkgver}-x86_64-unknown-linux-gnu.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/rust-std-${pkgver}-x86_64-unknown-linux-gnu.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/rust-std-${pkgver}-i686-pc-windows-gnu.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/rust-std-${pkgver}-x86_64-pc-windows-gnu.tar.xz"{,.asc})
sha256sums=('bede77d09248fbcf036ff54ab84768696cdb093d52fb3653b77eeb05dac2b464'
            'SKIP'
            '5d76d653a745cbefcdc13e3976a3e56798af5ca98bf102bb317a0e61702ab90c'
            'SKIP'
            'c59ca7959a019f3f660c1f46bea3c13e7769b67732731469c0c42d02f28d08e7'
            'SKIP'
            'fd9c9632555fb811c78da3149a4a1106ac390ccad8904fe4ca2b1ff77433044b'
            'SKIP'
            'cdf11c7ac53221c25aa0b5ac876d795b07db872484a47c6caf5d648ac8b54d76'
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
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"{rust,cargo}
  mv "${pkgdir}/opt/${_pkgname}/share/doc/cargo/"LICENSE-* "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"
  mv "${pkgdir}/opt/${_pkgname}/share/doc/rust/"{LICENSE-*,COPYRIGHT} "${pkgdir}/usr/share/licenses/${pkgname}/rust/"

  # remove unused files
  rm -r "${pkgdir}/opt/${_pkgname}/"{etc,share}
  rm "${pkgdir}/opt/${_pkgname}/lib/rustlib/"{manifest-*,install.log,uninstall.sh,components,rust-installer-version}

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
  strip --strip-all "${pkgdir}/opt/${_pkgname}/lib/rustlib/x86_64-unknown-linux-gnu/bin/"rust-*
  strip --strip-all "${pkgdir}/opt/${_pkgname}/lib/rustlib/x86_64-unknown-linux-gnu/bin/gcc-ld/"*
  strip --strip-all "${pkgdir}/opt/${_pkgname}/libexec/"*
  strip --strip-unneeded "${pkgdir}/opt/${_pkgname}/lib/librustc"*.so
  strip --strip-unneeded "${pkgdir}/opt/${_pkgname}/lib/libLLVM"*.so
  strip --strip-unneeded "${pkgdir}/opt/${_pkgname}/lib/rustlib/x86_64-unknown-linux-gnu/lib/"*.so
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
            ]

EOF
}

# vim:set ts=2 sw=2 et:
