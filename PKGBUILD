# Maintainer: Matthias Kunnen <matthias.kunnen@gmail.com>
# shellcheck disable=SC2034,SC2164
pkgname=opn
pkgver=0.5.0
pkgrel=1
pkgdesc='Open files with the chosen application from the terminal'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7l' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/MatthiasKunnen/$pkgname"
license=('AGPL-3.0-or-later')
makedepends=(
	git
	'go>=1.23'
)
depends=('shared-mime-info' 'xdg-utils')

# While it seems to build at the moment, let's not try our luck.
# https://github.com/golang/go/issues/43505
options=(!lto)

source=("$pkgname::git+$url?signed#tag=v$pkgver")

# Internally, makepkg uses `git archive` and checksums this. See:
# https://gitlab.archlinux.org/pacman/pacman/-/blob/a2d029388c7c206f5576456f91bfbea2dca98c96/scripts/libmakepkg/source/git.sh.in#L164
#
# However, the output of `git archive` is not promised to be stable. See:
# - https://lore.kernel.org/git/a812a664-67ea-c0ba-599f-cb79e2d96694@gmail.com/
# - https://github.blog/open-source/git/update-on-the-future-stability-of-source-code-archives-and-hashes/
# - https://github.com/orgs/community/discussions/46034
# This could lead to these checksums suddenly failing.
#
# The user must be protected from the tag being moved to another commit.
# With the existing system, this requires checksums.
#
# If you want to make sure that these checksums match the source code, clone the repo and use:
# GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_SYSTEM=/dev/null git -c core.abbrev=no archive --format tar v$pkgver | b2sum
b2sums=('490231089b5c17d347bbf3083d17ba2b01930643eb1655372a126911a32d1e34540e73b3bd1108e3ccc8008a481c9931910e81e2fcd2988d09f3a4f2c43461e0')

# Get the key from:
# 1. The aur source under keys/pgp with gpg --import keys/pgp/*.asc
# 2. A keyserver: gpg --receive-keys FINGERPRINT_HERE
validpgpkeys=('B671D7AA931EE8E445553211E4A91905E1F26CB1') # Matthias Kunnen <matthias.kunnen@gmail.com>

build() {
	cd "$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o opn ./cmd/opn
}

package() {
	cd "$pkgname"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	./opn completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/opn"
	./opn completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_opn"
	./opn completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/opn.fish"
}
