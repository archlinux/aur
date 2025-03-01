# Maintainer: Matthias Kunnen <matthias.kunnen@gmail.com>
# shellcheck disable=SC2034,SC2164
pkgname=opn
pkgver=0.3.1
pkgrel=1
pkgdesc='Open files with the chosen application from the terminal'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7l' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/MatthiasKunnen/$pkgname"
license=('AGPL-3.0-or-later')
makedepends=(
	git
	'go>=1.23'
)
depends=('xdg-utils')

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
# GPG is already used to sign commits and tags but would require users to add the key to their
# keyring which adds friction. For now, we won't use it though this might change later.
#
# The user must be protected from the tag being moved to another commit.
# With the existing system, this requires checksums.
#
# If you want to make sure that these checksums match the source code, clone the repo and use:
# GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_SYSTEM=/dev/null git -c core.abbrev=no archive --format tar v$pkgver | b2sum
b2sums=('c8a99540bae3703d7c8ebc751105279b13c3209492ed75621dc0c5660664b96b76c285181213d66dbd3df2f9f701fac0fbb24efd412b6a418a2d2ace6a63f1cd')

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
