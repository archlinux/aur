# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: userwithuid <userwithuid@gmail.com>

pkgname=mingw-w64-rust
_pkgname=rust
pkgver=1.23.0
pkgrel=2
pkgdesc="rust language prebuilt toolchain with mingw target (mingw-w64)"
arch=('any')
url='https://www.rust-lang.org/'
license=('MIT' 'Apache' 'custom')
depends=('gcc-libs' 'curl' 'libgit2' 'mingw-w64-gcc')
optdepends=('wine: for cargo test support')
options=(!emptydirs staticlibs !strip)
provides=()
conflicts=('mingw-w64-rust-bin')
replaces=('mingw-w64-rust-bin')
makedepends=('rust' 'libffi' 'perl' 'python2' 'nodejs' 'cmake')

source=("https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz"{,.asc}
        mingw-config.toml)

sha256sums=('7464953871dcfdfa8afcc536916a686dd156a83339d8ec4d5cb4eb2fe146cb91'
            'SKIP'
            '4a63841b4c3be5de4ff11241bc45a4ac7ab03889af4f7ed64442c524be7f5d74')
validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE') # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>

backup=("opt/${_pkgname}/cargo/config")

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

  unset LDFLAGS
  export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  DESTDIR="$pkgdir" python2 ./x.py install

  # license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"{rust,cargo}
  mv "${pkgdir}"/opt/${_pkgname}/share/doc/rust/LICENSE-*.old "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"
  rename '.old' '' "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"*
  mv "${pkgdir}"/opt/${_pkgname}/share/doc/rust/{LICENSE-*,COPYRIGHT} "${pkgdir}/usr/share/licenses/${pkgname}/rust/"

  # remove unused files, rust-doc, rls, rustfmt, rust-analysis, rust-src
  rm -r "${pkgdir}/etc/"
  rm -r "${pkgdir}/opt/${_pkgname}/share"
  rm "${pkgdir}/opt/${_pkgname}/bin/"{rls,rustfmt}
  rm -r "${pkgdir}/opt/${_pkgname}/lib/rustlib/"{i686,x86_64}-pc-windows-gnu/analysis
  rm -r "${pkgdir}/opt/${_pkgname}/lib/rustlib/"x86_64-unknown-linux-gnu/analysis
  rm "${pkgdir}/opt/${_pkgname}/lib/rustlib/"{manifest-*,install.log,uninstall.sh,components,rust-installer-version}
  rm -r "${pkgdir}/opt/${_pkgname}/lib/rustlib/src"

  # link shared libraries
  pushd "${pkgdir}/opt/${_pkgname}/lib"
  ln -sf "rustlib/x86_64-unknown-linux-gnu/lib/"*.so .
  popd
  pushd "${pkgdir}"
  install -dm755 "${pkgdir}/usr/i686-w64-mingw32/bin"
  ln -sf "opt/${_pkgname}/lib/rustlib/i686-pc-windows-gnu/lib/"*.dll "usr/i686-w64-mingw32/bin"
  install -dm755 "${pkgdir}/usr/x86_64-w64-mingw32/bin"
  ln -sf "opt/${_pkgname}/lib/rustlib/x86_64-pc-windows-gnu/lib/"*.dll "usr/x86_64-w64-mingw32/bin"
  popd

  # strip
  strip --strip-all "${pkgdir}/opt/${_pkgname}/bin/"{cargo,rustc,rustdoc}
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
  if pacman -T "wine" ; then
    cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
runner = "wine"
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
  if pacman -T "wine" ; then
    cat << EOF >> "${pkgdir}/opt/${_pkgname}/cargo/config"
runner = "wine"
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
