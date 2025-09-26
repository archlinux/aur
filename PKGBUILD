# Maintainer: mario.valderrama <mv-aur@ransomware.download>
# Maintainer: matthias.lisin <ml-aur@ransomware.download>
pkgname=ionosctl
pkgver=6.9.4
pkgrel=1
pkgdesc='IONOS Cloud CLI'
arch=('x86_64' 'i686' 'aarch64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/ionos-cloud/ionosctl'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('53e40ed6ccf43d04efda6caa48cfb7c1867973683b3e35dbb4700bb02cf9f791')

build() {
    _commit=$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=1
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
    go build -o "$pkgname" -ldflags "-linkmode=external \
    -X=github.com/ionos-cloud/ionosctl/v6/internal/version.Version=$pkgver
    -X=github.com/ionos-cloud/ionosctl/v6/internal/version.Label=release
    -X=github.com/ionos-cloud/ionosctl/v6/internal/version.GitCommit=${_commit:?}" main.go

    for i in bash zsh fish; do
        ./"$pkgname" completion "$i" >completion."$i"
    done
    # -f to avoid prompt if target-dir exists
    ./"$pkgname" man -f --skip-compression --target-dir "$srcdir"/man1
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" -t "$pkgdir"/usr/bin
    install -Dm644 completion.bash "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
    install -Dm644 completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"
    install -Dm644 completion.fish "$pkgdir"/usr/share/fish/vendor_completions.d/"$pkgname".fish
    install -dm755 "$pkgdir"/usr/share/doc/"$pkgname" "$pkgdir"/usr/share/man/man1
    cp -a docs -T "$pkgdir"/usr/share/doc/"$pkgname"
    cp -rvfT "$srcdir"/man1 "$pkgdir"/usr/share/man/man1
}
