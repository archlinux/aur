# Maintainer: Neboer <rubinposter@gmail.com>
# Contributor: Neboer <rubinposter@gmail.com>

pkgname=mbctl-git
pkgver=0.9.2
pkgver() {
    cd "$srcdir/Man8S-CTR"
    local v
    v="$(git describe --tags)"
    v="${v#v}"
    printf %s "${v//-/+}"
}

pkgrel=1
pkgdesc='Another container orchestration system. Man8S use yggdrasil as VPN networking, use containerd to maintain containers and images, and use a new kind of config manage various types of dirs of containers.'

arch=('any')
url="https://github.com/Neboer/Man8S-CTR.git"
license=('Apache-2.0')
depends=('yggdrasil' 'python' 'containerd' 'nerdctl' 'python-yaml' 'python-pydantic' 'python-typer' 'python-ruamel-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('mbctl')
provides=('mbctl')
backup=('etc/mbctl/config.yaml')

source=(
    "git+https://github.com/Neboer/Man8S-CTR.git"
    "mbctl-startup.service"
    "mbctl-config.yaml"
)

b2sums=('SKIP'
        '80a7904057440819aacd89a25eb47fd5e8c9d5997778a7ca1e4a872cd5040880863e3f5f1aec188c60a59f96904340857ebd456e507b407c991356d3be17bc15'
        'f57ed2b5a309c1395a6252adc4613325c123986ba23f2e3de569ea0e445b4395dd4d312d281ebd215aa9638ced5eaa9844bb4f89700b3179bec13a61f3b39d20')

prepare() {
    git -C "${srcdir}/Man8S-CTR" clean -dfx
}

build() {
    cd "$srcdir/Man8S-CTR"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"
    install -vDm644 mbctl-startup.service -t "$pkgdir/usr/lib/systemd/system/"
    install -vDm644 mbctl-config.yaml "$pkgdir/etc/mbctl/config.yaml"

    cd "$srcdir/Man8S-CTR"
    python -m installer --destdir "$pkgdir" dist/*.whl
}
