# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-confluent-kafka
pkgver=2.5.3
pkgrel=2
pkgdesc="Confluent's Python client for Apache Kafka"
arch=(x86_64)
url="https://github.com/confluentinc/confluent-kafka-python"
license=('Apache-2.0')
depends=('python'
         'librdkafka'
         'glibc'
         'python-requests'
         'python-protobuf'
         'python-urllib3'
         'python-fastavro'
         'python-avro'
         'python-jsonschema'
         'python-protobuf')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
             'python-sphinx'
             'python-sphinx_rtd_theme')
changelog="CHANGELOG.md"
source=("$pkgname-$pkgver.tar.gz::https://api.github.com/repos/confluentinc/confluent-kafka-python/tarball/refs/tags/v$pkgver")
b2sums=('12d2ee31567282e35090ed7b15ec81bb40eaf24f0707679d78b0ed9db3ecef399c36ae5688d01dc6436d8b0bac43d0df3f4dc1ee2f0f09805db12d78369b0ffa')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
    sphinx-build docs docs/build --builder man
}

package(){
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.md -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "docs/build/confluent-kafka.1" -t "$pkgdir/usr/share/man/man1/"
    rm "$pkgdir/usr/LICENSE.txt"
}
