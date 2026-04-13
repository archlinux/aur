# Maintainer: taotieren <admin@taotieren.com>

pkgname=edac-utils
pkgver=0.17
pkgrel=1
pkgdesc="Userspace helper for kernel EDAC drivers (Error Detection and Correction)"
arch=($CARCH)
url="https://github.com/grondo/edac-utils"
license=('GPL-2.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    sh
    glibc
    perl
    sysfsutils
)
makedepends=(
    git
)
backup=()
options=()
install=
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('8a1bfb3c9b74d614e1bd924b8f707161d008b8cd9b13e72b88f72420d8c7c0ab')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    autoreconf -fiv || true
}

build() {
    cd "${srcdir}/${pkgname}/"
    ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
    make
}

# check() {
#     cd "${srcdir}/${pkgname}/"
#     make check
# }

package() {
    cd "${srcdir}/${pkgname}/"
    make DESTDIR="$pkgdir/" install
    install -vDm644 "README" -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm644 "COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vdm755 "${pkgdir}/etc/edac/labels.d"
    install -vDm644 /dev/stdin ${pkgdir}/usr/lib/systemd/system/edac.service <<EOF
[Unit]
Description=Initialize EDAC Drivers For Machine Hardware
Documentation=man:edac-ctl(8)
After=syslog.target

[Service]
Type=oneshot
ExecStart=/usr/sbin/edac-ctl --register-labels
ExecStop=/usr/sbin/edac-ctl --unload
RemainAfterExit=yes
StandardOutput=journal

[Install]
WantedBy=multi-user.target
EOF
}
