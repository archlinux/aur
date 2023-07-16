# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Johannes Löthberg < johannes at kyriasis dot com >
# Contributor: Alexander F Rødseth < xyproto at archlinux dot org >
# Contributor: Daniel Micay < danielmicay at gmail dot com >
# Contributor: userwithuid < userwithuid at gmail dot com >

_pkgname=rust
_date=2023-06-01
_rustc=1.70.0

pkgname=mingw-w64-rust
_prefix=opt/rust
pkgver=1.71.0
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
sha256sums=('5814699031aafdcc2e2f71fc9b389678cd7042350d1583da061463d8e88681c7'
            'SKIP'
            '0c0129717da1e27ccf2c56da950d2fe56973f71beec9e80ae6904b282d2f0ee9'
            'SKIP'
            '7d891d3e9bc4f1151545c83cbe3bc6af9ed234388c45ca2e19641262f48615e2'
            'SKIP'
            '650e7a890a52869cd14e2305652bff775aec7fc2cf47fc62cf4a89ff07242333'
            'SKIP'
            '2661456d13366cd181de9e7ddfa797c7ef6be9fe9f3d0d766089870e45b8010c')
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
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"{rust,cargo}
  mv "${pkgdir}"/${_prefix}/share/doc/rust/LICENSE-*.old "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"
  rename '.old' '' "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"*
  mv "${pkgdir}"/${_prefix}/share/doc/rust/{LICENSE-*,COPYRIGHT} "${pkgdir}/usr/share/licenses/${pkgname}/rust/"

  # remove unused files
  rm -r "${pkgdir}/${_prefix}/"{share,src}
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
  strip --strip-all "${pkgdir}/${_prefix}/libexec/"*
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
ar = "/usr/i686-w64-mingw32/bin/ar"
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
ar = "/usr/x86_64-w64-mingw32/bin/ar"
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
