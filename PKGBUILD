# Maintainer: Ben Parsons <9parsonsb[at]gmail[dot]com>
# Contributor: Chris Dill <chrisdude134[at]gmail[dot]com>
# Contributor: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Sven Lechner <sven[dot]lechner[at]rwth-aachen[dot]de>

pkgname=act-runner
pkgver=0.2.5
pkgrel=1
pkgdesc="A runner for Gitea Actions based on GitHub's Act"
arch=('x86_64')
url="https://gitea.com/gitea/act_runner"
license=('MIT')
depends=('docker' 'gitea')
provides=('act_runner')
makedepends=('go')
source=("act_runner-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	'act_runner.service'
	'act_runner.yaml')
sha256sums=('SKIP'
	    'd776f0d17d6daf7fdaf1ce36ac7e1b66317d23cf334f644b6f85735313a18e41'
	    'c7daf8870a1b8ac67358b912e0511be1f815345a6b7bd9643050e9c3a48f83e9')

build() {
    cd act_runner

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
	-buildvcs=false \
        -ldflags "-linkmode=external -X main.version=$pkgver"
}

package() {
    cd act_runner
    install -Dm755 act_runner -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/act_runner"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/act_runner"

    # install service
    install -Dm644 "$srcdir/act_runner.service" "$pkgdir/usr/lib/systemd/system/act_runner.service"

    # install config
    install -Dm644 "$srcdir/act_runner.yaml" "$pkgdir/etc/act_runner/act_runner.yaml"
}
