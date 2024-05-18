# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-confluent-kafka
pkgver=2.4.0
pkgrel=1
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
b2sums=('0e677a165432105a4c09bf31a22d6788bd295dbe6a0972a260b1feffebddece225eadbf20d76937105d1750ca23b237e429dc09d65be78dc1291c72a84a236af')

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
