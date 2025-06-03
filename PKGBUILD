# Maintainer: Jat <chat@jat.email>

_pkgname=redis
pkgname=redis-bin
pkgver=8.0.2
pkgrel=1
pkgdesc='An in-memory database that persists on disk.'
arch=('x86_64' 'aarch64')
url='https://redis.io'
license=('RSALv2' 'SSPLv1' 'AGPLv3')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('glibc' 'jemalloc' 'openssl' 'systemd-libs')
makedepends=('libarchive')
backup=(
    'etc/redis/redis.conf'
    'etc/redis/sentinel.conf'
    'etc/default/redis-server'
    'etc/default/redis-sentinel'
    'etc/logrotate.d/redis-server'
    'etc/logrotate.d/redis-sentinel'
)

_deb_url_prefix='https://packages.redis.io/deb/pool/noble/r/re/redis'
_deb_codename='1rl1~noble1'
source=(
    "https://github.com/redis/redis/raw/refs/tags/$pkgver/LICENSE.txt"
    'redis.sysusers'
    'redis.tmpfiles'
)
source_x86_64=("${_deb_url_prefix}-"{sentinel,server,tools}"_$pkgver-${_deb_codename}_amd64.deb")
source_aarch64=("${_deb_url_prefix}-"{sentinel,server,tools}"_$pkgver-${_deb_codename}_arm64.deb")
noextract=("${source_x86_64[@]##*/}" "${source_aarch64[@]##*/}")
sha256sums=('4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40'
            '5f66305c49ba5ed67e777336e0a193c1d2b8ac7ba20a3e3cf0764804b60601f8'
            'e75e37458c8774ca1c01290e211a8805c6fd83bd1d5f8fe8b1907a9ae59d4e49')
sha256sums_x86_64=('a5db8b0f35663643f46a72a601cf0c68d3627126c0f694aac6d8fb9e4a8a52ed'
                   '65c975dec0f55e4f3935662de82ad4e44464c23d47b445adf75beaca25e0e116'
                   '83bca79c3a60967df67b3c230967736777ee3a35b0395c9b7ea5a59bc81d18e0')
sha256sums_aarch64=('b2373b88d6484e6bc2bcb15b763f24bc429f0b08c1659502debb0179c1a9cfa6'
                    '3d075ace5c36a1bc48a5abaca55d570c4a5a1de5af1173f7e6cae96a86b24bd0'
                    'a04f51b3f866f1b613dff7206655e75f79ed3edae95c8a01d7c480dedbf629ab')

prepare() {
    cd "$srcdir"

    for deb in *.deb; do
        mkdir "${deb%%_*}"
        bsdtar -xf "$deb" -C "${deb%%_*}" data.tar.zst
    done

    for zst in */data.tar.zst; do
        bsdtar -xf "$zst" -C "${zst%/*}"
        rm "$zst"
    done
}

package() {
    cd "$srcdir"

    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/redis/LICENSE

    install -Dm644 -t "$pkgdir"/etc/default redis-{sentinel,server}/etc/default/*
    install -Dm644 -t "$pkgdir"/etc/logrotate.d redis-{sentinel,server}/etc/logrotate.d/*
    install -Dm644 -t "$pkgdir"/etc/redis redis-{sentinel,server}/etc/redis/*

    mkdir -p "$pkgdir"/usr/bin
    cp -a -t "$pkgdir"/usr/bin redis-{sentinel,server,tools}/usr/bin/*

    install -Dm755 -t "$pkgdir"/usr/lib/redis/modules redis-server/usr/lib/redis/modules/*
    install -Dm644 -t "$pkgdir"/usr/lib/systemd/system redis-{sentinel,server}/usr/lib/systemd/system/*
    install -Dm644 -t "$pkgdir"/usr/share/bash-completion/completions redis-tools/usr/share/bash-completion/completions/*

    install -Dm644 "$srcdir"/redis.sysusers "$pkgdir"/usr/lib/sysusers.d/redis.conf
    install -Dm644 "$srcdir"/redis.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/redis.conf
}
