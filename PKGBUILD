# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=powershell-dsc
pkgver=3.3.0
pkgrel=3
pkgdesc="Microsoft Desired State Configuration v3 platform"
arch=(x86_64)
url='https://github.com/PowerShell/DSC'
license=(MIT)
depends=(glibc libgcc bash)
# PowerShell before 7.6.9-3 crashes when started from pwsh, which the PowerShell adapter does
optdepends=('powershell>=7.6.9-3: PowerShell adapter and resources')
makedepends=(git cargo tree-sitter-cli nodejs protobuf 'powershell>=7.6.9-3')
# Upstream created the v3.3.0 tag from main (3.4.0-preview.1) instead of the release commit
# on release/v3.3, which the published release was built from
_commit="ea572fa755dbd49fb52339043409fbd50a625600"
source=("$pkgname::git+$url#commit=$_commit"
  "dsc-build.ps1"
  "dsc-test.ps1"
  "dsc-install.ps1"
  "osinfo-rolling-release.patch")
sha512sums=('4a52d6505cc110c2b14a0609994d3a30c6bc2a1cca8bd01e7eed76eca5c8d41ad25e991b7763b0ff5a94ec4bbb7d1a724818625336939b37649bc302fd2bafb1'
            '32354322f14010d8a8bdb69edaa3858b1f6a395b88f83eeb9fdf97e5c6cb90210551fd6997e74b5bfc620c28f9fdeb9e2ded0950bcb8109a478f960bde6da71c'
            '12cf29ffc85f82f4a41b3d63cc4cf8c19cb12138dc96a26067a05d7b8bb7f6eaabc30b38a7103a5633741dbd9920b8d62fe53a353a88ec57393e1ed4b3f9dc35'
            '3d9f086aa6bcd667fdcb9db5aaf121385b916fd335d42449b87b41aec293187c6a53804cb2ccddb85a370c0941460cff1f3eb762fb729cf5b7017f21d936e0c3'
            'bf7f14353e8012043e5e323ad984729ce8c163a7b02c53f9ba3a0a90b3acbf8162370114cd2ae4cc1d725a72f9f3930d044c7a3cd29c3e9efb19116cf24dff57')
b2sums=('6b85f40d3aa0cdc98a3ca6fc64542be38ea62b69b08a5cb7ab666e810fa81882834799394755e7c5b2fb473e7ae275f63e2f0f53e19a862f467cde57a4231bd3'
        'be83f1a08333a654d54d2744c3c270c89ea031c4e79ab8f8a1b22646c6d5350cd8638d20e24745e4f27054e178bdd6720b1bf1c8e25d0fdc28a90e1bedd501f9'
        'af1bc66d894ec36e80f7d35da8a8b2454f7ca168c9cd06136a370828fddea5ff6df52646ed2d195bf02007289049ce8c72238d1fe45a664ae39a4f60c1ae0c88'
        '261e33f2beacfaa4e54a5401c33301d0b20a43b3f6d1676b48384d386809332b38d5eb3d49453e40778bb9959803ce042d22adaccf87ac6c1d94ec5e9c6586ef'
        '3ac05a07200e7099e6f880dfb9a52091adaa5c26f062869962b554b72a028e8ed6853c06832837caba03944eef094cd100b3a54d87e46a8e5d37bfbc0b8ae5d9')
options=('!lto' '!debug')

prepare() {
  # Upstream uses a private registry
  # We need to delete this to use the usual crates.io
  rm "$pkgname"/.cargo/config.toml

  cd "$pkgname" || exit
  # Microsoft/OSInfo can't compare non-numeric versions like Arch's "Rolling Release" and reported a
  # requested codename as in the desired state although Arch has none. Fixed upstream on main.
  # Upstream issue: https://github.com/PowerShell/DSC/issues/1777
  # Upstream fix: https://github.com/PowerShell/DSC/pull/1778
  patch -Np1 -i "$srcdir/osinfo-rolling-release.patch"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  # Everything was fetched in prepare()
  export CARGO_NET_OFFLINE=true
  pwsh -NoProfile -NonInteractive -File dsc-build.ps1 -SourcePath "$srcdir/$pkgname"
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_NET_OFFLINE=true
  # Run the tests with a home of their own, so they neither see the profiles, modules and configs
  # of the user building the package, nor leave their own files behind in the user's home.
  # Cargo and rustup keep using the builder's ones, which have what prepare() fetched.
  export CARGO_HOME="${CARGO_HOME:-$HOME/.cargo}"
  export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"
  rm -rf "$srcdir/test-home"
  export HOME="$srcdir/test-home"
  export XDG_CONFIG_HOME="$HOME/.config"
  export XDG_DATA_HOME="$HOME/.local/share"
  export XDG_CACHE_HOME="$HOME/.cache"
  export XDG_STATE_HOME="$HOME/.local/state"
  mkdir -p "$HOME"

  cd "$srcdir" || exit
  pwsh -NoProfile -NonInteractive -File dsc-test.ps1 -SourcePath "$srcdir/$pkgname" -ModulePath "$srcdir/test-modules"
}

package() {
  # Same layout as upstream's packages: everything in one folder, as dsc looks for resources next
  # to itself and the PowerShell adapter runs ./psDscAdapter/powershell.resource.ps1 from there.
  # Only dsc and dsc-bicep-ext are put on PATH.
  pwsh -NoProfile -NonInteractive -File dsc-install.ps1 -SourcePath "$srcdir/$pkgname" -Destination "$pkgdir/usr/lib/DSC"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/DSC/dsc "$pkgdir/usr/bin/dsc"
  ln -s /usr/lib/DSC/dsc-bicep-ext "$pkgdir/usr/bin/dsc-bicep-ext"

  install -Dm644 "$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
