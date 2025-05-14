# Maintainer: taotieren <admin@taotieren.com>

pkgbase=cloud-fs-bin
pkgname=clouddrive
pkgver=0.8.18
pkgrel=1
epoch=2
pkgdesc="CloudDrive - Unlocking the Unlimited Possibilities of Cloud Storage"
arch=('x86_64')
url="https://github.com/cloud-fs/cloud-fs.github.io"
license=('LicenseRef-Commercial')
provides=(${pkgbase%-bin} ${pkgname} ${pkgname}2)
conflicts=(${pkgbase%-bin} ${pkgname} ${pkgname}2)
replaces=()
depends=(
    bash
    fuse
    rclone
    systemd-libs
)
makedepends=(
    libarchive
)
optdepends=('docker: Pack, ship and run any application as a lightweight container'
    'davfs2: File system driver that allows you to mount a WebDAV folder'
    'clouddrive-decrypt: clouddrive-decrypt is a standalone tool designed to demo how to decrypt files encrypted by CloudDrive2.'
    'rclone-browser: Simple cross-platform GUI for rclone')
backup=()
options=('!strip' '!debug' '!lto')
install=${pkgname}.install
source=(
    "LICENSE.html::https://raw.githubusercontent.com/cloud-fs/cloud-fs.github.io/gh-pages/eula.html"
    "${pkgname}.install"
    "${pkgname}-${epoch}-x86_64-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${pkgname}-${epoch}-linux-x86_64-${pkgver}.tgz"
    "${pkgname}-${epoch}-aarch64-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${pkgname}-${epoch}-linux-aarch64-${pkgver}.tgz"
)
sha256sums=('c336f41e259916212c7fdd3e21a26a2faf94d725b5daf686bca501978efbf17e'
            'f2d0bffedcfcb542ee07eef4f797dc848703f6d63f0d7b837a89a190dcc09780'
            'd9a846bef62f71a63478b14ff90fc5890a8c889c49ab327683a4fc14d1b54808'
            '2cad8b19957c31dda82804fdce4b97e24c7976860e0f88de11cdb5998366a863')
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
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/rclone-${pkgname}-cd2-dav@.service" <<EOF
[Unit]
Description=Rclone mount for CloudDrive2 WebDAV for user %i
After=network.target

[Service]
User=%i
PermissionsStartOnly=true
ExecStartPre=-/bin/mkdir -p /media/rclone-cd2-dav/%i
ExecStartPre=/bin/chown %i:%i /media/rclone-cd2-dav/%i
ExecStartPre=/bin/touch /var/log/rclone-cd2-dav-%i.log
ExecStartPre=/bin/chmod 644 /var/log/rclone-cd2-dav-%i.log
ExecStartPre=/bin/chown %i:%i /var/log/rclone-cd2-dav-%i.log
ExecStart=/usr/bin/rclone mount --allow-other --log-file=/var/log/rclone-cd2-dav-%i.log --verbose --umask 002 rclone-cd2-dav: /media/rclone-cd2-dav/%i
Restart=on-abort
TimeoutStopSec=60
Environment="RCLONE_CONFIG=/home/%i/.config/rclone/rclone.conf"

[Install]
WantedBy=multi-user.target
EOF

    install -Dm644 /dev/stdin "${pkgdir}/etc/systemd/system/docker.service.d/clear_mount_propagation_flags_clouddrive.conf" <<EOF
[Service]
MountFlags=shared
EOF

    install -Dm644 "${srcdir}"/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
