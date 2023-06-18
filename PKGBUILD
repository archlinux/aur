# Maintainer: Dominik Nakamura <dnaka91@gmail.com>
# https://github.com/dnaka91/pkgbuilds

pkgname=llvm-cov-pretty
pkgver=0.1.0
pkgrel=1
pkgdesc="More beautiful HTML reports for llvm-cov/cargo-llvm-cov"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/dnaka91/llvm-cov-pretty"
license=('AGPL3')
depends=('gcc-libs' 'cargo-llvm-cov')
makedepends=('git' 'nodejs' 'yarn')
source=("$pkgname::git+$url.git#tag=v$pkgver"
        "git+https://github.com/MarkMichos/1337-Scheme.git"
        "git+https://github.com/ArmandPhilippot/coldark-bat.git"
        "git+https://github.com/RainyDayMedia/DarkNeon.git"
        "git+https://github.com/dracula/sublime.git"
        "git+https://github.com/AlexanderEkdahl/github-sublime-theme.git"
        "git+https://github.com/subnut/gruvbox-tmTheme.git"
        "git+https://github.com/crabique/Nord-plist.git"
        "git+https://github.com/sonph/onehalf.git"
        "git+https://github.com/braver/Solarized.git"
        "git+https://github.com/jonschlinkert/sublime-monokai-extended.git"
        "git+https://github.com/greggb/sublime-snazzy.git"
        "git+https://github.com/erremauro/TwoDark.git"
        "git+https://github.com/vidann1/visual-studio-dark-plus.git"
        "git+https://github.com/colinta/zenburn".git)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd "$pkgname"

  git config submodule.assets/themes/1337-Scheme.url "$srcdir/1337-Scheme"
  git config submodule.assets/themes/Coldark.url "$srcdir/coldark-bat"
  git config submodule.assets/themes/DarkNeon.url "$srcdir/DarkNeon"
  git config submodule.assets/themes/dracula-sublime.url "$srcdir/sublime"
  git config submodule.assets/themes/github-sublime-theme.url "$srcdir/github-sublime-theme"
  git config submodule.assets/themes/gruvbox.url "$srcdir/gruvbox-tmTheme"
  git config submodule.assets/themes/Nord-sublime.url "$srcdir/Nord-plist"
  git config submodule.assets/themes/onehalf.url "$srcdir/onehalf"
  git config submodule.assets/themes/Solarized.url "$srcdir/Solarized"
  git config submodule.assets/themes/sublime-monokai-extended.url "$srcdir/sublime-monokai-extended"
  git config submodule.assets/themes/sublime-snazzy.url "$srcdir/sublime-snazzy"
  git config submodule.assets/themes/TwoDark.url "$srcdir/TwoDark"
  git config submodule.assets/themes/visual-studio-dark-plus.url "$srcdir/visual-studio-dark-plus"
  git config submodule.assets/themes/zenburn.url "$srcdir/zenburn"
  git -c protocol.file.allow=always submodule update --init

  yarn install
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  yarn run build
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -Dm 755 target/release/"$pkgname" -t "$pkgdir"/usr/bin
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/"$pkgname"

  install -dm 755 "$pkgdir"/usr/share/{bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}/
  ./target/release/"$pkgname" completions bash > "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
  ./target/release/"$pkgname" completions fish > "$pkgdir"/usr/share/fish/vendor_completions.d/"$pkgname".fish
  ./target/release/"$pkgname" completions zsh > "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"

  install -dm 755 "$pkgdir"/usr/share/man/man1/
  ./target/release/"$pkgname" manpages "$pkgdir"/usr/share/man/man1
}
