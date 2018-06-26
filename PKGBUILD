# Maintainer: Stuart Reilly <stu at reilly-family dot co dot uk>
pkgname=rash-git
pkgver=0.3.1.r25.g0168b95
pkgrel=4
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Rust-based file hashing tool"
license=('MIT' 'Apache')
url="https://github.com/themadprofessor/rash"
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd "$srcdir/${pkgname%-*}"
	cargo build --release
}

package() {
    	cd "$srcdir/${pkgname%-*}"
    	install -Dm755 target/release/rash $pkgdir/usr/bin/rash
	shell=`basename $SHELL`
	case $shell in
		zsh)
			install -Dm644 target/release/build/rash*/out/_rash $pkgdir/usr/share/zsh/site-functions/_rash
			;;
		bash)
			install -Dm644 target/release/build/rash*/out/rash.bash $pkgdir`pkg-config --variable=completionsdir bash-completion`/rash.bash
			;;
		fish)
			dir=${XDG_CONFIG_HOME:-$HOME/.config}
			install -Dm644 target/release/build/rash*/out/rash.fish $pkgdir$dir/fish/completions/rash.fish
			;;
	esac
}
