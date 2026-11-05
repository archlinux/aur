# Maintainer: aarto <aarto@aur.archlinux.org>
pkgbase=mosaico
pkgname=(mosaico mosaicod python-mosaicolabs)
pkgver=0.7.0
pkgrel=1
pkgdesc='The data platform for robotics and physical AI.'
url='https://mosaico.dev/'
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
options=(!lto)
makedepends=(cargo git python-build python-installer python-poetry-core)
source=(
    "git+https://github.com/mosaico-labs/mosaico.git#tag=v$pkgver"
    mosaicod.sysusers
    mosaicod.tmpfiles
    mosaicod.toml
    mosaicod.service
    mosaico-cleanup.service
    mosaico-cleanup.timer
    mosaico-sandbox.conf
)
b2sums=('18701d43b7473cf7908744c912174540e79162bbbe549e7846b2cea11ccfcae6f40dd0cba3f7b0b94e424a450b25e3fed8fd84328be9d10b23729c4f204fc9bd'
        'aa570c6338969f62ca53092c884b2ff03a01203163f959ff767cf78931234e6652cb5058d419d18d073c37be79a9a9be0ab6a74680fd665ad728709f3666b0e7'
        'c71f6037b38963cd61f70acd832db0d8d1db25bd70d7674f820eabe59c1b7c400582d9d61c0ac23c2c4d7228a42c7e84ee9b45e08b708fc93418452004a8a5ae'
        'fd9bea9a796a83e5557229ef75875f763662edbfac12663c19fb11502b1670f54d355d29be9a4c498094e1dccff21f7dac11f09af4902c65f2e01208deacf50f'
        '983c11c3fbc2e6f48f7541d7a75bfa79c649003519ca1a3b3d916c90fd42afeb38a666cfba9bfe6d250abee7172af9f8d82f1c262846d517bc187e593efaec04'
        '55ec76921e14a2be8b5cd706c751c40ed459d83fa681fdd1ceeeb530945ac137cf51890f28d69c01bfeaa4e8ce34780ae76a93d46a3339a987b49d5396df00c4'
        'c02942279c20fc0321a23cd2e735aba06a911574d8d95f74bd37285cf95bf1890e01e4fe0c0e310faf3a38017dc8161b350baf3c4fb598c4c98d42d4c02f7c18'
        'e1f729a53b82d37f296b8faeac3d30d5d91c1ae4c3609646f9a614702f599aeabdb3aed3b8313cc95884c235162172bbecd037dc16d3602c776a69265e22106b')

prepare() {
    # mosaicod
    cd "${pkgbase}/mosaicod"
    export RUSTUP_TOOLCHAIN=stable
    # TODO: Add back --locked
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    # mosaicod
    cd "${pkgbase}/mosaicod"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export SQLX_OFFLINE=true
    cargo build --frozen --release

    # SDK
    cd "$srcdir/${pkgbase}/mosaico-sdk-py"
    python -m build --wheel --no-isolation
}

package_mosaicod() {
    depends=(glibc libgcc systemd)
    optdepends=('postgresql: for a local PostgreSQL instance')
    backup=('etc/mosaicod/config.toml')
    install=mosaicod.install

    install -Dm755 "$pkgbase/mosaicod/target/release/mosaicod" -t "$pkgdir/usr/bin/"
    install -Dm644 mosaicod.toml "$pkgdir/etc/mosaicod/config.toml"

    install -Dm644 mosaicod.sysusers "$pkgdir/usr/lib/sysusers.d/mosaicod.conf"
    install -Dm644 mosaicod.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/mosaicod.conf"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" \
        mosaicod.service \
        mosaico-cleanup.service \
        mosaico-cleanup.timer
    install -Dm644 mosaico-sandbox.conf "$pkgdir/usr/lib/systemd/system/mosaicod.service.d/10-sandbox.conf"
    install -Dm644 mosaico-sandbox.conf "$pkgdir/usr/lib/systemd/system/mosaico-cleanup.service.d/10-sandbox.conf"
    # TODO: Ship a man page once the mosaico repo provides one
    install -Dm644 "$pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-mosaicolabs() {
    pkgdesc='Python SDK for the Mosaico data platform'
    arch=(any)
    depends=(
        python
        python-av
        python-click
        python-mcap
        python-numpy
        python-pandas
        python-pillow
        python-protobuf
        python-pyarrow
        python-pydantic
        python-rich
        python-rosbags
        python-typer
        python-typing_extensions
    )
    optdepends=(
        'python-mcap-protobuf-support: MCAP bridge'
        'python-scikit-learn: scikit-learn base classes in mosaicolabs.ml'
    )

    # TODO: Drop the examples from the wheel
    python -m installer --destdir="$pkgdir" "$pkgbase"/mosaico-sdk-py/dist/*.whl
    # TODO: Either add the testing module to the wheel or drop the testing command from the wheel
    rm "$pkgdir/usr/bin/mosaicolabs.testing"
    install -Dm644 "$pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_mosaico() {
    pkgdesc="The data platform for robotics and physical AI (meta package)"
    depends=(mosaicod python-mosaicolabs)
    arch=(any)
}
