# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Johannes Löthberg < johannes at kyriasis dot com >
# Contributor: Alexander F Rødseth < xyproto at archlinux dot org >
# Contributor: Daniel Micay < danielmicay at gmail dot com >
# Contributor: userwithuid < userwithuid at gmail dot com >

_pkgname=rust
_date=2025-08-07
_rustc=1.89.0

pkgname=mingw-w64-rust
_prefix=opt/rust
pkgver=1.90.0
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
b2sums=('82dbbe3b5fe79f623c74fb81a4c4372b14e7d765f0e9af3d76a6c4bde9899007c85c8af70dfd9facc06c37a9c8d03a4597ec87b2d053585ccbc2287332b27e70'
        'SKIP'
        '324e4268e1ea01990af08c6b0c81f7ea03aea7c43aa49662a0ee73a7f4f85eb8d01730d2e898161234bf687ede6b9dce19778da289c33a12999ea6512a58ca62'
        'SKIP'
        '2738065c9c5e386b71a6119a5371eaee52e44d7a8f5fbacccf96631092e91cd3ec8f250b9bb8d9033f4e5b3c503cec0f381568ad4d1f255a4d2bfd4b10b1208b'
        'SKIP'
        '933968dfc4a743b13f798cd18cd32bef935c2604ce4ba963b9822a7efabfb696f51f7123c549600803f1ee146dec5be03dca5f53b9715529fcc03acad8986317'
        'SKIP'
        '39c5e93e778ef2e13534a4ae782ef9d6f7918bd6224056b80302a1f1e3ec19aa856ca976663998c34096773beb39142ad8df9fecff4e1f3f751a982974519be4')
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
