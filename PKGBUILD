# Maintainer: Yichuan Gao <aur at gycis dot me>

pkgname=zfs_uploader-git
pkgver=0.9.0.r11.g0b9de48
pkgrel=2
pkgdesc="Simple program for backing up full and incremental ZFS snapshots to Amazon S3"
arch=(any)
url="https://github.com/ddebeau/zfs_uploader"
license=(MIT)
depends=("zfs-utils>=0.8.1" python python-apscheduler python-boto3 python-click)
_backend=(python-setuptools python-wheel) 
makedepends=(git python-build python-installer "${_backend[@]}")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/ddebeau/zfs_uploader"
        "zfs_uploader.service"
        "0001-use-absolute-path.patch")
md5sums=('SKIP'
         'cc654c64ccd1d1e9c1c32c3974d61624'
         'fa0cd0018fe94c6b4a69c28ae9ff8f6b')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git clean -dfx
    patch -p1 -i ../0001-use-absolute-path.patch
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 README.md "${pkgdir}/usr/share/doc/zfs_uploader/README.md"
    install -Dm600 sample_config.cfg "${pkgdir}/etc/zfs_uploader/sample_config.cfg"
    install -Dm644 ../zfs_uploader.service "${pkgdir}/usr/lib/systemd/system/zfs_uploader.service"
}
