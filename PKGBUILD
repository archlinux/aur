# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: userwithuid <userwithuid@gmail.com>

_pkgname=rust
_date=2018-12-20
_rustc=1.31.1
_cargo=0.32.0

pkgname=mingw-w64-rust
_prefix=opt/rust
pkgver=1.32.0
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency (mingw-w64)"
arch=('x86_64')
url="https://www.rust-lang.org"
license=('MIT' 'Apache' 'custom')
depends=('gcc-libs'
         'curl'
         'libgit2'
         'mingw-w64-gcc')
optdepends=('mingw-w64-wine: for cargo test support')
makedepends=('gdb'
             'ninja'
             'libffi'
             'perl'
             'python2'
             'nodejs'
             'cmake')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://static.rust-lang.org/dist/rustc-${pkgver}-src.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/${_date}/rust-std-${_rustc}-x86_64-unknown-linux-gnu.tar.gz"{,.asc}
        "https://static.rust-lang.org/dist/${_date}/rustc-${_rustc}-x86_64-unknown-linux-gnu.tar.gz"{,.asc}
        "https://static.rust-lang.org/dist/${_date}/cargo-${_cargo}-x86_64-unknown-linux-gnu.tar.gz"{,.asc}
        "mingw-config.toml")
noextract=("rust-std-${_rustc}-x86_64-unknown-linux-gnu.tar.gz"
           "rustc-${_rustc}-x86_64-unknown-linux-gnu.tar.gz"
           "cargo-${_cargo}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('d617a7dc39daaafa8256320991005fc376c8ef2080593918301b24466d0067af'
            'SKIP'
            '699664b3a64959a2d75e486e19e7cc9934cbcbf2c57a977dd2a2b33cff367da1'
            'SKIP'
            '77d47ce7e27a146e4301f11befd43f3fc5ac195ace0dfc07ac8154f130b057ea'
            'SKIP'
            'b3d3dc57182fb173ecf367f7884dceb855a096d9b9b32eba994e3359ddc68cd4'
            'SKIP'
            'cae935e74967a7a57cb30cca084597896fa4724e2b46eabb44906e72bb96c649')
validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE') # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>

backup=("opt/rust/cargo/config")
PKGEXT=".pkg.tar.gz"

prepare() {
  cd "rustc-${pkgver}-src"

  cp "${srcdir}"/mingw-config.toml config.toml
  sed -i "s|\@PREFIX\@|/${_prefix}|" config.toml
  cd "${srcdir}/rustc-${pkgver}-src/src/bootstrap"

  cd "${srcdir}"
  mkdir -p "${srcdir}/rustc-${pkgver}-src/build/cache/${_date}"
  cp rust-std-${_rustc}-x86_64-unknown-linux-gnu.tar.gz "rustc-${pkgver}-src/build/cache/${_date}"
  cp rustc-${_rustc}-x86_64-unknown-linux-gnu.tar.gz "rustc-${pkgver}-src/build/cache/${_date}"
  cp cargo-${_cargo}-x86_64-unknown-linux-gnu.tar.gz "rustc-${pkgver}-src/build/cache/${_date}"
}

build() {
  cd "rustc-${pkgver}-src"

  export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  python2 ./x.py build
}

package() {
  cd "rustc-${pkgver}-src"

  # rust will build install tools there
  export CFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  # TODO: find a way to disable packaging
  # use level 0 to speed up xz packaging
  sed -i 's|XzEncoder::new(create_new_file(tar_xz)?, 6)|XzEncoder::new(create_new_file(tar_xz)?, 0)|' "src/tools/rust-installer/src/tarballer.rs"
  DESTDIR="${pkgdir}" python2 ./x.py install

  # license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"{rust,cargo}
  mv "${pkgdir}"/${_prefix}/share/doc/rust/LICENSE-*.old "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"
  rename '.old' '' "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"*
  mv "${pkgdir}"/${_prefix}/share/doc/rust/{LICENSE-*,COPYRIGHT} "${pkgdir}/usr/share/licenses/${pkgname}/rust/"

  # remove unused files
  rm -r "${pkgdir}/etc/"
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
  strip --strip-all "${pkgdir}/${_prefix}/lib/rustlib/x86_64-unknown-linux-gnu/bin/"rust-lld
  strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/x86_64-unknown-linux-gnu/lib/"*.so
  strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/x86_64-unknown-linux-gnu/codegen-backends/"*.so
  i686-w64-mingw32-strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/i686-pc-windows-gnu/lib/"*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/x86_64-pc-windows-gnu/lib/"*.dll

  # config
  install -dm777 "${pkgdir}/opt/rust/cargo"
  cat << EOF >> "${pkgdir}/opt/rust/cargo/config"
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
