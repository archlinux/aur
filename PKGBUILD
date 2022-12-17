# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Joost Bremmer <contact at madeofmagicandwires dot online>
# Contributor: Bogdan <d0xi at inbox dot ru>
pkgname=cheat
pkgver=4.4.0
pkgrel=4
pkgdesc="Allows you to create and view interactive cheatsheets on the command-line"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/cheat/cheat"
license=('MIT' 'CC0 1.0 Universal')
#makedepends=('auth-tarball-from-git' 'git' 'go' 'pandoc')
makedepends=('git' 'go' 'pandoc')
optdepends=('bash-completion: for bash completions'
            'fzf: Fuzzy Finder integration for bash-completion')
conflicts=("python-$pkgname")
replaces=("python-$pkgname")
backup=("etc/$pkgname/conf.yml")
_commit=36bdb99dcfadde210503d8c2dcf94b34ee950e1d
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'chris.pgp' # Christopher Allen Lane <chris@chris-allen-lane.com>
        'conf.yml'
        "git+https://github.com/cheat/cheatsheets.git#commit=$_commit")
sha256sums=('8694d75896dcb1dfb91ed95ec37f7fe409ad2bde76e66f80b20be24ee92ae3ec'
            '6318f816e4c8f2e9c34b8dc1855adeff58c1254809b8aa86c2b39ed155f3d2b6'
            '7eddb96f22a29b0d4dc1d953cdb047342495230ea3c0cb16f78a1d888e79fa8e'
            'SKIP')

prepare() {
  cd "$pkgname-$pkgver"

#  auth-tarball-from-git --keyring ../chris.pgp \
#    --tag "$pkgver" --prefix "$pkgname-$pkgver" \
#    https://github.com/cheat/cheat.git ../"$pkgname-$pkgver.tar.gz"

  export GOPATH="$srcdir/gopath"
  go mod vendor
  go mod tidy
  go mod verify

  mkdir -p build
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go generate -v "./cmd/$pkgname"
  go build -v -o build "./cmd/$pkgname"

  # Generate man page
  pandoc -s -t man "doc/$pkgname.1.md" -o "doc/$pkgname.1"

  # Clean module cache for makepkg -C
  go clean -modcache
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "scripts/$pkgname.bash" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "scripts/$pkgname.fish" -t "$pkgdir/usr/share/fish/completions/"

  # Conflicts with zsh-suggestions, copy or symlink from the doc folder
#  install -Dm644 "scripts/$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 "scripts/$pkgname.zsh" "$pkgdir/usr/share/doc/$pkgname/_$pkgname"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/$pkgname-LICENSE"
  install -Dm644 "doc/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"

  install -d "$pkgdir/usr/share/$pkgname/cheatsheets/community"
  find "$srcdir/cheatsheets" \
    -maxdepth 1 \
    -type f \
    -perm 644 \
    -exec \
      install -m644 "{}" \
      "$pkgdir/usr/share/$pkgname/cheatsheets/community/" \;
  install -Dm644 "$srcdir/conf.yml" -t "$pkgdir/etc/$pkgname/"
  install -Dm644 "$srcdir/cheatsheets/.github/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/cheatsheets-LICENSE"
}
