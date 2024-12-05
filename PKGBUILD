# Maintainer: taotieren <admin@taotieren.com>

pkgbase=cloud-fs-bin
pkgname=clouddrive
pkgver=0.8.5
pkgrel=1
epoch=2
pkgdesc="CloudDrive - Unlocking the Unlimited Possibilities of Cloud Storage"
arch=('x86_64' 'aarch64')
url="https://github.com/cloud-fs/cloud-fs.github.io"
license=('custom' 'Commercial')
provides=(${pkgbase%-bin} ${pkgname} ${pkgname}2)
conflicts=(${pkgbase%-bin} ${pkgname} ${pkgname}2)
replaces=()
depends=(
    bash
    fuse
    systemd-libs)
makedepends=(libarchive)
optdepends=('docker: Pack, ship and run any application as a lightweight container'
    'davfs2: File system driver that allows you to mount a WebDAV folder'
    'clouddrive-decrypt: clouddrive-decrypt is a standalone tool designed to demo how to decrypt files encrypted by CloudDrive2.')
backup=()
options=('!strip' '!debug' '!lto')
install=${pkgname}.install
source=("LICENSE.html::https://raw.githubusercontent.com/cloud-fs/cloud-fs.github.io/gh-pages/eula.html"
    "${pkgname}.install"
    "${pkgname}-${epoch}-x86_64-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${pkgname}-${epoch}-linux-x86_64-${pkgver}.tgz"
    "${pkgname}-${epoch}-aarch64-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${pkgname}-${epoch}-linux-aarch64-${pkgver}.tgz")
sha256sums=('c336f41e259916212c7fdd3e21a26a2faf94d725b5daf686bca501978efbf17e'
            '32d37f9ab2f20170c8938a7bf3349eac152f4ee663f2c630be3ca966f50300bc'
            'eb374fd1de57c81606efe486a9bd8349a0faac9ac19fc3a31abf415df3f50ad7'
            'eeefc029918bfc0914b1a9197b10bfa31823a1ac9ac47ece89113ec671fe1aeb')
noextract=(
    ${pkgname}-${epoch}-x86_64-${pkgver}.tgz
    ${pkgname}-${epoch}-aarch64-${pkgver}.tgz)

_install_path="opt/${pkgname}"

package() {
    cd ${srcdir}
    install -dm777 ${pkgdir}/${_install_path} \
        "${pkgdir}"/media/clouddrive \
        "${pkgdir}"/media/clouddrive-dav

    bsdtar -xf "${pkgname}-${epoch}-${CARCH}-${pkgver}.tgz" --strip-components=2 -C ${pkgdir}/${_install_path}

    #     sed -i 's/\\//g' "${pkgdir}/${_install_path}"/wwwroot/*.js

    chown -R root:root ${pkgdir}/${_install_path}

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/usr/bin/env bash
export LD_LIBRARY_PATH=/opt/clouddrive:\$LD_LIBRARY_PATH

LOCAL_ROOT_PATH="/media/clouddrive"
# The current test can be set 0.9~0.5 which is more stable, there is also test 0.1 available. Adjust the value by yourself.
MAX_QSP_115=0.9

cd /opt/clouddrive
./clouddrive
EOF

    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" <<EOF
[Unit]
Description="CloudDrive"
Wants=network-online.target
After=network-online.target network.target

[Service]
Type=exec
#Environment="LOCAL_ROOT_PATH=/media/clouddrive"
ExecStart=clouddrive

[Install]
WantedBy=multi-user.target
EOF

    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/media-${pkgname}-dav.service" <<EOF
[Unit]
Description=Mount WebDAV filesystem after clouddrive.service
Wants=network-online.target clouddrive.service
After=network-online.target clouddrive.service
PartOf=clouddrive.service

[Service]
ExecStartPre=/usr/bin/sleep 5
ExecStart=/usr/bin/mount -t davfs http://localhost:19798/dav /media/clouddrive-dav
# -o uid=%i,gid=%i
ExecStopPre=/usr/bin/sync /media/clouddrive-dav
ExecStop=/usr/bin/fusermount -u /media/clouddrive-dav
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
EOF

    install -Dm644 /dev/stdin "${pkgdir}/etc/systemd/system/docker.service.d/clear_mount_propagation_flags_clouddrive.conf" <<EOF
[Service]
MountFlags=shared
EOF

    install -Dm644 "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm644 "${srcdir}"/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
