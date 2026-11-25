pkgname=esphome-device-builder
pkgver=1.28.1
pkgrel=1
_frontendver=0.1.387
pkgdesc='Web dashboard for configuring, building and installing ESPHome firmware'
arch=('any')
url='https://github.com/esphome/device-builder'
license=('Apache-2.0')
depends=('python' 'esphome>=2026.10.2' 'python-aiohttp>=3.9.0'
         'python-aiohttp-asyncmdnsresolver>=0.1.1' 'python-colorlog>=6.8.0'
         'python-cryptography>=42.0.2' 'python-fnv-hash-fast>=2.0.0'
         'python-ifaddr>=0.2.0' 'python-icmplib>=3.0.4' 'python-mashumaro>=3.13'
         'python-orjson>=3.9.0' 'python-yaml>=6.0' 'python-ruamel-yaml>=0.18.0'
         'python-voluptuous>=0.13.1' 'python-zeroconf>=0.150.0' 'git' 'systemd')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
backup=('etc/conf.d/esphome-device-builder')
source=("https://github.com/esphome/device-builder/releases/download/${pkgver}/esphome_device_builder-${pkgver}.tar.gz"
        "https://github.com/esphome/device-builder-frontend/releases/download/${_frontendver}/esphome_device_builder_frontend-${_frontendver}-py3-none-any.whl"
        'esphome-device-builder.service'
        'esphome-device-builder.sysusers'
        'esphome-device-builder.conf')
noextract=("esphome_device_builder_frontend-${_frontendver}-py3-none-any.whl")
sha256sums=('6985d68e2768d290846b1fedee1a273097d92ed38cf655c057d4b349806c5063'
            '0df6aec175fe6b008d807a29222fc2aa163208679f45ce8a546d8513e990179e'
            '037e5438f11f89e92e06eb22f5fa636f728f9c1a54921e6185e0cfbf8e0b0fe9'
            '4f2e4e195b4c4b0aaf71c936e02c0604d12735e17c1b414855de79150b5acdce'
            '648a9427a94c2bcd78763aa4ea2de9f6e62cfe1c84a7ffd61924ce43d1ba9d06')

build() {
    cd "esphome_device_builder-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    # Install the version-matched upstream frontend assets and backend wheel.
    python -m installer --destdir="$pkgdir" \
        "${srcdir}/esphome_device_builder_frontend-${_frontendver}-py3-none-any.whl" \
        "${srcdir}/esphome_device_builder-${pkgver}"/dist/*.whl
    install -Dm644 esphome-device-builder.service \
        "$pkgdir/usr/lib/systemd/system/esphome-device-builder.service"
    install -Dm644 esphome-device-builder.sysusers \
        "$pkgdir/usr/lib/sysusers.d/esphome-device-builder.conf"
    install -Dm600 esphome-device-builder.conf \
        "$pkgdir/etc/conf.d/esphome-device-builder"
}
