# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-confluent-kafka
pkgver=2.6.0
pkgrel=3
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
b2sums=('2eafac4f6cbb77f6abbc1ca323c91ff214f84b64a9e7fb3185718095179fca7c7c93002838e5984d44ef7af99fdd2ce3f2427338f5f2f658e61166064f7aa9dc')

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
