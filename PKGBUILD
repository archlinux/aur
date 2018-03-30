# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: userwithuid <userwithuid@gmail.com>

pkgname=mingw-w64-rust
_pkgname=rust
pkgver=1.25.0
pkgrel=1
pkgdesc="rust language prebuilt toolchain with mingw target (mingw-w64)"
arch=('any')
url='https://www.rust-lang.org/'
license=('MIT' 'Apache' 'custom')
depends=('gcc-libs' 'curl' 'libgit2' 'mingw-w64-gcc')
optdepends=('wine: for cargo test support')
options=(!emptydirs staticlibs !strip)
provides=()
conflicts=()
replaces=()
makedepends=('rust' 'gdb' 'libffi' 'perl' 'python2' 'nodejs' 'cmake')

source=("https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.xz"{,.asc}
        mingw-config.toml)

sha256sums=('14fcb82d5959df758aaf422539359300917217fa8420e34bd596e3fb6ed2de87'
            'SKIP'
            '497b75a9dfd0f5890a37b1ab8706c52586c08684e47f281bb740686601a81dd3')
validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE') # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>

backup=("opt/${_pkgname}/cargo/config")
PKGEXT=".pkg.tar.gz"

prepare() {
  cd "rustc-$pkgver-src"

  cp "$srcdir"/mingw-config.toml config.toml
  sed -i "s|\@PREFIX\@|/opt/${_pkgname}|" config.toml
}

build() {
  cd "rustc-$pkgver-src"

  unset LDFLAGS
  export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  python2 ./x.py build
}

package() {
  cd "rustc-$pkgver-src"

  # rust will build install tools there
  unset LDFLAGS
  export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  # TODO: find a way to disable packaging
  # use level 0 to speed up xz packaging
  sed -i 's|XzEncoder::new(create_new_file(tar_xz)?, 6)|XzEncoder::new(create_new_file(tar_xz)?, 0)|' "src/tools/rust-installer/src/tarballer.rs"
  DESTDIR="$pkgdir" python2 ./x.py install

  # license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"{rust,cargo}
  mv "${pkgdir}"/opt/${_pkgname}/share/doc/rust/LICENSE-*.old "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"
  rename '.old' '' "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"*
  mv "${pkgdir}"/opt/${_pkgname}/share/doc/rust/{LICENSE-*,COPYRIGHT} "${pkgdir}/usr/share/licenses/${pkgname}/rust/"

  # remove unused files
  rm -r "${pkgdir}/etc/"
  rm -r "${pkgdir}/opt/${_pkgname}/share"
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
  if pacman -T "wine" "mingw-w64-cmake>1-18" ; then
    cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
runner = "/usr/bin/i686-w64-mingw32-wine"
EOF
  fi
  cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
rustflags = [
EOF
  cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
            ]

EOF

  cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
[target.x86_64-pc-windows-gnu]
linker = "/usr/bin/x86_64-w64-mingw32-gcc"
ar = "/usr/x86_64-w64-mingw32/bin/ar"
EOF
  if pacman -T "wine" "mingw-w64-cmake>1-18" ; then
    cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
runner = "/usr/bin/x86_64-w64-mingw32-wine"
EOF
  fi
  cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
rustflags = [
EOF
  if pacman -T "mingw-w64-crt>5.0.3.20171219" ; then
    cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
             "-C", "link-arg=-lmsvcrt",
EOF
  fi
  cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
            ]

EOF
}

# vim:set ts=2 sw=2 et:
