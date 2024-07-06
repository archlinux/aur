# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Johannes Löthberg < johannes at kyriasis dot com >
# Contributor: Alexander F Rødseth < xyproto at archlinux dot org >
# Contributor: Daniel Micay < danielmicay at gmail dot com >
# Contributor: userwithuid < userwithuid at gmail dot com >

_pkgname=rust
_date=2024-05-02
_rustc=1.78.0

pkgname=mingw-w64-rust
_prefix=opt/rust
pkgver=1.79.0
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency (mingw-w64)"
arch=('x86_64')
url="https://www.rust-lang.org"
license=('MIT' 'Apache' 'custom')
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
sha256sums=('ab826e84b8d48ec6eda3370065034dea8c006f6a946d78a9ba12bcb50e6d3c7a'
            'SKIP'
            '95aece42a336f237c5bac5c5d9aca051b7f0bd3e6a64fb3c5828e6d0d3af2e8c'
            'SKIP'
            '3994971e5923716d54e4b574ce238f04c4e20cda03990670f7cc3f87d36e5499'
            'SKIP'
            'f8aacf7a101eb10dc000b8bf26de90a9d0ce678d02ccf70430ed20dd31ecec6b'
            'SKIP'
            '739e5fc43ca5da6e4446752fc25a3bc5f784efca81faa7bcc41cc53b608e764e')
validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE') # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>

backup=("opt/rust/cargo/config")

prepare() {
  cd "rustc-${pkgver}-src"

  cp "${srcdir}"/mingw-config.toml config.toml
  sed -i "s|\@PREFIX\@|/${_prefix}|" config.toml

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
  mv "${pkgdir}"/${_prefix}/share/doc/rustc/{LICENSE-*,COPYRIGHT} "${pkgdir}/usr/share/licenses/${pkgname}/rustc/"

  # remove unused files
  rm -r "${pkgdir}/etc"
  rm -r "${pkgdir}/${_prefix}/share"
  rm "${pkgdir}/${_prefix}/lib/rustlib/"{manifest-*,install.log,uninstall.sh,components,rust-installer-version}

  # link shared libraries
  pushd "${pkgdir}/${_prefix}/lib"
  ln -sf "rustlib/x86_64-unknown-linux-gnu/lib/"*.so .
  popd
  install -dm755 "${pkgdir}/usr/i686-w64-mingw32/bin" && pushd "${pkgdir}/usr/i686-w64-mingw32/bin"
  ln -sf "../../../${_prefix}/lib/rustlib/i686-pc-windows-gnu/lib/"*.dll .
  popd
  install -dm755 "${pkgdir}/usr/x86_64-w64-mingw32/bin" && pushd "${pkgdir}/usr/x86_64-w64-mingw32/bin"
  ln -sf "../../../${_prefix}/lib/rustlib/x86_64-pc-windows-gnu/lib/"*.dll .
  popd

  # strip
  strip --strip-all "${pkgdir}/${_prefix}/bin/"{cargo,rustc,rustdoc}
  strip --strip-all "${pkgdir}/${_prefix}/lib/rustlib/x86_64-unknown-linux-gnu/bin/"rust-*
  strip --strip-all "${pkgdir}/${_prefix}/lib/rustlib/x86_64-unknown-linux-gnu/bin/gcc-ld/"*
  strip --strip-unneeded "${pkgdir}/${_prefix}/lib/librustc"*.so
  strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/x86_64-unknown-linux-gnu/lib/"*.so
  i686-w64-mingw32-strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/i686-pc-windows-gnu/lib/"*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/x86_64-pc-windows-gnu/lib/"*.dll

  # config
  install -dm777 "${pkgdir}/opt/rust/cargo"
  cat << EOF >> "${pkgdir}/opt/rust/cargo/config"
[net]
git-fetch-with-cli = true

[target.i686-pc-windows-gnu]
linker = "/usr/bin/i686-w64-mingw32-gcc"
EOF
  if pacman -T "mingw-w64-wine" ; then
    cat << EOF >> "${pkgdir}/opt/rust/cargo/config"
runner = "/usr/bin/i686-w64-mingw32-wine"
EOF
  fi
  cat << EOF >> "${pkgdir}/opt/rust/cargo/config"
rustflags = [
            ]

EOF

  cat << EOF >> "${pkgdir}/opt/rust/cargo/config"
[target.x86_64-pc-windows-gnu]
linker = "/usr/bin/x86_64-w64-mingw32-gcc"
EOF
  if pacman -T "mingw-w64-wine" ; then
    cat << EOF >> "${pkgdir}/opt/rust/cargo/config"
runner = "/usr/bin/x86_64-w64-mingw32-wine"
EOF
  fi
  cat << EOF >> "${pkgdir}/opt/rust/cargo/config"
rustflags = [
            ]

EOF
}

# vim:set ts=2 sw=2 et:
