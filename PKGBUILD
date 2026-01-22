# Maintainer: Neboer <rubinposter@gmail.com>
# Contributor: Neboer <rubinposter@gmail.com>

pkgname=mbctl-git
pkgver=0.6
pkgver() {
    cd "$srcdir/Man8S-CTR"
    local v
    v="$(git describe --tags)"
    v="${v#v}"
    printf %s "${v//-/+}"
}

pkgrel=2
pkgdesc='Another container orchestration system. Man8S use yggdrasil as VPN networking, use containerd to maintain containers and images, and use a new kind of config manage various types of dirs of containers.'

arch=('any')
url="https://github.com/Neboer/Man8S-CTR.git"
license=('Apache-2.0')
depends=('yggdrasil' 'python' 'containerd' 'nerdctl' 'python-yaml' 'python-pydantic' 'python-typer' 'python-prettytable')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('mbctl')
provides=('mbctl')
backup=('etc/mbctl/config.yaml')

source=(
    "git+https://github.com/Neboer/Man8S-CTR.git"
    "mbctl-startup.service"
)

b2sums=('SKIP'
        '80a7904057440819aacd89a25eb47fd5e8c9d5997778a7ca1e4a872cd5040880863e3f5f1aec188c60a59f96904340857ebd456e507b407c991356d3be17bc15')

build() {
    cd "$srcdir/Man8S-CTR"
    python -m build --wheel --no-isolation
}

package() {
    install -vDm644 mbctl-startup.service -t "$pkgdir/usr/lib/systemd/system/"

    cd "$srcdir/Man8S-CTR"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
