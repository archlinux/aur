# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=rust-wasm
epoch=1
pkgver=1.49.0
pkgrel=1

pkgdesc='Rust compiler with wasm32-unknown-unknown and x86_64-unknown-linux-gnu targets'
url='https://www.rust-lang.org/'
arch=('x86_64')
license=('MIT' 'Apache')

makedepends=('rust' 'libffi' 'ninja' 'perl' 'python' 'curl' 'cmake')

options=('!emptydirs' '!strip')

depends=(gcc-libs curl libssh2 lib32-gcc-libs)
provides=(rust rust-wasm cargo rustfmt)
conflicts=(rust cargo rustfmt)
replaces=(cargo rustfmt cargo-tree)

source=("${pkgname}-${pkgver}.tar.gz::https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz"{,.asc})

sha256sums=('b50aefa8df1fdfc9bccafdbf37aee611c8dfe81bf5648d5f43699c50289dc779'
            'b50aefa8df1fdfc9bccafdbf37aee611c8dfe81bf5648d5f43699c50289dc779')
validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE'  # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>
              '474E22316ABF4785A88C6E8EA2C794A986419D8A'  # Tom Stellard <tstellar@redhat.com>
              'B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
prepare() {
  cd "rustc-$pkgver-src"
  cat >config.toml <<END
[build]
target = ["x86_64-unknown-linux-gnu", "wasm32-unknown-unknown"]
extended = true
docs = false
sanitizers = false
profiler = true
vendor = true

[rust]
channel = "stable"
rpath = false
lld = true

[install]
prefix = "/usr"

[target.wasm32-unknown-unknown]
wasi-root = "/usr/lib/wasi"
profiler = false
END
}

build() {
  cd "rustc-$pkgver-src"
  export CARGO_HOME="${srcdir}/cargo_home"
  python x.py dist -j "$(nproc)"
}

package() {
  cd "rustc-$pkgver-src"
  export CARGO_HOME="${srcdir}/cargo_home"
  DESTDIR="${pkgdir}" python x.py install -j "$(nproc)"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE*

  # delete unnecesary files, e.g. components and manifest files only used for the uninstall script
  cd "$pkgdir"/usr/lib/rustlib
  rm components install.log manifest-* rust-installer-version uninstall.sh

  # rustbuild always installs copies of the shared libraries to /usr/lib,
  # overwrite them with symlinks to the per-architecture versions
  ln -srft "$pkgdir"/usr/lib x86_64-unknown-linux-gnu/lib/*.so

  install -d "$pkgdir"/usr/share/bash-completion/
  mv "$pkgdir"/etc/bash_completion.d "$pkgdir"/usr/share/bash-completion/completions
}

# vim:set ts=2 sw=2 et:
